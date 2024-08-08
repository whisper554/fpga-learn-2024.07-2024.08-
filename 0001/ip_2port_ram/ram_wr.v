module ram_wr(
    input wire sys_clk,             // clk
    input wire sys_rst_n,           // rst
    
    output reg ram_en_a,             // ena
    output reg ram_we_a,              // wea      
    output reg [5:0] ram_addr_a,      // ram_address
    output reg [7:0] ram_wr_data,    // write_data
    output reg rd_flag               //read_flag
);
parameter RW_CNT_MAX = 8'd64;      // CNT_MAX
reg [7:0] rw_cnt;                   // cnt

// rst
always @(posedge sys_clk or negedge sys_rst_n) begin
    if (!sys_rst_n) begin
        ram_en_a <= 1'b0;
        ram_we_a <= 1'b0;
        ram_addr_a <= 6'b0;
        ram_wr_data <= 8'b0;
        rd_flag <= 1'b0;
        rw_cnt <= 8'b0;
    end
end

// ram_en
always @(posedge sys_clk or negedge sys_rst_n) begin
    if (!sys_rst_n)
        ram_en_a <= 1'b0;
    else
        ram_en_a <= 1'b1;
end

// rw_cnt
always @(posedge sys_clk or negedge sys_rst_n) begin
    if (!sys_rst_n)
        rw_cnt <= 8'b0;
    else if( rw_cnt == RW_CNT_MAX - 8'd1 && ram_en_a )
        rw_cnt <= 8'b0;
    else if( ( rw_cnt < RW_CNT_MAX - 8'd1 ) && ram_en_a ) 
        rw_cnt <= rw_cnt + 8'd1;
    else
        rw_cnt <= rw_cnt;
end

// ram_we
always @(posedge sys_clk or negedge sys_rst_n) begin
    if (!sys_rst_n)
        ram_we_a <= 1'b0;
    else
        ram_we_a <= 1'b1;
end

// ram_addr
always @(posedge sys_clk or negedge sys_rst_n) begin
    if (!sys_rst_n)
        ram_addr_a <= 6'b0;
    else if ( rw_cnt == RW_CNT_MAX - 8'd1 && ram_en_a)
        ram_addr_a <= 6'b0;
    else if(ram_en_a)
        ram_addr_a <= ram_addr_a + 6'd1;
    else
        ram_addr_a <= 6'b0;
end

// ram_wr_data
always @(posedge sys_clk or negedge sys_rst_n) begin
    if (!sys_rst_n)
        rw_cnt <= 8'b0;
    else if ( rw_cnt == RW_CNT_MAX - 8'd1 )
        ram_wr_data <= 8'b0;
    else if( ( rw_cnt <=  RW_CNT_MAX - 8'd1 ) && ram_we_a)
        ram_wr_data <= ram_wr_data + 8'd1;
    else
        ram_wr_data <= ram_wr_data;
end

// rd_flag
always @(posedge sys_clk or negedge sys_rst_n) begin
    if (!sys_rst_n)
        rd_flag <= 1'b0;
    else if ( rw_cnt >= RW_CNT_MAX/2 - 8'd1 )
        rd_flag <= 1'b1;
    else
        rd_flag <= rd_flag;
end

        endmodule