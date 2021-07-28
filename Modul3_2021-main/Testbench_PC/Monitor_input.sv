`ifndef MEM_IP_MONITOR_SV
`define MEM_IP_MONITOR_SV
class mem_ip_monitor;
  
  mem_base_object mem_object;
  mem_scoreboard  sb;
  virtual PC_1       ports;

  function new (mem_scoreboard sb,virtual PC_1 ports);
    begin
      this.sb    = sb;
      this.ports = ports;
    
    end
  endfunction


  
  
  

  task input_monitor();
  begin
    while (1) begin
      @ (posedge ports.clk);// @ (posedge ports.clock)
      	      	
      mem_object = new();
      $display("input_monitor : PC input adress-> Address : %x Time : %x", 
            ports.next_address,$time);
      
       mem_object.address = ports.address;
       mem_object.next_address = ports.next_address;
       sb.post_input(mem_object);
	 //mem_object.addr = ports.address;
	 
         
      end
    end
 
endtask
endclass


`endif