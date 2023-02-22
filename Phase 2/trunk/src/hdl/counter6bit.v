module counter6bit(input clk, rst, output reg[5:0] out, output cntDone);
    always@(posedge clk, posedge rst) begin
	if(rst) out <= 6'b0; else
	out <= out+1;
    end
    assign cntDone = &out;
endmodule
