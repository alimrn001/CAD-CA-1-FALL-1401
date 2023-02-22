module register25bit(input [24:0] in, input clk, rst, enable, output reg [24:0] out);
	always@(posedge clk) begin
		if(rst)
			out <= 25'b0;
		else if(enable)
			out <= in;
	end
endmodule
