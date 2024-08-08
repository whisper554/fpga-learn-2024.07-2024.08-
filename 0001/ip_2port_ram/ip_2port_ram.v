module ip_2port_ram(
    input wire sys_clk,             // clk
    input wire sys_rst_n          // rst
);

wire             ram_en_a      ;   
wire             ram_we_a      ;
wire             ram_en_b      ; 
wire    [5:0]    ram_addr_a    ;
wire    [5:0]    ram_addr_b    ;
wire    [7:0]    ram_wr_data ;  
wire    [7:0]    ram_rd_data ;  
wire    rd_flag;

ram_wr u_ram_wr(
.sys_clk (sys_clk),
.sys_rst_n (sys_rst_n),
.ram_en_a (ram_en_a),
.ram_we_a (ram_we_a),
.ram_addr_a (ram_addr_a),
.ram_wr_data (ram_wr_data),
.rd_flag (rd_flag)
);

ram_rd u_ram_rd(
.sys_clk (sys_clk),
.sys_rst_n (sys_rst_n),
.ram_en_b (ram_en_b),
.ram_addr_b (ram_addr_b),
.ram_rd_data (ram_rd_data),
.rd_flag (rd_flag)
);
    
blk_mem_gen_1 u_blk_mem_gen_1 (
.clka(sys_clk),    // input wire clka
.ena(ram_en_a),      // input wire ena
.wea(ram_we_a),      // input wire [0 : 0] wea
.addra(ram_addr_a),  // input wire [5 : 0] addra
.dina(ram_wr_data),    // input wire [7 : 0] dina

.clkb(sys_clk),    // input wire clkb
.enb(ram_en_b),      // input wire enb
.addrb(ram_addr_b),  // input wire [5 : 0] addrb
.doutb(ram_rd_data)  // output wire [7 : 0] doutb
);

ila_0 u_ila_0 (
	.clk(sys_clk), // input wire clk

	.probe0(sys_clk), // input wire [0:0]  probe0  
	.probe1(sys_rst_n), // input wire [0:0]  probe1 
	.probe2(ram_en_a), // input wire [0:0]  probe2 
	.probe3(ram_we_a), // input wire [0:0]  probe3 
	.probe4(ram_addr_a), // input wire [5:0]  probe4 
	.probe5(ram_wr_data), // input wire [7:0]  probe5 
	.probe6(rd_flag), // input wire [0:0]  probe6 
	.probe7(ram_en_b), // input wire [0:0]  probe7 
	.probe8(ram_addr_b), // input wire [5:0]  probe8 
	.probe9(ram_rd_data) // input wire [7:0]  probe9
);

        endmodule