/**********************************************************************************************
 * Project Name       : Parity MODULE
 * Engineer           : Daniel Diaz Platon
 * Module description : An RTL modelling for Simple-parity-check unit 
 *                      uses Odd, Even and no parity methods.
 * Target             : 5CSXFC6D6F31C6
 * Date               : 2024/05/08
 **********************************************************************************************/

module Parity(
  input wire         reset_n,     //  Active low reset.
  input wire  [7:0]  data_in,     //  The data input from the InReg unit.
  input wire  [1:0]  parity_type, //  Parity type agreed upon by the Tx and Rx units.

  output reg         parity_bit   //  The parity bit output for the frame.
);

//  Encoding for the parity types
localparam NOPARITY00 = 2'b00,
           ODD        = 2'b01,
           Even       = 2'b10,
           NOPARITY11 = 2'b11;

//  parity logic with Asynch active low reset 
always @(*)
begin
  if (~reset_n) begin
    //  No parity bit
    parity_bit <= 1'b1;
  end
  else
  begin
    case (parity_type)
    NOPARITY00, NOPARITY11:
    begin
      //  No parity bit
      parity_bit <= 1'b1;
    end
    ODD:
    begin
      //  Odd Parity
      parity_bit <= (^data_in)? 1'b0 : 1'b1;
    end
    Even: 
    begin
      //  Even parity
      parity_bit <= (^data_in)? 1'b1 : 1'b0;    
    end
    default:
    begin
      //  No parity
      parity_bit <= 1'b1;
    end  
    endcase
  end
end

endmodule