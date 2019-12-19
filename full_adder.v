module fa (a, b, sum, cin, cout);
input 	a,b;
input 	cin;
output 	sum;
output 	cout;

wire 	a_xor_b;

/* Calculate sum for a and b */
assign 	a_xor_b 	= a ^ b;
/* Calculate sum for (a+b) + carry in ) */
assign 	sum 		= a_xor_b ^ cin;
/*  Calc carry out     Cin = 0        Cin = 1		*/
assign 	cout		= ( a & b ) | ( a_xor_b & cin );
endmodule


