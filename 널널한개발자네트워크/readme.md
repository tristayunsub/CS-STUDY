https://www.youtube.com/watch?v=k1gyh9BlOT8&list=PLXvgR_grOs1BFH-TuqFsfHqbh-gpMbFoy&ab_channel=%EB%84%90%EB%84%90%ED%95%9C%EA%B0%9C%EB%B0%9C%EC%9E%90TV

https://www.youtube.com/watch?v=_3Z6uivnsd4&list=PL2fxOURY4wI4gBPkEy1pQngCF_aMOqnRV&index=3&ab_channel=%ED%8F%AC%ED%95%AD%EA%B3%B5%EB%8C%80%ED%86%B5%EC%8B%A0%EB%B0%8F%EC%A0%95%EB%B3%B4%EC%8B%9C%EC%8A%A4%ED%85%9C%EC%97%B0%EA%B5%AC%EC%8B%A4
포항공대 네트웤 학습

개발자를 위한 네트워크. osi 7 layer를 전체 공부하지말고.. 완벽하게 개념만 다루고 있는거다.


개념과 사실이있따. abstraction과 impelementation 

사람이다 라고하는걸 개념이라고한다면. 사실-> 최호성이ㅏ라는 사람. 


김영희 사람 호성이도 사람. 둘다 사람이라는 개념의 실체다. 한마디로 이상이라는것. tcp/ip + http 공부해야되는데 명백하게 구현이다.


유저부터 커널까지 sw라고 본다. osi 7레이어는 

커널에 네트워크와 전송계층 존재. access계층은 hw인데.  

nic과 그위에 driver가있고.. process를 file이라고 추상화. 커널의 구성요소를 추상화했는데 만약에 network고나련된건데. socket이라고 부른다.

tcp/ip socket을 파일형식으로 추상화한 interface가 속해진거다.

어떻게 구현이되는가~ socket이 매우 중요함.

HTTP L7 L4 Transport, L3 NETWORK . ACCESS 식별자 MAC주소. 네트워크. IP주소. Transport단. 포트번호랑

전부다 싸잡아서 어떠한 어떠한 식별자라고한다.

identifier?  그럼 이것들은 무엇에 대한 식별자인가??

user mode layer 1번부터 layer 7까지죠.  전송- 포트, net- ip주소 ipv4 , ipv6. 하드웨어 수준에서 mac주소.

mac-> 네트워크 인터페이스 카드에 대한 식별자다. nic-> 랜카드. 

ip는 -> host에 대한 식별자. host는 뭔가? 인터넷에 연결된 컴퓨터. 네트워크에 연결안되있으면? 

nic카드하나에 여러 ip 주소를 바인딩 가능. vpn 써먹잖아.

**맥주소는 하드웨어주소 바꿀 수있다** 

**포트번호 process 식별자? 서비스? http는 웹에서쓰는. tcp 80번 포트쓴다. 8080쓰는 경우도있다. 그래서 http 포트열어주세요~ **

포트번호 인터페이스 번호? 자기 상황에따라 말하는게 다르다.


