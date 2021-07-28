`ifndef MEM_OP_MONITOR_SV
`define MEM_OP_MONITOR_SV
//adaug dubla protectie

//clasa este de ajutor pentru scoreboard
class mem_op_monitor;
  
    mem_base_object mem_object;
    mem_scoreboard  sb;
    virtual  ALU_1       ports;
// virtual ALU_1 ports....arata ca interfata respectiva se poate inlocui in functie de context -> polimorfism POO
//functia are rolul de a initializa parametrii clasei(prin pointerul this),cu date din sb si din //interfata
  function new (mem_scoreboard sb,virtual ALU_1 ports);
    begin
      this.sb    = sb;
      this.ports = ports;
      
    end
  endfunction
  

//sarcina are rolul de a afisa iesirile furnizate de interfata

task output_monitor();
  begin
    while (1) begin
      @ (negedge ports.clk)
        $display("Output_monitor : ALU outputs result : %x ",ports.result);
     
      	mem_object = new();
        $display("Output_monitor : ALU outputs result : %x ,flag %x Time : %x", 
        ports.result,ports.zero,$time);
      	
//pentru scoreboard
//incarc datele furnizate de interfata in clasa mem_object
//aceasta va f folosita pentru a compara datele experimentale
        mem_object.result = ports.result;
       	mem_object.zero = ports.zero;
        sb.post_output(mem_object);
      
      
          
      end
    end
 
endtask
endclass



`endif