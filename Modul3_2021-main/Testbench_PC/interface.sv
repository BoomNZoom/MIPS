interface PC_1(

	input 		 clk,		    // activ front pozitiv
	input 		 rst,		    // activ pe 1, sincron
	input      [31:0] next_address,
	input wire [31:0] address
);
endinterface