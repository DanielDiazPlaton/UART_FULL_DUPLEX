`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: ITESO
// Engineer: DANIEL DIAZ PLATON
// 
// Create Date: 04.12.2023 01:03:12
// Design Name: 
// Module Name: Ascii_To_Bin
// Project Name: 
//////////////////////////////////////////////////////////////////////////////////


module Ascii_To_Bin(
    input [7:0] ascii,
    output [3:0] bin
    );
    
assign bin = (ascii == 8'b00110000) ? 4'b0000 :  // 0
             (ascii == 8'b00110001) ? 4'b0001 :  // 1
             (ascii == 8'b00110010) ? 4'b0010 :  // 2
             (ascii == 8'b00110011) ? 4'b0011 :  // 3
             (ascii == 8'b00110100) ? 4'b0100 :  // 4
             (ascii == 8'b00110101) ? 4'b0101 :  // 5
             (ascii == 8'b00110110) ? 4'b0110 :  // 6
             (ascii == 8'b00110111) ? 4'b0111 :  // 7
             (ascii == 8'b00111000) ? 4'b1000 :  // 8 
             (ascii == 8'b00111001) ? 4'b1001 :  // 9
             (ascii == 8'b01000001) ? 4'b1010 :  // A
             (ascii == 8'b01000010) ? 4'b1011 :  // B
             (ascii == 8'b01000011) ? 4'b1100 :  // C
             (ascii == 8'b01000100) ? 4'b1101 :  // D
             (ascii == 8'b00101010) ? 4'b1110 :  // *
             (ascii == 8'b00100011) ? 4'b1111 :  // #
             4'b0000;
           
           
endmodule
