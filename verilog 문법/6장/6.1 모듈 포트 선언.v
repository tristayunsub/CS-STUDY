//6.1.1 기본적인 모듈 포트 선언의 예
module test(a, b, e, f);
   input         [7:0] a;
   input signed  [7:0] b;
   output        [7:0] e;
   output signed [7:0] f;
   reg           [7:0] e;


//6.1.2 모듈 포트를 정의하는 여러가지 예

module complex_ports({c,d}, .e(f));
// Nets {c,d} recieve the first port bits.
// Name 'f' is declared inside the module.
// Name 'e' is defined outisde the module.
// Can't use named port connections of first port.

module split_ports(a[7:4], a[3:0]);
// First port is upper 4 bits of 'a.
// Second port is lower 4 bits of 'a'.
// Can't use named port connections because of part-select port 'a'.

module same_port(.a(i), .b(i));
// Name 'i' is declared inside the module as a inout port.
// Names 'a' and 'b' are defined for port connections.

