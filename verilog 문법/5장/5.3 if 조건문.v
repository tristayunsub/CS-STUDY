//예 5.3.1 if 조건문을 이용한 2:1 멀티플렉서

module mux21_if(a, b, sel, out);
    input [1:0] a, b;
    input       sel;
    output [1:0] out;
    reg    [1:0] out;

    always @ (a or b or sel)
         if(sel == 1'b0) //또는 if(!sel)
             out =a ;
         else 
             out =b;
endmodule

// 예 5.3.2 비동기식 Active-Low set/reset을 갖는 D 플립 플롭
module dff_sr_async(clk, d, rb, sb, q, qb);
       input clk, d, rb, sb;
       output q, qb;
       reg q;
       always @ ( posedge clk or negedge rb or negedge sb)
       begin 
          if(rb == 0)
               q <= 0;
          else if(sb == 0)
               q <= 1;
          else 
               q <= d;
       end
    
    assign qb = ~q;
endmodule

//참고 동기식 Active-Low reset을 갖는 D 플립플롭
module dff_sync_rst(clk, d, rst_n, q, qb);
      input clk, d, rst_n;
      output q, qb;
      reg    q;

      assign qb = ~q;

      always @(posedge clk) //include only clk
      begin
         if(!rst_n)         //active-low reset
            q <= 1'b0;
         else 
            q < d;
    end
endmodule