`ifndef MEM_IP_MONITOR_SV
`define MEM_IP_MONITOR_SV


//clasa este de ajutor pentru scoreboard

class mem_ip_monitor;
  
  mem_base_object mem_object;
  mem_scoreboard  sb;
  virtual ALU_1      ports;
// virtual ALU_1 ports....arata ca interfata respectiva se poate inlocui in functie de context -> polimorfism POO
//functia are rolul de a initializa parametrii obiectului din acewasta clasa //(prin pointerul this),cu date din sb si din //interfata
  function new (mem_scoreboard sb,virtual ALU_1 ports);
    begin
      this.sb    = sb;
      this.ports = ports;
    
    end
  endfunction




  
//sarcina are rolul de a afisa intrarile furnizate de interfata

task input_monitor();
  begin
    while (1) begin
      @ (posedge ports.clk);
      	      	
      mem_object = new();
      $display("input_monitor : ALU inputs: A : %x , B :%x , alu_control: %x, Time : %x", 
            ports.a,ports.b,ports.alu_control,$time);
      
      
//strict pentru scoreboard
//se initializeaza obiectul mem_object cu datele obtinute in mod direct de la interfata
       mem_object.alu_control = ports.alu_control;
       mem_object.a = ports.a;
       mem_object.b = ports.b;
       sb.post_input(mem_object);
	 
	 
         
      
  		end
    end
 
endtask
endclass


`endif