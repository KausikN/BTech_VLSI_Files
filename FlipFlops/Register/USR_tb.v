`include "USR.v"

module USR_tb;

reg clk, reset;
reg [2:1]select;		// 00 - output		01 - Left Shift		10 - Right Shift 		11 - Write
wire [4:1] q;
reg serialin;

reg [4:1] inp;

initial
	begin
		$dumpfile("USR_tb.vcd");
		$dumpvars(0, USR_tb);
	end

USR srPIPO(inp, serialin, clk, reset, q, select);


initial
	begin
		reset=0;
		clk =0;
		select = 2'b11;
		serialin = 1'b0;

		inp = 4'b1011;
		#10 select = 2'b00;
		
		#10 select = 2'b11;inp = 4'b1111;
		#10 select = 2'b01;
		#10 select = 2'b01;
		#10 serialin = 1'b1;select = 2'b01;
		#10 select = 2'b01;
		#10 select = 2'b11;inp = 4'b1111;
		#10 select = 2'b10;
		#10 select = 2'b10;
		#10 select = 2'b10;
		#10 select = 2'b10;
		#10 select = 2'b00;
		
	end

always #5  
	clk =  ! clk; 

initial
	$monitor($time, ": clk=%b, rst=%b, select=%b, inp=%b, q=%b\n", clk, reset, select, inp, q);

initial
	#100 $finish;

endmodule
