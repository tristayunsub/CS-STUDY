```
#include <thread>
#include <iostream>

void fn()
{
  std::cout << "fn" << std::endl;
  
}

int main()
{
  std::thread t1(fn);
  std::thread t2{std::move(t1)}; //copy constructur 에러뜬다. move constructor 써야됨.
  
  t2.join();
}

```
// 윘쪽이 stack 아래쪽이 heap main function stack 안에 std:thread만들었찌만 이게 flow를 만드는건아니다.

//3번쨰정의처럼 함수를 같이 넘겨야됌 fn을 실행하는 thread 
//빌드는되는데 실행에러. mainthread에서 t1을 기다리는게아니라 t2를 기다려야되서 t1.join() -> t2.join으로 함수를 같이 던져줘야. 카피는 불가능 move만가능

/*destructor?
join? joinable? 처음 메인쓰레드 동작. t1 쓰레드 만들고
main thread가 join이 되길 기다림

join, detach에 대해 알아야됨

threa::join은
blocks the current thread until the thread identified by *this
finishes its execution 현재 thread 블락. 타겟trhead 실행끝날떄까지 기다림
join 두번해줘도 에러
fn 실행시키기위한 새로운 thread 생성
마무리된뒤 프로세스 종료

join 없애면 desctructor 발생

jthread? detach?

detach->  sperates the thread of execution from the thread object
, allowing execution to continue independently


*/
예를들어 main에서 뺴서

void threadCaller()
{
  std::thread t1(fn);
  t1.detach();
  
  }

main에서는 threadCaller 호출

함수 fn 실행. thread object 만들어서 함수 fn 실행
detach하면 thread object로부터 분리
fn과 관련이 없어지기 때문에
함수가 끝나면서 stack free가 되도

fn실행ㅎ는 thread는 계속 살아남아있음.

detach는 쓰지 않는게 좋다. 분리하기보다는

  global scope에 thread 만들어놓고 해당 thread가 끝날떄까지 기다려주는게 best

```
std::thread gThread;

void fn()
{
  std::cout << "fn" << std::endl;
  
}

void threadCaller()
{
  gThread = std::thread(fn);
  }

int main()
{
  threadCaller();
  std::this_thread::sleep_for(std::crhono::seconds);
  gThread.join(); // 함꼐가져가는게 더 좋은구조 
  //근데 메인 thread가 글로벌 thread의 오브젝트의 실제 thread 영원히 기다릴수도잇기 때문에 stop token 지원하는 jthread
  
}
```


또한 thread는 힙에서도 생성 가능


```

void fn()
{
  std::cout << std::this_thread::get_id() << str
}

int main()
{
  std::vector<std::thread> threads;
  for(int i = 0; i <10; i++)
    {
      threads.emplace_back(std::thread(fn));
      //함수안에 10개 thread 넣고 모두 끝나길기다린다면
      //벡터 안에서 관리되는 10개 thread출력.
      //vector object 만들고. 각각의 thread는ㄴ 모두 함수 fn 실행한것
      
    }

  for(auto& thread : threads)
    {
      thread.join();
    }
}
```
