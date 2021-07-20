//Blocking 할당문 예 5.2.1

initial begin 
   reg = 0;                     //reg형 변수에 대한 할당
   regb[3] = 1;                 // 단일 비트에 대한 할당
   regc[3:5] = 7;               // 부분 비트에 대한 할당
   mema[address] = 8'hff;       // 메모리 요소에 대한 할당
   {carry, acc} = rega + regb;  // 결합에 대한 할당
end


//예 nonblocking 할당문과 blocking 할당문의 비교 27번째 줄의 always문의 a,b 변수가 차이난다

module non_blk1;
  output out;
  reg a, b, clk;

  initial begin 
        a = 0;
        b = 1;
        clk = 0;

   end
   
   always clk = #5 ~clk;

   always @ (posedge clk) begin
          a <= b;
          b <= a;

    end
endmodule

//예 5.2.3 blocking 할당문과 nonblocking 할당문의 지연을 갖는 경우
module non_block2;
  reg a, b, c, d, e, f;
//blocking assignments with intra-assignment delay
  initial begin
  a = #10 1;             //a will be assigned 1 at time 10
  b = #2 0;              //b will be assigned 0 at time 12
  c = #4 1;              //c will be assigned 1 at time 16
end

//non-blocking assignments with intra-assignments delay
  initial begin
    d <= #10 1;             //d will be assigned 1 at time 10
    e <= #2  0;             //e wiil be assigned 0 at time 2
    f <= #4  1;             //f will be assigned 1 at time 4

    end
endmodule

//예 5.2.4 nonblocking 할당문의 내부 지연

module multiple2;
  reg a;

  initial a = 1;

  initial begin 
      a <= #4 1;       //schedules a =1 at time 4
      a <= #4 0;       //schedules a = 0 at time 4
      #20 $stop;       //At time 4, a = 0

    end
endmodule

//예 5.2.5 Nonblocking 할당문의 내부 지연을 이용한 주기 신호의 생성
  module multiple;
  reg r1;
  reg [2:0] i;

  initial begin
     r1 = 0;
     for(i =0; i <5; i = i+1)
          r1 <= #(i*10) i[0];
    end
endmodule




