module ram_rw(
    input wire sys_clk,             // clk
    input wire sys_rst_n,           // rst
    input [7:0] ram_rd_data,         // read_data
    
    output reg ram_en,              // ena
    output reg ram_we,              // wea      
    output reg [4:0] ram_addr,      // ram_address
    output reg [7:0] ram_wr_data    // write_data
);
parameter RW_CNT_MAX = 8'd64;      // CNT_MAX
reg [7:0] rw_cnt;                   // cnt

// rst
always @(posedge sys_clk or negedge sys_rst_n) begin
    if (!sys_rst_n) begin
        ram_en <= 1'b0;
        ram_we <= 1'b0;
        ram_addr <= 5'b0;
        ram_wr_data <= 8'b0;
        rw_cnt <= 8'b0;
    end
end

// ram_en
always @(posedge sys_clk) begin
    ram_en <= 1'b1;
end

// rw_cnt
always @(posedge sys_clk) begin
    if( rw_cnt == RW_CNT_MAX - 8'd1 )
        rw_cnt <= 8'b0;
    else if( ( rw_cnt < RW_CNT_MAX - 8'd1 ) && ram_en ) 
        rw_cnt <= rw_cnt + 8'd1;
    else
        rw_cnt <= rw_cnt;
end

// ram_we
always @(posedge sys_clk) begin
    ram_we <= ( rw_cnt <= RW_CNT_MAX/2 - 8'd1 ) ? 8'b1 : 8'b0 ;
end

// ram_addr
always @(posedge sys_clk) begin
    if ( rw_cnt == 5'd31 && ram_en)
        ram_addr <= 5'b0;
    else if(ram_en)
        ram_addr <= ram_addr + 5'd1;
    else
        ram_addr <= 5'b0;
end

// ram_wr_data
always @(posedge sys_clk) begin
    if ( rw_cnt == RW_CNT_MAX/2 - 8'd1 )
        ram_wr_data <= 8'b0;
    else if( ( rw_cnt <=  RW_CNT_MAX/2 - 8'd1 ) && ram_we)
        ram_wr_data <= ram_wr_data + 8'd1;
    else
        ram_wr_data <= ram_wr_data;
end

ila_0 u_ila_0 (
	.clk(sys_clk), // input wire clk


	.probe0(sys_clk), // input wire [0:0]  probe0  
	.probe1(sys_rst_n), // input wire [0:0]  probe1 
	.probe2(ram_rd_data), // input wire [7:0]  probe2 
	.probe3(ram_en), // input wire [0:0]  probe3 
	.probe4(ram_we), // input wire [0:0]  probe4 
	.probe5(ram_addr), // input wire [4:0]  probe5 
	.probe6(ram_wr_data) // input wire [7:0]  probe6
);

endmodule