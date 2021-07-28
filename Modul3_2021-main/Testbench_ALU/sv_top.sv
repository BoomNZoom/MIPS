

`include "interface.sv"
//preluare date din interfata
program alu(ALU_1 ports);
`include "base_object.sv"
`include "scoreboard.sv"
`include "Monitor_input.sv"
`include "Monitor_output.sv"
  
 //declar obiecte scoreboard + monitor
 mem_scoreboard  sb;
 
 mem_ip_monitor ipm;
 mem_op_monitor opm;

  

 
  //Initializez clasele monitoarelor cu valori din scoreboard si interfata
  
initial begin
  sb    = new();
  ipm   = new(sb , ports);// ipm   = new(ports)
  opm   = new(sb , ports);//opm   = new(ports)

  
  
  
//ipm.input_monitor() si opm.output_monitor() se vor executa in acelasi timp cu instructiunile aflate dupa blocul fork_join_none
//nu se asteapta terminarea executiilor din blocul respectiv
fork
ipm.input_monitor();
opm.output_monitor();
join_none
  
  repeat (20) @ (posedge ports.clk);//repeat (20) @ (posedge ports.clock)
end
endprogram