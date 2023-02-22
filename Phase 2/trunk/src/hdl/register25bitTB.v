`timescale 1ns/1ns
module register25bitTB();
	reg [24:0] in;
	reg clk, rst,enable;
	wire [24:0] out;
	
	register25bit rg25(in, clk, rst, enable, out);
	always #5 clk <= ~clk;
	initial begin 
	#0 clk = 0;
	#0 rst = 1; enable = 0; in = 25'b1;
		
	#1 rst = 0; enable = 1;
	#9 in = 25'd5;
	#14 in= 25'd18;
	#3 in = 25'd50;
	#11 in = 25'd80;
	#200 $stop;
	end
endmodule


