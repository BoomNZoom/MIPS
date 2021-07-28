
// Code your testbench here
// or browse Examples
`include "interface.sv"

program memory_top(PC_1 ports);
`include "base_object.sv"
`include "scoreboard.sv"
`include "Monitor_input.sv"
`include "Monitor_output.sv"
  
  
 mem_scoreboard  sb;
 
 mem_ip_monitor ipm;
 mem_op_monitor opm;

initial begin
  sb    = new();
  ipm   = new(sb , ports);// ipm   = new(ports)
  opm   = new(sb , ports);//opm   = new(ports)
  
fork
ipm.input_monitor();
opm.output_monitor();
join_none
  
  repeat (40) @ (posedge ports.clk);//repeat (20) @ (posedge ports.clock)
end
endprogram