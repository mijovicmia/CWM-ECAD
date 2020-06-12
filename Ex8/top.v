//////////////////////////////////////////////////////////////////////////////////
// Exercise #8
// Student Name:Mia Mijovic
// Date: 12/06/2020
//
//  Description: In this exercise, you need to implement a times table of 0..7x0..7
//  using a memory and AXI-4-lite interface.
//
//  inputs:
//           clk, rst, a[2:0], b[2:0], read
//
//  outputs:
//           result[5:0]
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps

module top(
	input clk,
	input rst,
	input [2:0] a,
	input [2:0] b,
	input read,

	output [5:0] result,
	output [31:0] rdata,
	output [31:0] araddr
	);

	//registers and wires
	wire rvalid;
	wire [1:0] rresp;
	wire aaready;
	wire [31:0] araddr;

	assign araddr = {26'b0, a, b};
	assign result = rdata[5:0];


blk_mem_gen_0 blk_mem_gen_0 (
  //.rsta_busy(rsta_busy),          // output wire rsta_busy -- Noa "can write values directly"
  //.rstb_busy(rstb_busy),          // output wire rstb_busy
  .s_aclk(clk),                // input wire s_aclk
  .s_aresetn(rst),          // input wire s_aresetn
  //.s_axi_awaddr(32'b0),    // input wire [31 : 0] s_axi_awaddr  
  //.s_axi_awvalid(1'b0),  // input wire s_axi_awvalid
  //.s_axi_awready(s_axi_awready),  // output wire s_axi_awready
  //.s_axi_wdata(32'b0),      // input wire [31 : 0] s_axi_wdata
  //.s_axi_wstrb(4'b0),      // input wire [3 : 0] s_axi_wstrb
  //.s_axi_wvalid(1'b0),    // input wire s_axi_wvalid
  //.s_axi_wready(s_axi_wready),    // output wire s_axi_wready
  //.s_axi_bresp(s_axi_bresp),      // output wire [1 : 0] s_axi_bresp
  //.s_axi_bvalid(s_axi_bvalid),    // output wire s_axi_bvalid s_a

  .s_axi_araddr(araddr),    // input wire [31 : 0] s_axi_araddr --- {26'b0, a, b}
  .s_axi_arvalid(1'b1),  // input wire s_axi_arvalid
  .s_axi_arready(aaready),  // output wire s_axi_arready
  .s_axi_rdata(rdata),      // output wire [31 : 0] s_axi_rdata ---- 
  .s_axi_rresp(rresp),      // output wire [1 : 0] s_axi_rresp
  .s_axi_rvalid(rvalid),    // output wire s_axi_rvalid
  .s_axi_rready(1'b1)     // input wire s_axi_rready
);

endmodule
