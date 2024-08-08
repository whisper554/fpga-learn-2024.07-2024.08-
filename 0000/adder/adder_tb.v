`timescale 1ns/1ns

module adder_tb();
//寄存器变量初始化
reg ain,bin,cin;

wire so,co;
//原件实例化
adder u_adder(
.ain(ain),
.bin(bin),
.cin(cin),
.so(so),
.co(co)
);
//初始化
initial begin
ain=0;
bin=0;
cin=0;
end
//每隔10ns加一
always#10{ain,bin,cin}={ain,bin,cin}+1;
endmodule
