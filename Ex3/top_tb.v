//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #3 - Up/Down counter
// Student Name: Mia Mijovic
// Date: 09/06/2020
//
// Description: A testbench module to test Ex3 - counter
// Guidance: start with simple tests of the module (how should it react to each 
// control signal?). Don't try to test everything at once - validate one part of 
// the functionality at a time.
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps

module top_tb(
    );
    
//Todo: Parameters
	parameter CLK_PERIOD = 10;

//Todo: Regitsers and wires
	reg clk;
	reg rst;
	reg direction;
	reg enable;
	reg err;
	reg [7:0] counter_out
	reg [7:0] counter_out_prev

//Todo: Clock generation
	initial begin
	clk = 1'b0;
	forever
		#(CLK_PERIOD/2) clk=~clk;

//Todo: User logic
    	initial begin
	counter_out = 0;
	counter_out_prev = counter_out;
	err = 0;
	direction = 1;
	rst = 0;
	clk = 0;
	enable = 1;
	#6
	forever begin
		#(CLK_PERIOD-6) 
		if (counter_out != counter_out_prev)
		begin
		  $display("***TEST FAILED! tick gap error");
		  err = 1;
		end
		#6
		if((enable&&(counter_out==counter_out_prev))|(!enable&&(counter_out!=counter_prev))) begin
		  $display("***TEST FAILED! enable error");
		  err = 1;
		end
		if((direction&&(counter_our!=counter_out_prev+1))|(!direction&&(counter_out!=counter_out_prev=1))) begin
		  $display("***TEST FAILED! direction error");
		  err = 1; 
		end
		if(rst&&(counter_out!=0)) begin
		  $display("***TEST FAILED! rst error");
		  err = 1;
		end
	counter_out_prev = counter_out;
	
	end


//Todo: Finish test, check for success
      initial begin
        #50 
        if (err==0)
          $display("***TEST PASSED! :) ***");
        $finish;
      end


//Todo: Instantiate counter module
	counter top(
	.rst (rst),
	.enable (enable),
	.direction (direction),
	.clk (clk),
	.counter_out (counter_out));
 
endmodule 
