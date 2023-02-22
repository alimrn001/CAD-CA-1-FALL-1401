module mux64to1_1600(input [1599:0] in, input [5:0] sel, output [24:0] out);
	assign out = in[25*sel +: 25];
endmodule
