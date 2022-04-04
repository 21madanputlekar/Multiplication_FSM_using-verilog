`timescale 1ns / 1ps

/************************* Register Module for data of A **********************/

module PIPO1(
    input [15:0] din,
    input ld,
    input clk,
    output reg [15:0] dout
    );

always@(posedge clk)

    if(ld)
            dout<= din;

endmodule

/************************* Register Module for data of P **********************/

module PIPO2(
    input [15:0] din,
    input ld,
     input clr,
    input clk,
    output reg [15:0] dout
    );

always@(posedge clk)

    if(clr)
            dout<= 16'b0;
            
    else if (ld)     
            dout<= din;

endmodule

/************************* Adder module for (A+P) **********************/

module ADD (out,in1,in2);
input [15:0] in1,in2;
output reg [15:0] out;

always@(*)
        out = in1 + in2 ;
        
endmodule

/*********** Comparator module for checking if B = zero or not ***************/

module EQZ (eqz,data);
input [15:0] data;
output eqz;

assign eqz = (data == 0); // eqz is assigned '1' , if data is equal to '0' //

endmodule

/************************* Down-counter module for B **********************/
module CNTR (
    input [15:0] din,
    input ld,
    input dec,
    input clk,
    output reg [15:0] dout
    );

always@(posedge clk)
        
        if(ld)              // if load is active, load data into register of B //
            dout<= din;
                
        else if(dec)       // If decrement signal is active, then decrement value of B //
            dout <= dout-1;
            
endmodule
