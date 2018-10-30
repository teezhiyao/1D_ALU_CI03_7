/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module shift_13 (
    input [3:0] alufn,
    input [15:0] a,
    input [4:0] shift_bit,
    output reg [15:0] shift_out
  );
  
  
  
  always @* begin
    
    case (alufn[0+1-:2])
      2'h0: begin
        shift_out = a << shift_bit[0+4-:5];
      end
      2'h1: begin
        shift_out = a >> shift_bit[0+4-:5];
      end
      2'h3: begin
        shift_out = $signed(a) >>> shift_bit[0+4-:5];
      end
      default: begin
        shift_out = a;
      end
    endcase
  end
endmodule
