/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module cmp_10 (
    input [3:0] alufn,
    input [15:0] a,
    input [15:0] b,
    output reg [15:0] cmp_out
  );
  
  
  
  wire [16-1:0] M_adder_sum_out;
  wire [1-1:0] M_adder_z_;
  wire [1-1:0] M_adder_v;
  wire [1-1:0] M_adder_n;
  reg [4-1:0] M_adder_alufn;
  reg [16-1:0] M_adder_a;
  reg [16-1:0] M_adder_b;
  adder_9 adder (
    .alufn(M_adder_alufn),
    .a(M_adder_a),
    .b(M_adder_b),
    .sum_out(M_adder_sum_out),
    .z_(M_adder_z_),
    .v(M_adder_v),
    .n(M_adder_n)
  );
  
  always @* begin
    M_adder_a = a;
    M_adder_b = b;
    M_adder_alufn = 1'h1;
    
    case (alufn[1+1-:2])
      2'h1: begin
        cmp_out[0+0-:1] = M_adder_z_;
      end
      2'h2: begin
        cmp_out[0+0-:1] = M_adder_n ^ M_adder_v;
      end
      2'h3: begin
        cmp_out[0+0-:1] = M_adder_z_ | (M_adder_n ^ M_adder_v);
      end
      default: begin
        cmp_out[0+0-:1] = 1'h0;
      end
    endcase
    cmp_out[1+14-:15] = 15'h0000;
  end
endmodule
