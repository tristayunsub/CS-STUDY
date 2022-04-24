https://www.youtube.com/watch?v=P-FTb1faxlo&ab_channel=%EC%89%AC%EC%9A%B4%EC%BD%94%EB%93%9C

배열?
동적배열? 연관배열? associative array, dynamic array.




10개의 점수를 관리하기위해 try123이렇게 해야되나


try1+try2+... try10 귀찮고 번거롭다.

int[] tries = new int[] {10, 9.... 10};

int sum = 0;
 for(int t : tries) {
    sum += t;
 }


메모리에 offset개념. 

int[][] twoD = {{1,2}, {3,4}};

메모리는 무조건 1차원이고.

  시각화통해서 2차원적으로 보이지만 1차원임

  row라는 각행은 1 2, row1은 3, 4

  객체를 배열에 담을때?

  String [] names = {};

ref-easy, ref-code, ref-yeah
   0         1          2
  객체의 레퍼런스들을 저장한다.  객체를 배열에 저장할때 레퍼런스들이
  연속적으로 저장되고. 실제 객체는 그냐 듬성듬성 저장한다.


  cpu cache. 
  동적배열. array list, resizable arry로 불린다.

  
연관 배열 associative array(연관 배열) 

  key-value pair들을 저장하는 adt
    같은 key를 가지는 pair는 최대 한개만 존재

    map, dictionary 라고 불리기도 함.



