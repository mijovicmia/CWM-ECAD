//////////////////////////////////////////////////////////////////////////////////
// Exercise #6 
// Student Name:Mia Mijovic
// Date: 10/06/2020
//
//
//  Description: In this exercise, you need to design a multiplexer between a dice and traffic 
//  lights, where the output acts according to the following truth table:
//
//  sel | out
// -----------------
//   0  | dice
//   1  | traffic lights
//
//  inputs:
//           rst, clk, button,sel
//
//  outputs:
//           result[2:0]
//
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

module multiplexer(
	input clk,
	input rst,
	input button,
	input sel,
	output wire [2:0] result
	); 

	//wires & registers
	wire [2:0] throw;
	wire [2:0] lights;
		

	//logic
	traffic_lights lights_out(clk, lights[2], lights[1], lights[0]);
	dice dice_out(clk, rst, button, throw);

	mux choice(throw, lights, sel, result);


endmodule
