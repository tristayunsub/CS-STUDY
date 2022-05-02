enum 이란? 열거하다 enumeration



enumeration 열거형

```
enum 열거형 이름
{
 값1, 0
 값2, 1
 값3, 2
 값4,3

  
};

```
enum은 자료형을 유저가 원하는 방식으로 정의한다.

상수 0에 매핑되었다. 특정값을 부여하고싶다? =연산자 사용

```
enum 요일
{
  월,화,수,목,금 토일


}
```

여기에 
if(요일::월==0) 하면 true가된다.

  만약 월에 해당하는 상수가 1이었으면 좋겟다

  월=1, 일=10 이렇게
  지정이 안된 부분은 이전값 기준으로 1씩 증가


enum = keyword

user defined type
week(sun, mon, tue, wed,thu,fri, sat);
value alloactd for week

가독성과 효율성을 위해

예를들면 atm 메뉴화면을 개발한다치자.

enum menu_tupe
  {
    withdraw=1,
  balanceInquiry,
  deposit,
  quit
  }
  
  
  int main()
  {
    int choice = 0;
    
    do{
     //메뉴화면
         std::cout
  
           }

      //메뉴화면에 따른 동작

    switch(choice)
      {
        case menu_type::withdarw: //->경우가 1일때가 아닌, '메뉴타입이 withdraw일때로'  가독성올라감.
         withdraw(); //내부로직 처리
        break;
          ...


        case mnutype::quit;
        exit(100) break
          
      
      
        }
    } while(true);
  return 0;
    
  }

menu type 정의 부분만 봐도 바운더리가 명확해서 메뉴타입은
총 4개로 구성되어있다는것.
  main 본문에 //메뉴 선택에 따른 동작 부분을 보면
기존에 case1: 이였던 부분이 case menu_type::withdraw:로 바뀜


enum은 왜 사용하는가. 두번째 예시2

  유저가 정의하는 하나의 타입이라 고볼수있다.

코드화하다보니 어떤걸 의미하지 않는지 명확하지 않을때.

  예를들어 은행에서 카드상태 코드라는 필드가 있다고할때

  해당필드 타입은 정수로 0값은 정상, 1은 해지, 2는 분실, 3은 정지

카드 타입이 분실이라면 결제 거래 거절 이런 방어로직 추가하고싶으면

  
  if(temp_card_stats !=2 ) 그럼 처음보는사람이 2는머지?
  
  2가뭐길래 방어로직? 그대신ㅇ
  
  열거형으로 if(temp_card_status != card_status::lost) 소스보고
  
  아 분실이 아니면이구나라고 이해
```
    enum CardStatus
    {
       정상= 0,
       해지= 1,
       분실= 2,
       정지= 3,
    };

bool isValidCard(enum CardStatus card_st)
  {

         if(card_st != 정상)
  {
        std:cerr << "사용 불가한 카드입니다." << std::endl;;
    return false;
  }
         std::cout << " 정상 카드" << std::endl;
       return true;
  }

int main()
{
  enum CardStatus temp_card_st = 0; //컴파일에러
  enum CardStatus card_st = 정상; //OK
  isValidCard(card_st)
}

```

typedef enum

{
  
} DayWeek;

typdef를 통해 enum사용을 좀더 활용적으로

typedef가 긴거를 닉네임처럼 명명해서 좀 짧게 쓸수있도록 해주는 역할

enum DayWeek dayWeek1;
enum DayWeek dayWeek2;

//enum 타입변수 선언
DayWeek dayWeek1;

//선언과 초기화
DayWeek dayWeek2 = TUE;



//enum 

정리

cin ㅇ으로 enum타입 입력 못받는다. << 연산자 오버로딩이 안도있음

기본적으로 enum은 대입연산자만 오버로딩

열거자에 명시적으로 값 지정안되있으면 0부터 1씩 증가

참고로 열거자를 정수로 형변환 가능


```
int dayToday = int(Wed);
enum CardStatus temp_card_st = CardStatus(2);

```
