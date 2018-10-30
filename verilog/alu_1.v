/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module alu_1 (
    input [5:0] alufn,
    input [15:0] a,
    input [15:0] b,
    output reg [15:0] alu,
    output reg [2:0] zvn
  );
  
  
  
  wire [16-1:0] M_add_call_sum_out;
  wire [3-1:0] M_add_call_zvn;
  reg [4-1:0] M_add_call_alufn;
  reg [16-1:0] M_add_call_a;
  reg [16-1:0] M_add_call_b;
  adder_7 add_call (
    .alufn(M_add_call_alufn),
    .a(M_add_call_a),
    .b(M_add_call_b),
    .sum_out(M_add_call_sum_out),
    .zvn(M_add_call_zvn)
  );
  
  wire [16-1:0] M_cmp_call_cmp_out;
  reg [4-1:0] M_cmp_call_alufn;
  reg [1-1:0] M_cmp_call_z;
  reg [1-1:0] M_cmp_call_v;
  reg [1-1:0] M_cmp_call_n;
  cmp_8 cmp_call (
    .alufn(M_cmp_call_alufn),
    .z(M_cmp_call_z),
    .v(M_cmp_call_v),
    .n(M_cmp_call_n),
    .cmp_out(M_cmp_call_cmp_out)
  );
  
  wire [16-1:0] M_bool_call_boole_out;
  reg [4-1:0] M_bool_call_alufn;
  reg [16-1:0] M_bool_call_a;
  reg [16-1:0] M_bool_call_b;
  boole_9 bool_call (
    .alufn(M_bool_call_alufn),
    .a(M_bool_call_a),
    .b(M_bool_call_b),
    .boole_out(M_bool_call_boole_out)
  );
  
  wire [16-1:0] M_shift_call_shift_out;
  reg [4-1:0] M_shift_call_alufn;
  reg [16-1:0] M_shift_call_a;
  reg [6-1:0] M_shift_call_shift_bit;
  shift_10 shift_call (
    .alufn(M_shift_call_alufn),
    .a(M_shift_call_a),
    .shift_bit(M_shift_call_shift_bit),
    .shift_out(M_shift_call_shift_out)
  );
  
  always @* begin
    M_add_call_a = a;
    M_add_call_b = b;
    M_add_call_alufn = alufn[0+3-:4];
    M_cmp_call_alufn = alufn[0+3-:4];
    M_cmp_call_z = M_add_call_zvn[2+0-:1];
    M_cmp_call_v = M_add_call_zvn[1+0-:1];
    M_cmp_call_n = M_add_call_zvn[0+0-:1];
    M_bool_call_a = a;
    M_bool_call_b = b;
    M_bool_call_alufn = alufn[0+3-:4];
    M_shift_call_a = a;
    M_shift_call_shift_bit = b[0+5-:6];
    M_shift_call_alufn = alufn[0+3-:4];
    
    case (alufn[4+1-:2])
      1'h0: begin
        alu = M_add_call_sum_out;
      end
      1'h1: begin
        alu = M_bool_call_boole_out;
      end
      4'ha: begin
        alu = M_shift_call_shift_out;
      end
      4'hb: begin
        alu = M_cmp_call_cmp_out;
      end
      default: begin
        alu = 1'h0;
      end
    endcase
    zvn = M_add_call_zvn;
  end
endmodule