//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #8 - Times Table using AXI interface
// Student Name:Mia Mijovic
// Date: 12/06/2020
//
// Description: A testbench module to test Ex8 - Times Table using AXI4-Lite
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps

module top_tb(
    	);

	//parameters
	parameter CLK_PERIOD = 10;

	reg clk;
	reg read;
	reg rst;
	reg err;
	reg [2:0] a, b;
	wire[5:0] result;
	wire [31:0] rdata;
	wire [31:0] araddr;

	//create CLK
    	initial begin
       	clk = 1'b0;
       		forever
         	#(CLK_PERIOD/2) clk=~clk;
    	end

	initial begin
	err = 0;
	a = 1;
	b = 1;
	read = 1;
	rst = 0;
	#CLK_PERIOD
	rst = 1;
	#CLK_PERIOD
		forever begin
		#CLK_PERIOD
		$display("result = %b, when a=%b, and b=%b, rdata = %b, araddr=%b", result, a, b, rdata, araddr);
		if ((a==0&&b==0)&&(result!=0))begin
			err = 1;
			$display("*** Test Failed *** result = %b, when a=%b and b=%b", result, a, b);
		end

		//a = a + 1;
		
		end

	end


	//Determine success
      	initial begin
        	#500
        	if (err==0)
          		$display("***TEST PASSED! :) ***");
        	$finish;
      	end
	
	//instance dice module
    	top seven_multiplication(clk, rst, a, b, read, result, rdata, araddr);


endmodule
