//////////////////////////////////////////////////////////////////////////////////
// Exercise #6 
// Student Name:
// Date: 
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

module top(
	input clk,
	input rst,
	input button,
	input sel,
	output wire [2:0] result
	); 

	//wires & registers
	wire [2:0] throw;
	wire [2:0] light;
		

	//logic
	traffic_lights light_out(clk, light[2], light[1], light[0]);
	dice dice_out(clk, rst, button, throw);

	mux choice(clk, throw, light, sel, result);


endmodule
