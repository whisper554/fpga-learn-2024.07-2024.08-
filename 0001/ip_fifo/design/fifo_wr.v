module fifo_wr(
    input wire wr_clk,              // clk
    input wire sys_rst_n,           // rst
    input wire wr_rst_busy,        // rst_busy
    
    input wire empty,               // empty
    input wire almost_full,         // almost_full
    
    output reg fifo_wr_en,          // wr_en
    output reg [7:0] fifo_wr_data   // wr_data
);
parameter FIFO_CNT_MAX = 8'd255;    // CNT_MAX
reg [7:0] fifo_cnt;                 // cnt

reg empty_d0;                      // empty_d0
reg empty_d1;                      // empty_d1

// rst
always @(posedge wr_clk or negedge sys_rst_n) begin
    if (!sys_rst_n) begin
        fifo_wr_en <= 1'b0;
        fifo_wr_data <= 8'b0;
        fifo_cnt <= 8'b0;
        empty_d0 <= 1'b0;
        empty_d1 <= 1'b0;
    end
end

// empty_d0
always @(posedge wr_clk or negedge sys_rst_n) begin
    if (!sys_rst_n)
        empty_d0 <= 1'b0;
    else if(empty && !wr_rst_busy) 
        empty_d0 <= 1'd1;
    else
        empty_d0 <= 1'd0;
end

// empty_d1
always @(posedge wr_clk or negedge sys_rst_n) begin
    if (!sys_rst_n)
        empty_d1 <= 1'b0;
    else if(empty_d0 && !wr_rst_busy) 
        empty_d1 <= 1'd1;
    else
        empty_d1 <= 1'd0;
end

//fifo_wr_en
always @(posedge wr_clk or negedge sys_rst_n) begin
    if (!sys_rst_n)
        fifo_wr_en <= 1'b0;
    else if(empty_d1 && !wr_rst_busy)
        fifo_wr_en <= 1'b1;
    else if(almost_full)
        fifo_wr_en <= 1'b0;
    else
        fifo_wr_en <= fifo_wr_en;
end

// fifo_cnt
always @(posedge wr_clk or negedge sys_rst_n) begin
    if (!sys_rst_n)
        fifo_cnt <= 8'b0;
    else if( fifo_cnt == FIFO_CNT_MAX - 8'd1 && fifo_wr_en )
        fifo_cnt <= 8'b0;
    else if( fifo_cnt < FIFO_CNT_MAX - 8'd1 && fifo_wr_en ) 
        fifo_cnt <= fifo_cnt + 8'd1;
    else
        fifo_cnt <= fifo_cnt;
end

// fifo_wr_data
always @(posedge wr_clk or negedge sys_rst_n) begin
    if (!sys_rst_n)
        fifo_wr_data <= 8'b0;
    else if(fifo_wr_en)
        fifo_wr_data <= fifo_cnt;
    else
        fifo_wr_data <= 8'b0;
end
       
        endmodule