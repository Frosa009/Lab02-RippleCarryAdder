//=========================================================================
// Name & Email must be EXACTLY as in Gradescope roster!
// Name: Fernando Rosales
// Email: frosa009@ucr.edu
// 
// Assignment name: 
// Lab section: 
// TA: 
// 
// I hereby certify that I have not received assistance on this assignment,
// or used code, from ANY outside source other than the instruction team
// (apart from what was provided in the starter file).
//
//=========================================================================

`timescale 1ns / 1ps
`include "full_adder.v"
//  Constant definitions 

module ripple_carry_adder # ( parameter NUMBITS = 16 ) (
    input  wire[NUMBITS-1:0] A, 
    input  wire[NUMBITS-1:0] B, 
    input wire carryin, 
    output reg [NUMBITS-1:0] result,  
    output reg carryout); 

    // ------------------------------
    // Insert your solution below
    // ------------------------------ 

    wire [NUMBITS:0] carry;
    //wire [NUMBITS:0] Carryo;
    wire [NUMBITS-1:0] Sum;

    assign carry[0] = carryin;
    genvar i;
    generate
        for(i = 0; i < NUMBITS; i = i+1)
        begin
            full_adder fa
            (
            .a(A[i]),
            .b(B[i]),
            .c_in(carry[i]),
            .s(Sum[i]),
            .c_out(carry[i+1])
            );
        end
    
    endgenerate

   always @(*) begin
    result = Sum;
    carryout = carry[NUMBITS];
   end

endmodule
