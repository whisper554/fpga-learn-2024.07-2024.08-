module ram_rd(
    input wire sys_clk,             // clk
    input wire sys_rst_n,           // rst
    
    output reg ram_en_b,              // enb   
    output reg [5:0] ram_addr_b,      // ram_address
    input [7:0] ram_rd_data,        // read_data
    input  rd_flag                  //read_flag
);
parameter RW_CNT_MAX = 8'd64;      // CNT_MAX
reg [7:0] rw_cnt;                   // cnt

// rst
always @(posedge sys_clk or negedge sys_rst_n) begin
    if (!sys_rst_n) begin
        ram_en_b <= 1'b0;
        ram_addr_b <= 6'b0;
        rw_cnt <= 8'b0;
    end
end

// ram_en_b
always @(posedge sys_clk or negedge sys_rst_n) begin
    if (!sys_rst_n)
        ram_en_b <= 1'b0;
    else
        ram_en_b <= rd_flag;
end

// rw_cnt
always @(posedge sys_clk or negedge sys_rst_n) begin
    if (!sys_rst_n)
        rw_cnt <= 8'b0;
    else if( rw_cnt == RW_CNT_MAX - 8'd1 && ram_en_b )
        rw_cnt <= 8'b0;
    else if( ( rw_cnt < RW_CNT_MAX - 8'd1 ) && ram_en_b ) 
        rw_cnt <= rw_cnt + 8'd1;
    else
        rw_cnt <= rw_cnt;
end

// ram_addr_b
always @(posedge sys_clk or negedge sys_rst_n) begin
    if (!sys_rst_n)
        ram_addr_b <= 6'b0;
    else if ( rw_cnt == RW_CNT_MAX - 8'd1)
        ram_addr_b <= 6'b0;
    else if(rd_flag)
        ram_addr_b <= ram_addr_b + 6'd1;
    else
        ram_addr_b <= 6'b0;
end

        endmodule