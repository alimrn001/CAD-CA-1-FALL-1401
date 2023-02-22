`include "datapath.v"
`include "controlUnit.v"
module permutationFunc(input clk, start, input[1599:0] in, output[1599:0] out, output resultReady);
	wire cntDone;
	wire regWrite, regRst;
	wire[5:0] cnout;
	datapath dp(clk, in, cnout, regRst, regWrite, out);
	controlUnit cu(clk, start, cnout, resultReady, regWrite, regRst);
endmodule