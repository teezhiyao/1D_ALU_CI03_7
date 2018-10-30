/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module adder_7 (
    input [3:0] alufn,
    input [15:0] a,
    input [15:0] b,
    output reg [15:0] sum_out,
    output reg [2:0] zvn
  );
  
  
  
  reg [15:0] sum;
  
  integer i;
  
  always @* begin
    
    case (alufn[0+1-:2])
      1'h0: begin
        sum = a + b;
      end
      1'h1: begin
        sum = a - b;
      end
      4'ha: begin
        sum = 1'h0;
        for (i = 1'h0; i < b; i = i + 1) begin
          sum = sum + a;
        end
      end
      4'hb: begin
        sum = a * b;
      end
      default: begin
        sum = 11'h457;
      end
    endcase
    sum_out = sum[0+15-:16];
    zvn = (~|sum + (a[15+0-:1] & ~b[15+0-:1] & (~sum[15+0-:1])) | ((~a[15+0-:1]) & (b[15+0-:1]) & sum[15+0-:1]) + sum[7+0-:1]);
  end
endmodule
