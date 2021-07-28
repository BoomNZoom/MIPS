`include "sv_top.sv"
//stabilesc un modul testbench
module PC_tb();

	logic clk;  // activ front pozitiv
	logic rst;  // activ pe 1, sincron
	reg [31:0] next_address;
	reg [31:0] address;

// Connect the interface
PC_1 ports(
 .clk     (clk),
 .rst     (rst),
 .next_address (next_address),
 .address(address)
);

// Connect the program
memory_top top(ports);
reg [2:0] i = 3'b000;
reg [3:0] a = 4'b000;
initial begin
  clk = 0;
  
end	

always #1 clk = ~clk;

  initial begin
   rst = 0;
   next_address = 0;
  for(i = 0;i < 4;i++) begin
    for(a = 0;a < 15;a++) begin 
    #2;
	next_address = next_address + 4;
  	a = a + 1;
	if( a == 15)
	rst = 1;
  	end
  end
   //#10 rst = ~rst;
   //#1 rst = 0;
   
end




  
     
	
  	
initial begin
  $dumpfile("dump.vcd");
  $dumpvars;
end

PC U_PC(
.clk   (clk),
.rst   (rst),
.next_address (next_address),
.address(address)
);
endmodule




