//clasa pentru scoreboard

`ifndef MEM_BASE_OBJECT_SV
`define MEM_BASE_OBJECT_SV
class mem_base_object;
  reg [31:0] a;	// intrare de date
  reg [31:0] b;	// intrare de date
  reg [5:0] alu_control; // permite selectarea operatiei
 
  reg [31:0] result;
  logic zero;
 
endclass
`endif