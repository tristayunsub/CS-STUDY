https://www.youtube.com/watch?v=Hrxgw1xl2V0&list=PLDV-cCQnUlIY6BXcFfJGbaWanzxhdMZC8&index=4&ab_channel=%EC%BD%94%EB%93%9C%EC%97%86%EB%8A%94%ED%94%84%EB%A1%9C%EA%B7%B8%EB%9E%98%EB%B0%8D




하나의 공가네

두개의 코어, 코어하나당 캐시존재

shared memory

 0 
 
 int a =0

1 2 번코어에도 a=0


shared에도 a=0


코어 1은 a=1 , 코어2: a= -1

쉐어드 메모리 a:0 이건 괜찮은건가?

컴파일러는 코드의 순서를 맘대로 해서 컴파일함


1. a= 3;
2.  b= 10;

한쪽코어에는 a b 순서대로

다른쪽 코어. 멀티코어에서 다른값을 볼 수있기에 생기는 문제

lock free stack 아토믹한 인덱스와 아토믹하지 않은

atomic index와 non atomic memory


  memory order {acquire, release ,acq_rel}
  
  release? atomic int n
  
  a = 3, b = 5
  
  atomic store로 n.store(1)
  
 스토어를 release로 둔다면
 
 
 acquire 
 
 a=10
 
 b=14
 
 n.load().aqcuire
 
 그 뒤로 명령어가 가는게 가능
 
 그러나 그 뒤에있는게 atomic 오퍼레이션 넘어서 앞으로 갈수없음
 
 release는 뒤로 옮길수없음
 
 before after 관계를 만들어낼수 있다.
 
 



