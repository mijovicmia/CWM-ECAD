//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #6 - Dice or Traffic Lights?
// Student Name: Mia Mijovic
// Date: 11/06/2020
//
// Description: A testbench module to test Ex6 - Dice or Traffic Lights?
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

module top_tb(
    );
    
    //Parameters
    parameter CLK_PERIOD = 10;

    //Registers and wires
	reg clk;
	reg err;
	reg rst;
	reg button;
	reg sel;
	reg [2:0] result_prev;
	wire [2:0] result;


	//create CLK
    	initial begin
       	clk = 1'b0;
       		forever
         	#(CLK_PERIOD/2) clk=~clk;
    	end
    
 //Todo: User logic
	initial begin
       	err = 0;
	rst = 1;
	sel = 1;
	button = 1;
	
	#CLK_PERIOD
	rst = 0;
	result_prev = result;
	forever begin
		#CLK_PERIOD
		$display("Result = %b, sel = %b, rst = %b", result, sel, rst);
	end


	end


//Todo: Finish test, check for success
      initial begin
        #300 
        if (err==0)
          $display("***TEST PASSED! :) ***");
        $finish;
      end


    //User's module
    multiplexer top (
	.rst (rst),
	.clk (clk),
	.button (button),
	.sel (sel),
	.result (result)
     );
	
//	dice dice(clk,rst,button,throw);
//	traffic_lights traffic_lights (clk, lights[2], lights[1], lights[0]);
     
endmodule 
