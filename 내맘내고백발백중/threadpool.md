 Thread Pool을 사용해야 되는 이유

1. 프로그램 성능저하를 방지하기 위해

2. 다수의 사용자의 요청을 수용하고, 빠르게 처리하고 대응

3. 스레드 생성/소멸에 드는 비용을 작업이 들어올 때마다 하기엔 부담이 큼



스레드를 계속 생성해서 스레드가 증가하면 그만큼 컨텍스트 스위칭이 더 자주 발생해서 오버헤드가 발생한다고 하셨는데. 여기서 컨텍스트 스위칭을 더 자주 발생시키는 요인을 I/O 시스템콜이라고 이해하면 될까요?


그렇다면 I/O 시스템콜이 전혀 없는 cpu 연산만 실행하는 코드일때는 스레드수가 계속 증가해도 컨텍스트 스위칭의 빈도수는 그대로 인가요? (정해진 cpu 이용시간이 지나면 컨텍스트 스위칭 되는 빈도는 스레드 수가 증가해도 변함이 없으니)

https://hhj6212.github.io/programming/python/2021/04/18/python-multi.html
https://blog.naver.com/horajjan/222201854028

파이썬 동시성기법

![다운로드](https://user-images.githubusercontent.com/75001605/164782200-d5be1c45-52a2-4459-a020-c4bf2aed1a98.png)

>스레드 풀(Thread Pool)

미리 스레드를 일정 수량 만들어두고 작업하는 방식 

스레드를 몇 개 생성해두고 모든 작업을 그 한정된 스레드로 재활용하며 작업한다고 생각하면 

Thread per request model.
하나의 리퀘스트는 하나의 스레드가 처리하게끔 1:1 매핑.

동작방식이 처리가 끝나게되면 스레드를 버리게된다면 문제점이 발생 스레드 생성에 소요되는 시간 때문에 요청 처리가 더 오래걸림

커널에서 생성되기에 시간 은근 잡아먹는다.처리 속도보다 더빠르게 요청이 늘어나면.

컨텍스트 스위칭이 더 자주 발생. cpu 오버헤드 증가로 cpu time 낭비.


task를 서브테스크 로 나뉘어서 동시에 처리. 순서 상관없이 동시 실행이 가능한 task 처리.

그럼 스레드풀에 몇개의 스레드를 만들어 두는게 적절한가?

cpu코어의 개수와 task의 성향에 따라 다름.

만약에 CPU BOUND TASK라면. 코어개수 만큼 혹은 그 보다 몇개 더 많은 정도.

I/O BOUND TASK라면? 코어개수보다 1.5배? 두배? 세배 경험적인 면이 필요함.

스레드풀의 큐사이즈 제한이 있는지 꼭 확인할것.

큐에 요청이 무한정 쌓인다면? 

Caution! 자바의 Executors 클래스

static 메서드로 다양한 형태의 스레드 풀을 제공

```
ExeCutorService threadPool = Executors.newFixedThreadPool(10); ->스레드 개수 10개 고정된 풀이 만들어지면.

threadPool.submit(task1); -> 넣어서 실행.
threadPool.submit(task2);
```

저 풀의 queue사이즈?

```
executors.newFiexThreadPool 소스코드보자

public static ExecutorService .... {

   return new ThreadPoolExecutor(nThreads, nThreads, 0L, TimeUnit, MILLISECONDS, new LinkedBlockingQueue<runnable>());
 
 
public  LinkedBlockingQueue {
  this(integer.max_value); -> this는 같은 의미의 생성자. max value가 전달된거. capacity에 20억이넘는다.. queue사이즈가 제한이없다.
 }
 
 
 public Linked... (int capacity) {
  if ( capacity <= 0 ) throw new IllegalArgumentExecption(); -> capacity queue 사이즈.
    this.capacity = capacity;
                   last = head = newNode<E>(null);
  }
 
 
 ```
 잠재적인 위험이 있다는걸 명심해야된다.
 
 파이썬도. threadpoolExecutor 클래스있다.
 
 executor = ThreadPoolExecutor( max_workers=7)로
 
 파이선 class
 
  def __init__
  init은 생성자 
  self.work_queue = queue.SimpleQueue()
  
 SimpleQueue는  unbounded -> 사이즈에 제한이없다.
