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

    wire [NUMBITS:0] Carry;
    wire [NUMBITS-1:0] Sum;

    assign Carry[0] = 1'b0;
    genvar i;
    generate
        for(i = 0; i < NUMBITS; i = i+1)
        begin
            full_adder new_adder
            (
            .a(A[i])
            .b(B[i])
            .c_in(Carry[i])
            .s(Sum[i])
            .c_out(Carry[i])
            )
        end
    
    endgenerate
    assign result = {w_carry[NUMBITS], Sum};

endmodule
