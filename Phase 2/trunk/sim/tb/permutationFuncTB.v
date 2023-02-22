`timescale 1ns/1ns
module permutationFuncTB();
	reg clk, start;
	reg[1599:0] in;
	wire[1599:0] out;
	wire ready;
	integer i, j, k, N, outFile;
	reg [24:0] fileInMem [0:63];
	reg [24:0] fileOutMem [0:63];

	permutationFunc permFunc(clk, start, in, out, ready);
	always #5 clk <= ~clk;
	initial begin
		#0
		clk = 0; start = 0;

		for(N = 0; N < 30; N = N+1) begin
			outFile = $fopen($sformatf("file/input_%0d.txt", N), "r");
			if(outFile == 0) begin
				$stop;
			end
			else begin
				$fclose(outFile);
				#0 start = 0;
				$readmemb($sformatf("file/input_%0d.txt", N), fileInMem);
				for(i = 0; i < 64; i = i + 1) begin
					in[25*i +: 25] = fileInMem[63-i];
				end
				#6 start = 1;
				#1000;
				for(j=0; j<64; j = j + 1) begin
					fileOutMem[63-j] = out[25*j +: 25];
				end	

				outFile = $fopen($sformatf("file/output_%0d.txt", N), "w");
				for(k = 0; k < 64; k=k+1) begin
					$fwrite(outFile,"%b\n", fileOutMem[k]);
				end
				$fclose(outFile);
			end
		end

		#100 $stop;
	end
endmodule
