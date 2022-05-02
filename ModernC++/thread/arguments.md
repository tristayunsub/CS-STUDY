
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
