`include "sv_top.sv"
//stabilesc un modul testbench
module ALU_tb();

  reg  [31:0] a;	// intrare de date
  reg [31:0] b;	// intrare de date
  reg [5:0] alu_control; // permite selectarea operatiei
  wire zero;			   // flag
  wire [31:0] result; // iesire de date
  reg clk;

// Leg acel modul la interfata
//In functie de caz,un output al DUT-ului devine un input pentru interfata!
//Pentru interfata conteaza si tipul de date,se foloseste wire pentru multiple drivers si reg pentru assignari
ALU_1 ports(
  .a    (a),
  .b     (b),
  .alu_control (alu_control),
  .zero (zero),
  .result(result),
  .clk(clk)
);


// Leg interfata la acel program
alu top(ports);
  
//reg [2:0] i = 3'b000;
//reg [3:0] a = 4'b000;
  
//incerc generarea unui clock provizoriu pentru sincronizarea monitoarelor si a altor procese
//spre deosebire de pc,nu am clock la input-urile DUT-ului
//clock-ul apare doar in interfata si modulul tb()
initial begin
	clk = 0;
end	
  
always  #1  clk = ~clk;

//Fac alegerea unor stimuli de intrare
//Imi pot alege niste variabile simple,ale caror rezultate le pot intui...sau pot utiliza variabile random pentru a extinde acoperirea functionala
//am mers pe prima varianta
initial begin
 	a = 1;
    b = 1;
  
    //output_object.result = 1;
  
//in functie de valoarea lui alu_control,modulul DUT va efectua o anumita operatie
//aleg sa schimb valoarea respectiva din 2 in 2 ns,pentru a trece prin tot ciclul de operatiuni si a vedea daca totul este in regula
    //alu_control = 6'b100001;
    alu_control = 6'b111111;
  	#2;
    alu_control = 6'b100011;
  
    #2;
    alu_control = 6'b100100;
  
    #2;
  	alu_control = 6'b100101;
    
    #2;
   	
    alu_control = 6'b101011;
  
    #2;
    alu_control = 6'b111101;
    
end


 
     
//bloc care ajuta la generarea diagramelor de timp	
  	
initial begin
  $dumpfile("dump.vcd");
  $dumpvars;
end
// O alta initializare...un alt bloc din care pot prelua date...cu un rol critic...fara de care obtin high z
ALU U_ALU(
  .a  (a),
  .b  (b),
  .alu_control (alu_control),
  .zero(zero),
  .result(result)
);
  
  
  

endmodule




