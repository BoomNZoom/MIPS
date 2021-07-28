//Modul interfata
//Includ intrari,iesiri si modul auxiliar de clock...
//Interfata se leaga la program si prin aceasta se preiau date de la DUT
//in functie de situatie,o iesire a DUT-ului trebuie considerata intrare in interfata
//nu merge asa usor cu copy-paste
//A se vedea si diferenta dintre tipurile reg si wire
//ambele genereaza probleme specifice sau pot fi folosite pentru a solutiona acele probleme(sunt //complementare...somehow)
interface ALU_1(
	  input [31:0] a,	// intrare de date
      input [31:0] b,	// intrare de date
      input [5:0] alu_control,// permite selectarea operatiei
  	  input  wire  clk,
	  output wire zero,			   // flag
      input reg [31:0] result // iesire de date
);
endinterface