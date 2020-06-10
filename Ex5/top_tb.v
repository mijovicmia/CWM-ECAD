//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #5 - Traffic Lights
// Student Name: Mia Mijovic
// Date: 10/06/2020
//
// Description: A testbench module to test Ex5 - Traffic Lights
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

module top_tb(
    );

    //Parameters
	parameter CLK_PERIOD = 10;
    //Registers and wires
	reg clk;
	wire [2:0] light;
	reg [2:0] light_prev;
	reg err;

	// light[2:0] = [red amber green]

	initial begin
	clk = 1'b0;
	forever
		#(CLK_PERIOD/2) clk=~clk;
	end
	end

	initial begin
	err = 0;
	light_prev = light;
	clk = 0;
	forever begin
	#CLK_PERIOD
	if ((light != 3'b100)&&(light != 3'b110)&&(light != 3'b001)) begin
		err = 1;
		$display("*** Test Failed :( *** light = %b", light);
	end
	else
	if (((light == 3'b110)&&(light_prev != 3'b100))||((light == 3'b001)&&(light_prev != 3'b110))||((light == 3'b010)&&(light_prev != 3'b001))) begin
		err = 1;
		$display("*** Test Failed :( *** light = %b and light_prev = %b", light, light_prev);	

	end
	light_prev = light;
	end
end

      	initial begin
        	#500
        	if (err==0)
          		$display("***TEST PASSED! :) ***");
        	$finish;
      	end

    traffic_lights top (
	.clk (clk),
	.red (light[2]),
	.amber (light[1]),
	.green (light[0])
     );
     
endmodule 


	

	
