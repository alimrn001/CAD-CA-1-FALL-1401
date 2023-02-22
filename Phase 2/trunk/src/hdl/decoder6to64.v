module decoder6to64(input[5:0] in, output [63:0] out);
	assign out = {64{1'b1}} & (1'b1 << in);
endmodule
