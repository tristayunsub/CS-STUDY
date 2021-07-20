module mux21_bad(a, b, sel, out);
  input [1:0] a,b;
  input       sel;
  output [1:0] out;
  reg    [1:0] out;

  always @(a or b) // sel is omitted
  if(sel == 0)
      out =a;
  else
      out = b;

endmodule
