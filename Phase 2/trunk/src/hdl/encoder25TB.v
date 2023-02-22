`timescale 1ns/1ns
module encoder25TB();
	reg [24:0] in;
	wire [24:0] out;
	encoder25 encd25(in, out);
	initial begin 
		#0 in = 25'b1111001001001110100010111;
		#10 in = 25'b1001111101000101010111100;
		#10 in = 25'b1010100000000001010101111;
		#10 in = 25'b0110101010000001100000001;
		#10 in = 25'b1101101000001110011011001;
		#10 in = 25'b1010011110001011010100011;
		#100 $stop;
	end
endmodule