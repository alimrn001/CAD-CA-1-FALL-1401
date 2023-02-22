`timescale 1ns/1ns
module decoder6to64TB();
	integer i;
	reg [5:0] in;
	wire [63:0] out;
	decoder6to64 dcd64(in, out);

	initial begin
		#0
		for(i = 0; i < 64; i = i + 1) begin
			in = i; #10;
		end
		#1000 $stop;
	end
endmodule
				
