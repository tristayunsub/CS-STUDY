// 예 6.3.1 모듈 parameter 값의 변경
module foo(a, b);
    real r1, r2;
    parameter [2:0] A = 3'h2;  //자료형과 범위가 지정된 parameter 선언
    parameter       B = 3'h2;  //자료형과 범위가 지정되지 않은 parameter 선언
    initial begin
         r1 = A;
         r2 = B;
         $display("r1 is %f, r2 is %f", r1, r2);
    end
endmodule

module bar;         //parameter overriding using defparam
       wire a, b;
       defparam U0.A =3.1415;   //A는 3으로 변경됨
       defparam U0.B =3.1415;   //B는 3.1415로 변경됨

    foo U0(a, b); //module instantiation
endmodule


//예 6.3.2 defparam 문에 의한 parameter 값의 변경

module top (clk, in1, in2, o1, o2);
      input       clk;
      input    [0:4] in1;
      input    [0:9] in2;
      output   [0:4] o1;
      output   [0:9] o2;

      annotate U0 ();
      vdff m1(o1, in1, clk);
      vdff m2(o2, in2, clk);
endmodule

//예 6.3.2 defparam 문에 의한 parameter 값의 변경

module vdff(out, in, clk);
     parameter size = 1, delay =1;
     input  [0:size-1] in;
     input clk;
     output [0:size-1] out;
     reg    [0:size-1] out;

     always @(posedge clk)
         # delay out = in;
endmodule

module annotate;
      defparam 
          top.m1.size =5,
          top.m1.delay =10,
          top.m1.size =10,
          top.m1.delay =20,
endmodule


//6.3.3 모듈 parameter 값의 변경
module dffn(q, d, clk);
    parameter BITS =1;
    input  [BITS-1:0] d;
    input            clk;
    output [BITS-1:0] q;

    DFF dff_array [BITS-1:0] (q, d, clk); //instance dff_array
endmodule

module MxN_pipeline(in, out, clk);
      parameter M = 3, N = 4;      // M=width, N=depth
      input  [M-1:0]    in;
      output [M-1:0]    out;
      input             clk;
      wire   [M*(N-1):1] t;

      // #(M) 은 모듈 dffn의 Parameter BITS 값을 재설정
      dffn # (M) p [1:N] ({out,t}, {t,in}, clk);
endmodule



//예 6.3.4
module vdff(out, in, clk);
    parameter size = 5, delay =1;
    input            clk;
    input   [0:size-1] in;
    output  [0:size-1] out;
    reg     [0:size-1] out;

    always @(posedge clk)
        # delay out = in;  // #은 dealy operator임
endmodule

module m (clk, in_a, in_b, in_c, out_a, out_b, out_c);
       input            clk;
       input    [10:1] in_a;
       input    [5:1] in_b;
       input    [4:0] in_c;
       output   [10:1] out_a;
       output   [5:1] out_b;
       output   [4:] out_c;

       vdff # (10, 15)       mod_a(out_a, in_a, clk);
       vdff                  mod_b(out_b, in_b, clk)
       vdff #(.delay(12))    mode_c(out_c, in_c, clk);
endmodule