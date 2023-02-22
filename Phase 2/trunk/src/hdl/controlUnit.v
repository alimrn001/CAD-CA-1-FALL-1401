`include "controllerFSM.v"
`include "counter6bit.v"
module controlUnit(input clk, start, output[5:0] cntOut, output ready, regWrite, regRst);
	wire cntDone;
	counter6bit cnt6(clk, ~start, cntOut, cntDone);
	controllerFSM fsm(clk, start, cntDone, regWrite, ready, regRst);
endmodule
