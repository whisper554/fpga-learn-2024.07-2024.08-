module fifo_rd(
    input wire rd_clk,              // clk
    input wire sys_rst_n,           // rst
    input wire rd_rst_busy,        // rst_busy
    
    input wire almost_empty,        // almost_empty
    input wire full,                // full
    
    output reg fifo_rd_en,              // rd_en
    input [7:0] fifo_rd_data        // rd_data
);
parameter FIFO_CNT_MAX = 8'd255;    // CNT_MAX
reg [7:0] fifo_cnt;                 // cnt

reg full_d0;                      // full_d0
reg full_d1;                      // full_d1

// rst
always @(posedge rd_clk or negedge sys_rst_n) begin
    if (!sys_rst_n) begin
        fifo_rd_en <= 1'b0;
        fifo_cnt <= 8'b0;
        full_d0 <= 1'b0;
        full_d1 <= 1'b0;
    end
end

// full_d0
always @(posedge rd_clk or negedge sys_rst_n) begin
    if (!sys_rst_n)
        full_d0 <= 1'b0;
    else if(full && !rd_rst_busy) 
        full_d0 <= 1'd1;
    else
        full_d0 <= 1'd0;
end

// full_d1
always @(posedge rd_clk or negedge sys_rst_n) begin
    if (!sys_rst_n)
        full_d1 <= 1'b0;
    else if(full_d0 && !rd_rst_busy) 
        full_d1 <= 1'd1;
    else
        full_d1 <= 1'd0;
end

//fifo_rd_en
always @(posedge rd_clk or negedge sys_rst_n) begin
    if (!sys_rst_n)
        fifo_rd_en <= 1'b0;
    else if(full_d1 && !rd_rst_busy)
        fifo_rd_en <= 1'b1;
    else if(almost_empty)
        fifo_rd_en <= 1'b0;
    else
        fifo_rd_en <= fifo_rd_en;
end
       
        endmodule