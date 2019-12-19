`define add 	0
`define addc 	1
`define sub 	2
`define subc 	3

module alu (a,b,cin,cout,ovfl,op,result);
input 	[31:0] 	a,b;
input 	[1:0] 	op;
input 			cin;
output			cout,ovfl;
output	[31:0]	result;

wire 	[31:0]  b_internal;
wire 			cin_internal;

fa_32b fa_32b(a, b_internal, result, cin_internal, cout);

// Two's compliment for substraction
assign b_internal 	= 	( op == `sub  || op == `subc) ? (~b + 1): b;
// Use carry in when we have opreations using it
assign cin_internal = 	( op == `addc || op == `subc) ? cin : 0;
// when adding two positive numbers produces a negative result, 
// or when adding two negative numbers produces a positive result. 
// Adding operands of unlike signs never produces an overflow
// https://www.doc.ic.ac.uk/~eedwards/compsys/arithmetic/index.html
assign ovfl 		=	( ( a[31] & b_internal[31] ) != result[31] ) ? 1 : 0;

endmodule

