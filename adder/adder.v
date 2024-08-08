module adder(ain, bin, cin, co, so);
input  ain, bin, cin;
output  co, so;

assign so = ain ^ bin ^ cin;
assign co = (ain ^ bin) & cin | (ain & bin); 

	endmodule