`include "mux64to1_1600.v"
`include "decoder6to64.v"
`include "register25bit.v"
`include "encoder25.v"

module datapath(input clk, input[1599:0] in, input[5:0] cntSelOut, input regRst, regWrite, output[1599:0] out);
	wire[24:0] muxOut;
	wire[24:0] encodeOut;
	wire[63:0] dcdOut;
	
	mux64to1_1600 mux64(in, cntSelOut, muxOut);
	encoder25 encd(muxOut, encodeOut);
	decoder6to64 dcd64(cntSelOut, dcdOut);

	generate
		genvar i;
		for(i = 0; i < 64; i=i+1) begin : cascade
			register25bit reg25(encodeOut, clk, regRst, dcdOut[i], out[25*i +: 25]);
		end
	endgenerate
endmodule
