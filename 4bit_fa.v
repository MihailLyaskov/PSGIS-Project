module fa_4b (a, b, sum, cin, cout);
input [3:0] a,b;
input cin;
output [3:0] sum;
output cout;

wire carry_0_1;
wire carry_1_2;
wire carry_2_3;

fa fa0(a[0], b[0], sum[0], cin		, carry_0_1);
fa fa1(a[1], b[1], sum[1], carry_0_1, carry_1_2);
fa fa2(a[2], b[2], sum[2], carry_1_2, carry_2_3);
fa fa3(a[3], b[3], sum[3], carry_2_3, cout	   );

endmodule


