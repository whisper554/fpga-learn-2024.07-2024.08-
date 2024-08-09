module ip_fifo(
    input wire sys_clk,     // clk
    input wire sys_rst_n    // rst
);

wire clk_50m;
wire clk_100m;
wire sys_rst_n;           // rst
wire locked;

wire wr_rst_busy;        // rst_busy
wire empty;               // empty
wire almost_full;         // almost_full
wire fifo_wr_en;          // wr_en
wire [7:0] fifo_wr_data;   // wr_data

wire rd_rst_busy;        // rst_busy
wire almost_empty;        // almost_empty
wire full;                // full
wire fifo_rd_en;              // rd_en
wire [7:0] fifo_rd_data;        // rd_data

assign rst_n = sys_rst_n & locked;

  clk_wiz_0 u_clk_wiz_0
   (
    // Clock out ports
    .clk_out1(clk_50m),     // output clk_out1
    .clk_out2(clk_100m),     // output clk_out2
    // Status and control signals
    .locked(locked),       // output locked
   // Clock in ports
    .clk_in1(sys_clk));      // input clk_in1

fifo_generator_0 u_fifo_generator_0 (
  .rst(~rst_n),                      // input wire rst
  .wr_clk(clk_50m),                // input wire wr_clk
  .rd_clk(clk_100m),                // input wire rd_clk
  .din(fifo_wr_data),                      // input wire [7 : 0] din
  .wr_en(fifo_wr_en),                  // input wire wr_en
  .rd_en(fifo_rd_en),                  // input wire rd_en
  .dout(fifo_rd_data),                    // output wire [7 : 0] dout
  .full(full),                    // output wire full
  .almost_full(almost_full),      // output wire almost_full
  .empty(empty),                  // output wire empty
  .almost_empty(almost_empty),    // output wire almost_empty
  .rd_data_count(rd_data_count),  // output wire [7 : 0] rd_data_count
  .wr_data_count(wr_data_count),  // output wire [7 : 0] wr_data_count
  .wr_rst_busy(wr_rst_busy),      // output wire wr_rst_busy
  .rd_rst_busy(rd_rst_busy)      // output wire rd_rst_busy
);

fifo_wr u_fifo_wr (
.wr_clk(clk_50m),              // clk
.sys_rst_n(sys_rst_n),           // rst
.wr_rst_busy(wr_rst_busy),        // rst_busy
    
.empty(empty),               // empty
.almost_full(almost_full),         // almost_full
    
.fifo_wr_en(fifo_wr_en),          // wr_en
.fifo_wr_data(fifo_wr_data)   // wr_data
);

fifo_rd u_fifo_rd (
.rd_clk(clk_100m),              // clk
.sys_rst_n(sys_rst_n),           // rst
.rd_rst_busy(rd_rst_busy),        // rst_busy
    
.almost_empty(almost_empty),        // almost_empty
.full(full),                // full
    
.fifo_rd_en(fifo_rd_en),              // rd_en
.fifo_rd_data(fifo_rd_data)        // rd_data
);

ila_0 u_ila_0 (
	.clk(sys_clk), // input wire clk


	.probe0(sys_rst_n), // input wire [0:0]  probe0  
	.probe1(clk_50m), // input wire [0:0]  probe1 
	.probe2(wr_rst_busy), // input wire [0:0]  probe2 
	.probe3(empty), // input wire [0:0]  probe3 
	.probe4(almost_full), // input wire [0:0]  probe4 
	.probe5(fifo_wr_en), // input wire [0:0]  probe5 
	.probe6(fifo_wr_data), // input wire [7:0]  probe6 
	.probe7(clk_100m), // input wire [0:0]  probe7 
	.probe8(rd_rst_busy), // input wire [0:0]  probe8 
	.probe9(almost_empty), // input wire [0:0]  probe9 
	.probe10(full), // input wire [0:0]  probe10 
	.probe11(fifo_rd_en), // input wire [0:0]  probe11 
	.probe12(fifo_wr_data) // input wire [7:0]  probe12
);

        endmodule