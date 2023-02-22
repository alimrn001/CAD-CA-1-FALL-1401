module controllerFSM(input clk, start, cntDone, output reg regWrite, ready, regRst);
        reg[1:0] nstate, pstate;
	parameter [1:0] S0 = 2'b00, S1 = 2'b01, S2 = 2'b10, S3 = 2'b11;
	
	always@(pstate, start, cntDone) begin
		nstate = 2'b00;
		regWrite = 1;
		regRst = 1;
		ready = 0;
		case(pstate)
			S0: if(start) begin nstate = S1; ready = 0; regWrite = 1; regRst = 1; end
			else begin nstate = S0; ready = 0; regWrite = 1; regRst = 1; end
			S1 : if(cntDone) begin nstate = S2; ready = 0; regWrite = 1; regRst = 0; end
			else begin nstate = S1; ready = 0; regWrite = 1; regRst = 0; end
			S2 : begin nstate = S3; ready = 0; regWrite = 1; regRst = 0; end
			S3 : if(start) begin nstate = S3; ready = 1; regWrite = 0; regRst = 0; end
			else begin nstate = S0; regWrite = 0; ready = 1; regRst = 0; end
		endcase
	end

	always@(posedge clk) begin
		pstate <= nstate;
	end
endmodule
