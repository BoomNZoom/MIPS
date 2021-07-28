`ifndef MEM_SCOREBOARD_SV
`define MEM_SCOREBOARD_SV

class mem_scoreboard;
//generez un array asociativ cu dimensiuni nespecificate
//tipul elementului din array este mem_base_object
  mem_base_object mem_object [*];

  // metoda este folosita pentru a stoca date

task post_input (mem_base_object  input_object);
  begin
    mem_object[input_object.result] = input_object;
  end
endtask
  // post_output se foloseste pentru a compara datele de iesire cu cele asteptate
  
  
  
task post_output (mem_base_object  output_object);
  
  
  begin
   // Verific daca datele obtinute sunt si in scoreboard
   //daca elementele din mem object nu sunt 0,atunci 
    $display("Output obj.result : %x",output_object.result);
    
    if (mem_object[output_object.result] != null) begin
      
   //atribuire
      mem_base_object  in_mem = mem_object[output_object.result];
      
   //afisare date obtinute
      $display("scoreboard : Found result %x in list",output_object.result);
      
   //comparatie dintre datele obtinute si cele asteptate + afisare mesaje
      if (output_object.result != in_mem.result)  begin
        
        $display ("Scoreboard : Error : Exp data and Got data don't match");
        $display("             Expected -> %x",
          in_mem.result);
        $display("             Got      -> %x",
          output_object.result);
      end else begin
        $display("Scoreboard : Exp data and Got data match");
      end
   end 
  end 
endtask

endclass

`endif