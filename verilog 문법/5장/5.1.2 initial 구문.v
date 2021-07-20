initial begin
   areg = 0;   //initialize areg
   for (index = 0; index < size; index = index + 1)
   memory[index] = 0;
end

!------------------------------------------------------!
//예 5.1.4 시뮬레이션 입력벡터 생성

initial begin 
        din = 6'b000000; //initialize at time zero
  #10   din = 6'b011001; // first pattern
  #10   din = 6'b011011; // second pattern
  #10   din = 6'b011000; // third pattern
  #10   din = 6'b001000; // last pattern
end

//예5.1.5 주기 신호의 생성

module behave;
   reg a, b; 
   initial begin //초기값 지정 
   a = 1'b1;
   b = 1'b0;
end

  always 
     #50 a = ~a;

  always
     #100 b = ~b;
endmodule