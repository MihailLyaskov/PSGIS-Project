`include "alu.v"
module test_alu;

reg [31:0] 	a,b;
reg [1:0] 	op;
reg cin;
wire cout, ovfl;
wire [31:0] result;

alu alu(a, b, cin, cout, ovfl, op, result);

initial begin
	op = `add; 	cin = 0; 	a = 15; 		b = 15;
#5 	op = `addc; cin = 1;	a = 'h7FFF_FFFF; b = 'h7FFF_FFFF+1;
#5	op = `sub;	cin = 0;	a = 15;			b = 14;
#5	op = `subc;	cin = 0;	a = 14;			b = 15;
	#10;
end

endmodule
