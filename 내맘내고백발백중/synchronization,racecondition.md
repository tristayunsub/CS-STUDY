https://www.youtube.com/watch?v=vp0Gckz3z64&list=PLcXyemr8ZeoT-_8yBc_p_lVwRRqUaN8ET&index=8&ab_channel=%EC%89%AC%EC%9A%B4%EC%BD%94%EB%93%9C

동기화,경쟁조건, 임계영역 설명

하나의 객체를 두개의 스레드가 접근 할 때 생긴 일

상한 귤을 골라내자! 스레드 두개를 사용해서

```
for(귤 in 귤박스) {
   if(귤 상태 is 불량){
         badCounter.increment();//카운트 증가. badCounter 두 스레드가 공유
   }
}

public class Counter {
        private int state = 0;
        public void increment() { state++; }
        public int get() { return state; }
}
```
/*
메모리 상태


state = 0 


cpu T1 
    T2 
멀티태스킹 중간중간에 컨텍스트 스위칭. t1,t2가 귤박스 for문 실행
badcount의 상태가 7이될거라고 기대하는데

항상 이렇게만 동작 하지 않을 수 있다.

state++ 가 cpu에서는  이렇게 읽힘. 
LOAD state to R1 r1이라는 cpu
R1= R1 + 1 레지스터값에 +1 하고 
Store R1 to state
cpu가 알고있는 명령어로 변환되야함.
이 타임이에 cs가 발생함. 스레드 t2가 시작을함.
불량인 상태를보고 increment 메소드 호출.
cpu명령에서보면



*/



/*
동기화 synchronization

여러 프로세스/스레드를 동시에 실행해도 공유데이터의 일관성을 유지하는것

어떻게 동기화 시킬것인가?

cpu에서 단일 명령문이아니라 조합된 명령문

이 중간에서 cs가 발생해서 문제가 발생한거.

cs가 일어나지 않게 하면 되겠네? 근데 이 방법ㅂ은 멀티코어에서 불가능함

한번에 이 메소드를 한 스레드만 실행하게끔 한다.


공유 데이터의 일관성을 보장하기 위해

하나의 프로세스/스레드만 진입해서 실행 가능한영역

critical section(임계 영역) 






```
do{
  entry section
      critical section
  exit section
       remainder secton
  
} while (TRUE)
```



문제 해결책 조건 3가지

1.상호배제 -> 한번에 하나의 스레드만 cs에서 실행


2.progress 진행 -> 만약에 cs가 비어있고, 어떤 프로세싱한 스레드들이 cs에 들어가길 원한다면. 그중하나는 실행될수 있도록 해야한다. 유지성

3. bounded waiting( 한정된 대기)-> 프로세스가 무한정 대기하면 안된다.


thread-unsafe? 를 조심해라.

class api 문서.

날짜 관련해서

SimpleDateFormat이라는 클래스 설명보면

Date formats are not synchronized. it is recommended to create
seperate format instances for each thread. if multiple threads
acccess a format concurrently, it must be synchronized externally.
  

자바에서 기본적으로 사용한다고 믿고 쓰면안된다.

thread safe한지 확인해야함.
