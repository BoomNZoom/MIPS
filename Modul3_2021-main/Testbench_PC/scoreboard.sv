`ifndef MEM_SCOREBOARD_SV
`define MEM_SCOREBOARD_SV

class mem_scoreboard;
  // Create a keyed list to store the written data
  // Key to the list is address of write access
  mem_base_object mem_object [*];

  // post_input method is used for storing write data
  // at write address
task post_input (mem_base_object  input_object);
  begin
    mem_object[input_object.address] = input_object;
  end
endtask
  // post_output method is used by the output monitor to 
  // compare the output of memory with expected data
task post_output (mem_base_object  output_object);
  begin
   // Check if address exists in scoreboard  
    if (mem_object[output_object.address] != null) begin 
      mem_base_object  in_mem = mem_object[output_object.address];
      $display("scoreboard : Found Address %x in list",output_object.address);
      if (output_object.address != in_mem.address)  begin
        $display ("Scoreboard : Error : Exp data and Got data don't match");
        $display("             Expected -> %x",
          in_mem.address);
        $display("             Got      -> %x",
          output_object.address);
      end else begin
        $display("Scoreboard : Exp data and Got data match");
      end
   end 
  end 
endtask

endclass

`endif