`timescale 1ns/1ns
module mux64to1_1600TB();
	reg [1599:0] in;
	reg [5:0] sel; 
	wire [24:0] out;
	integer i, j;
	mux64to1_1600 mux64_1600(in, sel, out);
	initial begin
		#0
		for(i = 0; i < 64; i = i + 1) 
			in[25*i +: 25] = i*i;
		#5;
		for(j = 0; j < 64; j = j + 1) begin
			sel = j; #10;
		end
		
		#15000 $stop;
	end
endmodule
