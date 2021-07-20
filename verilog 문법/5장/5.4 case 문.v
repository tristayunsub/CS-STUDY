//5.4.1 case 문을 이용한 2:1 멀티플렉서

module mux21_case(a, b, sel, out);
      input [1:0] a, b;
      input       sel;
      output [1:0] out;
      reg    [1:0] out;

      always @(a or b or sel) begin
         case(sel)
              0 : out = a;
              1 : out = b;

        endcase
    end
endmodule     

//5.4.2 case문을 이용한 디코더

reg [15:0] rega;
reg [9:0] result;

always @ (rega) begin
     case(rega)
       16'd0: result = 10'b0111111111;
       16'd1: result = 10'b1011111111;
       16'd2: result = 10'b1101111111;
       16'd3: result = 10'b1110111111;
       16'd4: result = 10'b1111011111;
       16'd5: result = 10'b1111101111;
       16'd6: result = 10'b1111110111;
       16'd7: result = 10'b1111111011;
       16'd8: result = 10'b1111111101;
       16'd9: result = 10'b1111111110;
       default: result = 10'bx;
    endcase
end


// 예 5.4.3 case 문을 이용한 x와 z의 처리 예
case (select[1:2])
     2'b00         : result = 0;
     2'b01         : result = flaga;
     2'b0x, 2'b0z  : result = flaga ? 'bx : 0;
     2'b10         : result = flagb;
     2'bx0  2'bz0  : result = flagb ? 'bx : 0;
     default       : result = 'bx;
endcase

// 예 5.4.4 case문을 이용한 x와 z의 검출의 예

case(sig)
       1'bz: $display("signal is floating");
       1'bx: $display("signal is unknown");
    default: $display("signal is %b", sig);
endcase

// don't care을 갖는 case 문 dont-care 조건으로 ? 기호 사용 가능.
reg [7:0] ir;
casez(ir)
    8'b1??????? : instrcution1(ir);
    8'b01?????? : instruction2(ir);
    8'b00010??? : instruction3(ir);
    8'b000001?? : instruction4(ir);
endcase

// 예 5.4.6 casex문을 이용한 우선수위 인코더(priority encoder)
module pri_enc_casex(encode, enc);
  input [3:0] encode;
  output [1:0] enc;
  reg   [1:0] enc;

  always @ (encode) begin
     casex(encode)
       4'b1xxx : enc = 2'b11;
       4'b01xx : enc = 2'b10;
       4'b001x : enc = 2'b01;
       4'b0001 : enc = 2'b00;

    endcase
   end
endmodule

//예 5.4.7 case 조건식에 상수 값을 사용한 우선순위 인코더
module pri_enc_case(encode, enc);
    input [3:0] encode;
    output [1:0]  enc;
    reg   [1:0]  enc;

    always @(encode) begin
     case(1)
       encode[3] : enc = 2'b11;
       encode[2] : enc = 2'b10;
       encode[1] : enc = 2'b01;
       encode[0] : enc = 2'b00;
       default   : $display("Error: One of the bits expected ON" );
     endcase
    end
endmodule




