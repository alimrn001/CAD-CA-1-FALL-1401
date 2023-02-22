`timescale 1ns/1ns
module counter6bitTB();
	reg clk_, rst_;
	wire[5:0] out_;
	wire cntDone_;
	counter6bit cntr6(clk_, rst_, out_, cntDone_);
	
	always #5 clk_ <= ~clk_;
	initial begin 
	#0 rst_ = 1;
	#0 clk_ = 0;

	#12 rst_ = 0;
	#650 $stop;
	end
endmodule
	    
