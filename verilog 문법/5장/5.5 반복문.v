// 예 5.5.1 repeat 문을 이용한 shift-add 방식의 승산기

module multiplier_8b(opa, opb, result);
     parameter SIZE = 8, Longsize = 2*SIZE;
     input [SIZE-1:0]      opa, opb;
     output [LongSize-1:0]  result;
     reg   [Longsize-1:0] result, shift_opa, shift_opb;

     always @(opa or opb) begin
        shift_opa = opa;         //multiplicand
        shift_opb = opb;         //multiplier
        result = 0;
        repeat (SIZE) begin
            if(shift_opb[0])
                 result = result + shift_opa;
            shift_opa = shift_opa <<1;
            shift_opb = shift_opb >>1;

        end
    end
endmodule

// 예 5.5.2 8비트 입력 rega에 포함된 1을 계수로하는 회로

module cnt_one(rega, count);
     input   [7:0] rega;
     output  [3:0] count;
     reg     [7:0] temp_reg;
     reg     [3:0] count;

     always @(rega) begin
       count = 0;
       temp_reg = rega;
       while(temp_reg) begin
             if(temp_reg[0])
                  count = count + 1;

             temp_reg = temp_reg >> 1;
            end
        end
endmodule


//예 5.5.3 for문을 이용한 8비트 우선순위 인코더(priority encoder)
module enc_for(in, out);
   input  [7:0] in;
   output [2:0] out;
   reg    [2:0] out;
   integer      i;

   always @(in) begin  : LOOP
        out=0;
        for(i = 7; i >= 0; i = i-1) begin
            if(in[i]) begin
               out=i;
               disable LOOP;

            end
          end
        end
    endmodule

//예 5.5.4 forever 문을 이용한 주기 신호 생성
module tb_dff;
    reg clk, d;

    dff U1 (clk, d, q);

    initial begin
       clk = 1 'b0;
       forever #10 clk = ~clk;
    end

    initial begin
        d = 1 'b0;
        forever begin
          #15 d = 1 'b1;
          #20 d = 1 'b0;
          #30 d = 1 'b1;
          #20 d = 1 'b0;
        end
    end
endmodule
    