`ifndef MEM_OP_MONITOR_SV
`define MEM_OP_MONITOR_SV

class mem_op_monitor;
  
    mem_base_object mem_object;
    mem_scoreboard  sb;
    virtual  PC_1       ports;
  
  function new (mem_scoreboard sb,virtual PC_1 ports);
    begin
      this.sb    = sb;
      this.ports = ports;
      
    end
  endfunction


  task output_monitor();
  begin
    while (1) begin
      @ (negedge ports.clk);// @ (posedge ports.clock)
     
      mem_object = new();
      $display("Output_monitor : PC output address-> Address : %x Time : %x", 
          ports.address,$time);
      
      mem_object.address = ports.address;
      mem_object.next_address = ports.next_address;
      sb.post_output(mem_object);
      
      
           //mem_object.addr = ports.address;
      end
    end
 
endtask
endclass



`endif