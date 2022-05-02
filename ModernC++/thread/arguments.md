
arg
ref 함수
ret 
exception

```
#include <thread>
#include <iostream>

void fn(int a, std::String &  s)
{
  std::cout << "fn" << std::endl;
  
}

int main()
{
  int num = 42;
  std:: string s = "nocope"
  std::thread t1(fn,num,std::ref(s));
  
  t1.join();
}
  
  ```
  //변수의 life cycle 조심해야됨.

  
  ```
  #include <thread>
#include <iostream>

void fn(int & a)
{
  std::this_thread::sleep_for(std::chrono::seconds(1))  
  std::cout << a << std::endl;
  
}

void threadCaller(std::thread & t)
{
  int num = 42;
  t = std::thread(fn,std::ref(num));
  t.join();  
}

int main()
{
  std::thread t1;
  threadCalller();
  // t1.join(); //이게 여기있음안되고
}

```
//새 스레드에서 동작시키면 다른값이나옴

// 32764? 가나옴. 

// htread는 같은 socpe에서 join해줘야한다.

//std::async, future, promise 공부.
int fn(int & ret)
{
  ret = 3;
  return 3;

}
int main()
{
  int num = 0;
  std::thread t1(fn);
  t1.join();
  std::cout << "retVal" << num << std::endl;
 }

//lambda 함수 쓰면 된다. trick 쉽게 받음.

```
int fn()
{
  
  return 3;
  }
  
int main()
{
  int num = 0;
  //thread t1을 람다함수에서 실행
  std::thread t1([&num]() {
     num = fn();
  });//더 직관적으로 가져옴.
  
  std::thread t1(fn);
  t1.join();
  std::cout << "retVal" << num << std::endl;
 }
```


```
//만약 함수 fn이 exception을 던진다면?
//std promise or shared variables
int fn()
{
   throw std::runtime_error("error");
  
  }

int main()
{
  try
    {
      std::thread t1(fn);
      t1.join();
    }
    catch(...)
    {
      std::cout << "catched" << std::endl;
    }
}

```
