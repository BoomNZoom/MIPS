`ifndef MEM_BASE_OBJECT_SV
`define MEM_BASE_OBJECT_SV
class mem_base_object;
  reg [31:0] address;
  reg [31:0] next_address;
  //reg [31:0] next_adress;
  // Read = 0, Write = 1
  //bit rd_wr;
endclass
`endif