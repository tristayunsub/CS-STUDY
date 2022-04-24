No-preemption 리소스 반환은 오직 그 리소스를 취득한 프로세스만 할 수 있다.


데드락 방지 

네가지 조건중 하나가 충족되지 않게 시스템을 디자인

리소스를 공유가능하게 함. 이건 불가능함. 상호배제 mutual exclusion
프로세스를 동시에 사용하는건 불가능

2. hold and wait

사용할 리소스들을 모두 획득한 뒤에 시작? 또는 리소스를 전혀 가지지 않은 상태에서만 요청

차2가 직진하려할때 3번과 2번을 모두 확보한상태에서. 2번 리소스 취득 성공하면 이런저런작업후에

3번리소스 취득하려한다면 2번을 반납하게끔. 릴리즈 한다음에 2번과 3번 둘다 획득 가능하다면 

획득할수없다면 다른 프로세스가 2번 리소스 획득하게끔 기회를 준다.

이 방법 단점. 2 3 을 모두 확보해야만 실행이된다면. 2번하다 오래걸리는 작업이라면 3번은 놀고있겠죠

리소스 활용 효율이 떨어지고, 2번은 출발을 아예 못함. starvation이라고함



데드락 무시? 아 몰라 개발자가 알아서 하겠지

그럼 프로그래밍 레벨에서 데드락 .


```
class Main {
  public static void main(String[] args) {
     Object lock1 = new Object();  
     Object lock2 = new Object();

    Thread t1 = new Thread(() -> {....});//동작방식

    Thread t2 = new Thread(() -> {....});

    t1.start();
    t2.start();
    
  }
}


Thread t1 = new Thread(() -> {
  syncrhonized(lock1) {//첫번째 락을 쥐고 critical section들어감
    System.out.println("[t1] get lock1");
    syncrhonized(lock2) { //락2 취득하려고 시도 만약에 성공하면 t1이 2번째 락도 취득
    System.out.println("[t1] get lock2");
  }
  }
});



Thread t2 = new Thread(() -> {
  syncrhonized(lock2) {
    System.out.println("[t2] get lock2");
    syncrhonized(lock1) {
    System.out.println("[t2] get lock1");
  }
  }
});

t1 lock1
t2 lock2 취득하는데 이 문제는

이후에 t1이 lock2취득하려는데 lock2는 t2가 가지고있꼬
이러니까 교착상태 빠짐.
  
mutual exclusion을 너무 남발하는게아닌가?

thread 2에서 lock1과 lock2를 바꿔줘서 lock1 먼저 취득하게

반드시 이런 중첩이 필요한가? 따로따로 떼네서..


```


