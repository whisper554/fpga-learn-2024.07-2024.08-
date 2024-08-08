`timescale 1ns / 1ns        //·ÂÕæµ¥Î»/·ÂÕæŸ«¶È

module ip_port_ram_tb();

wire             ram_en      ;   
wire             ram_we      ;
wire    [4:0]    ram_addr    ;
wire    [7:0]    ram_wr_data ;  
wire    [7:0]    ram_rd_data ;  

//parameter define
parameter  CLK_PERIOD = 20; //Ê±ÖÓÖÜÆÚ 20ns

//reg define
reg     sys_clk;
reg     sys_rst_n;

//ÐÅºÅ³õÊŒ»¯
initial begin
    sys_clk = 1'b0;
    sys_rst_n = 1'b0;
    #200
    sys_rst_n = 1'b1;
end

//²úÉúÊ±ÖÓ
always #(CLK_PERIOD/2) sys_clk = ~sys_clk;

ip_port_ram u_ip_port_ram(
    .sys_clk          (sys_clk        ),
    .sys_rst_n        (sys_rst_n      ) 
    );
  
  ram_rw u_ram_rw(
.sys_clk      (sys_clk),
.sys_rst_n    (sys_rst_n),
.ram_en       (ram_en),
.ram_we       (ram_we),
.ram_addr     (ram_addr),
.ram_wr_data  (ram_wr_data),
.ram_rd_data  (ram_rd_data)
);
    
blk_mem_gen_0 u_blk_mem_gen_0 (
.clka(sys_clk),    // input wire clka
.ena(ram_en),      // input wire ena
.wea(ram_we),      // input wire [0 : 0] wea
.addra(ram_addr),  // input wire [4 : 0] addra
.dina(ram_wr_data),    // input wire [7 : 0] dina
.douta(ram_rd_data)  // output wire [7 : 0] douta
);  
    
    
    
    

endmodule