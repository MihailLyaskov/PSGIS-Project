`include "alu.v"
module test_alu_1;

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

module test_alu_2;

reg [31:0] 	a,b;
reg [1:0] 	op;
reg cin;
wire cout, ovfl;
wire [31:0] result;

alu alu(a, b, cin, cout, ovfl, op, result);

initial begin
	op = `add; 	cin = 0; a = 5000; b = 6000;
#5 	op = `addc; cin = 1; a = 5000; b = 6000;
#5	op = `sub;	cin = 0; a = 5000; b = 6000;
#5	op = `subc;	cin = 0; a = 5000; b = 6000;
#10;
end

endmodule


module full_adder_test;

reg a, b, cin; 
wire sum, cout;
fa full_adder(a, b, sum, cin, cout);

initial begin
	a=0; b=0; cin=0;
#5  a=0; b=1; cin=0;
#5  a=1; b=0; cin=0;
#5  a=1; b=1; cin=0;
#5  a=0; b=0; cin=1;
#5  a=0; b=1; cin=1;
#5  a=1; b=0; cin=1;
#5  a=1; b=1; cin=1;
#10;
end

endmodule


module full_adder_4bit_test;
reg [3:0] a,b;
reg cin;
wire [3:0] sum;
wire cout;
fa_4b full_adder_4bit (a, b, sum, cin, cout);

initial begin
	a=7; b=7; cin=0; // expect 14
#15	a=7; b=8; cin=0; // expect 15
#15	a=7; b=8; cin=1; // expect 0 and 1 carry
#10;
end

endmodule

module full_adder_32bit_test;
reg [31:0] a,b;
reg cin;
wire [31:0] sum;
wire cout;
fa_32b full_adder_32bit (a, b, sum, cin, cout);

initial begin
	a=2147483647; b=2147483647; cin=0; // expect 4294967295
#15	a=2147483647; b=2147483648; cin=0; // expect 4294967296
#15	a=2147483647; b=2147483648; cin=1; // expect 0 and 1 carry
#10;
end

endmodule
