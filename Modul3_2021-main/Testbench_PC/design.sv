// Code your design here
module PC
(
	input 		      clk,		    // activ front pozitiv
	input 		  	  rst,		    // activ pe 1, sincron
	input      [31:0] next_address,
	output reg [31:0] address
);

always@(posedge clk)
	if(rst)
		address <= {32{1'b0}};	 // initializare circuit
	else
		address <= next_address; // modelare operatie de incarcare
endmodule