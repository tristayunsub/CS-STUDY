import java.lang.*;
// 해쉬 테이블이란?

// 배열과 해시함수를 사용하여 구현.

// key-value pair들을 저장. 같은키는 중복되지 않음

// hash set은 hash table을 사용하여 구현.

// 데이터를 키로 저장, 같은 데이터는 중복되지 않음.

// 개발자가 정의한 클래스의 객체를 키로쓰게 된다면 어떻게 동작할까?

// 중복 객체 제거하기

// cpython set으로 해보자.

```
class Location:
   def __init__(self, x, y):
     self.x = y
     self.y = y

       c1= Location(1,1) 서로다른 객체지만 좌표가 같음.
       c2= Location(1,1)


       unique = {c1,c2}

        print(len(unique)) 두 객체가 중복처리 됬지 않았다.
        print(c1 in unique) true
        print(c2 in unique) true
```
          
  add(c1) hash function에다 넣음. 해쉬 펑션
     c1객체의 메모리 주소를 바탕으로 결과값 나옴

       10이라고나왔는데 해쉬크기만큼 % modular 연산.
       =2가나옴


       메모리 2에다 c1저장.

       add (C2)하면. 인풋넣으면. 메모리주소를 사용해서 해쉬값.
   확률적으로 다른값이 나올거임. 해쉬값이 2%8. 2로나옴

  비교해야되는데. c1의 해쉬값과 c2해쉬값 비교햇는데
      해쉬 충돌일어남 같아서 그래서

       key값들을 비교함. 객체 비교?

       두개의 객체의 메모리 주소를가지고 비교. 서로다른 객체는 서로다른 메모리 주소 가지잖아. 최종적으로 서로 다른.

       c2가 85로나옴 5에 c2값 데이터가 저장이됨. c2,85 해쉬값.

         contains(c1) 해쉬값과 해쉬값 key값 비교. 동일하다 판단.

         c1이라는 객체가 set에있으니까 true. c2도. 85값 모듈러연산하면
         %8 나오고. key와 비교. 메모리 주소 비교

         메모리주소도 같으니까 true 리턴.


```
         def __hash__(self):
             return hash((self.x,self.y))
                         hash fucntion이다.~ 객체 넣어서. 해쉬값을 i nteger값으로 나온다.
  hash collision
       def __eq__(self, o): //다른객체랑 비교할때
          return self.x == o.x and self.y == o.y
           둘다 동일하면 객체가 동일하다 보겠다.

            unique set의 사이즈느1이나오고
            둘다 true가나옴.
```
             
1,1 바탕으로 해쉬가나옴. 323이나오고 %8 = 3. 

  c1,323

c2집어넣고. 1,1바탕으로 해싱 이것도 323이나옴 이것도 3번인덱스로감
해쉬끼리 비교 똑같음. c1,c2 이 데이터자체 비교. x,y 비교했는데 같음.
c2는 안넣고 작업안함.

  c1 in unique 는 true

  c2 in unique 해쉬뽑았더니 

   
   자바로 쓴다면
   
   
```
    class Location{
    public int x;
    public int y;

    public Location(int x, int y){
      this.x = x;
      this.y = y;
      
    }

    public int hashCode(){
      return (x+":"+y).hashCode();
    }
    public boolean equals(Object o){
      Location obj = (Location) o;
      return x == obj.x && y == obj.y;
    }

Location c1 = new Location(1,1);
Location c2 = new Location(1,1);

Set<Location> unique = new HashSet<>();
unique.add(c1);
unique.add(c2);

System.out.println(unique.size());
System.out.println(unique.contains(c1));

```
