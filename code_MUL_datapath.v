`timescale 1ns / 1ps




module MUL_datapath(eqz, LdA, LdB, LdP, clrP, decB, data_in,clk);

input  LdA, LdB, LdP, clrP, decB,clk;
input [15:0] data_in;
output eqz;
wire [15:0] X,Y,Z,Bout, Bus;



PIPO1 A (Bus,LdA,clk,X);		// Register for A //
PIPO2 P (Z,LdP,clrP,clk,Y);	       // Register for P //
CNTR B(Bus,LdB,decB,clk,Bout);	     // Down counter for B //
ADD AD (Z,X,Y);			   // Adder Module //
EQZ COMP (eqz,Bout);	         // A comparator ,that checks if B = zero or not //



endmodule   