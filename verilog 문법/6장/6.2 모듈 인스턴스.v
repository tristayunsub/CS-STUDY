//예 6.2.1 순서에 의한 매핑
module topmod;
    wire [4:0] v;
    wire c, w;

    modB b1(v[0], v[3], w, v[4]);
endmodule

module modB(wa, wb, c, d);
    inout wa, wb;
    input c, d;

    tranif1      g1(wa, wb, cinvert);
    not #(2, 6) n1(cinvert, int);
    and #(6, 5) g2(int, c, d);
endmodule

//예 6.2.3 이름에 의한 매핑
module topmod;
     wire [4:0] v;
     wire a,b,c,w;

     modB b1(.wb(v[3]), .wa(v[0]), .d(v[4]), .c(w));

endmodule

// 6.2.4 동일 포트에 대한 다중 연결 오류

module text;
      a U0(.i(a),
           .i(b),
           .i(c),
           .i(d),
           .i(e),
           .i(f),
          );
endmodule


// 예 6.2.5 1비트 반가산기 회로의 구조적 모델링
module half_adder(a, b, sum, cout);
       input a, b;
       output sum, cout;
       wire cout_bar;     //생략 가능 (1-bit wire)

       xor U0 (sum, a, b);
       nand   (cout_bar, a, b); 
       not U1 (cout, cout_bar);
endmodule

// 6.2.5 1비트 전가산기 회로
module full_adder(a, b, cin, sum, cout);
      input a, b, cin;
      output sum, cout;
      wire temp_sum, temp_c1, temp_c2; //생략 가능

// half_adder 모듈의 instantiation
   half_adder u0(a, b, temp_sum, temp_c1); //순서에 의한 포트 연결
   half_adder u1(.a(temp_sum),
                 .b(cin),
                 .sum(sum),
                 .cout(temp_c2) ); // 이름에 의한 포트 연결
   or u2(cout, temp_c1, temp_c2); //게이트 프리미티브 인스턴스

endmodule

// 테스트 벤치 코드
module tb_full_adder ;
      reg a, b, cin; 
      integer k;
      
      full_adder U0(a, b, cin, sum, cout);

      initial begin
           forever
               for(k = 0; k < 8 ; k = k+1) begin
                   cin = k/4;
                   b   =(k%4)/2;
                   a   = k%2;
                   #10;
                end
        end
endmodule

//6.2.6 인스턴스 배열을 이용한 구조적 모델링

module bus_driver(busin, bushigh, buslow, enh, enl);
    input [15:0] busin;
    input enh, enl;
    output [7:0] bushigh, buslow;

    driver busar3(busin[15:12], bushigh[7:4], enh);
    driver busar2(busin[11:8],  bushigh[3:0], enh);
    driver busar1(busin[7:4],   buslow[7:4], enl);
    driver busar0(busin[3:0],   buslow[3:0], enl);
endmodule

    driver busar[3:0] (.in(busin),
                       .out({bushigh, buslow}),
                       .en({enh, enh, enl, enl}) );
endmodule








