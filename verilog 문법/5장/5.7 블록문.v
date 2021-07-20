// 예 5.7.1
parameter d = 50;
reg [7:0] r;
begin       // a waveform controlled by sequential delay
        #d r = 8'h35;
        #d r = 8'hE2;
        #d r = 8'h00;
        #d r = 8'hF7;
        #d -> end_wave; // trigger an event called end_wave
end

//예 5.7.2 오름 차순으로 바꾸나 내림차순으로 바꾸나 등가코드가된다.
fork
      #50  r = 8'h35;
      #100  r = 8'hE2;
      #150  r = 8'h00;
      #200  r = 8'hF7;
      #250  -> end_wave;
join


// 5.7.3
fork 
    @enable_a begin
        #ta wa = 0;
        #ta wa = 1;
        #ta wa = 0;
    end
    @enable_b begin
        #tb wb = 1;
        #tb wb = 0;
        #tb wb = 1;
    end
join
