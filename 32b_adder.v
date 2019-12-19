module fa_32b (a, b, sum, cin, cout);
input 	[31:0] 	a,b;
input 			cin;
output 	[31:0] 	sum;
output 			cout;

wire 	[6:0]	inside_carry;

fa_4b fa_4b_0(a[3:0]  , b[3:0]  , sum[3:0]  , cin		     , inside_carry[0]);
fa_4b fa_4b_1(a[7:4]  , b[7:4]  , sum[7:4]  , inside_carry[0], inside_carry[1]);
fa_4b fa_4b_2(a[11:8] , b[11:8] , sum[11:8] , inside_carry[1], inside_carry[2]);
fa_4b fa_4b_3(a[15:12], b[15:12], sum[15:12], inside_carry[2], inside_carry[3]);
fa_4b fa_4b_4(a[19:16], b[19:16], sum[19:16], inside_carry[3], inside_carry[4]);
fa_4b fa_4b_5(a[23:20], b[23:20], sum[23:20], inside_carry[4], inside_carry[5]);
fa_4b fa_4b_6(a[27:24], b[27:24], sum[27:24], inside_carry[5], inside_carry[6]);
fa_4b fa_4b_7(a[31:28], b[31:28], sum[31:28], inside_carry[6], cout			  );

endmodule

