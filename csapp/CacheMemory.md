캐시메모리를 갖춘 cpu는 메모리참조가 필요할때 가까운 곳에 위치한 캐시 메모리에 먼저 접근




**매우 중요**


일반적인 캐시메모리의 구조 (S,E,B)
=

다음은 캐시 메모리의 일반적인 구조를 나타낸다 캐시 메모리는 S개의 집합으로 이뤄져 있고, 각 집합은 E개의 캐시 라인을 저장한다.

각 캐시라인은 메인 메모리에서 가져오는 BLOCK 하나와 그것이 유효한지를 나타내는 유효비트 VALID BIT. 그리고 동일한 집합에 들어올 수 있는

다른 블록과 구별하기위한 TAG 저장. 메인메모리의 각 블록이 B바이트라고할때 캐시 메모리의 총사이즈는 (S X E X B)바이트가 된다.

그러니까 SET 집합크기와, E개의 캐시라인 수, 블록의 B바이트. 를 곱하면 캐시 메모리 사이즈가 된다.

E=1이면 DIRECTED MAPPED CAHCE, E>1 이면 E-way set associative cache 라고 부른다.


메인 메모리의 각 블록은 캐시메모리의 특정 집합에만 들어가도록 설계. 메인 메모리의 256번째 블록은 캐시 메모리의 4번째 집합에만 들어갈 수 있다.

cpu가 참조하고자 하는 메모리의 주소를 캐시 메모리에 입력하면, 캐시 메모리는 그 주소에 해당하는 메인 메모리의 블록을 자신이 가지고있는지


화인.


 따라서 메인 메모리의 각 블록은 자신의 주소에 따라 캐시 메모리의 특정 집합에만 들어갈 수 있도록 약속한다. 
 
 이렇게 하면 캐시 메모리는 입력받은 메모리 주소를 바탕으로 요청된 블록이 위치할 수 있는 집합에서만 탐색을 진행하면 된다. 
 
 각 집합 내 블록의 개수는 유한하기 때문에 블록 탐색 시간 복잡도는 O(1)이 된다. 이는 ***해싱(Hashing) 알고리즘을 적용한 사례라고 할 수 있다.***
 
 캐시 라인에 저장되는 Tag란 무엇인가.
 
 메모리 주소가 m=(t+s+b)이고 메모리의 총사이즈는 M=2^m 가정. 메모리 주소는 다음 구조ㅗ로 나눠서 생각
 
 한마디로 동일한 집합에 들어갈 수 있는 여러 블록들을 구별해주는 비트가 바로 상위 t비트인것. 이값이 곧 캐시라인에 들어가는 tag이다.
 
 
 2.Cache Read. 
 =
 
입력되는 메모리ㅇ 주소의 s비트를 바탕으로 요청된 블록이 위치할 수 있는 집합 찾아감. 그리고 그곳에서 요청된 블록의 태그 (=입력되는 메모리 주소의 상위 t비트값)

와 동일한 태그를 가지는 유효한 비비트 캐시라인이 존재하는지 탐색.(시간복잡도 O(1))

![다운로드 (1)](https://user-images.githubusercontent.com/75001605/165000695-845480ff-874e-4548-b4a1-92e71bf71cba.png)

만약 발견되면 캐시 히트, 아니면 캐시 미스.

캐시 히트인 경우, 입력되는 메모리 주소의 하위 B비트와 읽을 바이트의 개수를 컨트롤 신호 정보를 바탕으로 블록내에서 요청된 바이트 배열을 반환한다.

REPLACEMENT POLICY. 임의의 블록을 쫒아내는 RANDOM 방식, 가장 예전에 참조되었던 블록을 쫓아내는 LRU 방식이 있다.
 
 
 
 캐시의 성능은 HIT보다 MISS RATE를 더 중점적으로 보게됨. 
 
 HIT TIME이란 캐시 메모리의 캐시라인을 CPU에게 전달하는 시간.
 
 MISS PEANLTY 미스 패널티는 50~200 사이클이라 HIT TIME보다 긴 시간이 소요됨.
 
 
여기서 CACHE SIZE가 일정할때 MISS RATE에 영향을 주는 요인

SET ASSOCIATIVE의 변화에 따른 MISS RATE의 변화를 생각해보면. set associativity가 커질수록 집합의 총 개수는 줄어들고

각 집합의 캐시라인 개수가 증가. 


fully associative. 각 블록이 캐시 메모리에 들어갈 자리가 많아짐. 이러면 conflict miss 가 감소. 빈공간 활용도가 높아져 miss rate 감소.


그러나 캐시메모리에서 요청된 블록을 탐색하는데 걸리는 시간이 증가하므로 hit time이 증가.

반면 set associativty가 감소하면 missrate가 증가해도 탐색시간이 줄어듬
여기서 L1 L2 L3 캐시의 차이와 관련
 
 
 4-4. Intel Core i7 Cache Hierarchy
 =

다음은 인텔 Core i7 CPU의 캐시 메모리 계층 구조를 나타낸다. 메인 메모리 이전에 세 단계의 캐시 메모리(L1, L2, L3)가 존재하는 것을 볼 수 있다. 

이때, CPU에 가까울수록(L1으로 갈수록) Cache Size와 Set Associativity가 작고, 메인 메모리에 가까울수록(L3로 갈수록) Cache Size와 Set Associativity가 크다는 것을 관찰할 수 있다.

***이는 CPU에 가까운 메모리 계층일수록 Hit Time을 줄이는 것이 중요하고, 메인 메모리에 가까운 메모리 계층일수록 Miss Rate를 줄이는 것이 중요하기 때문이다.***


![다운로드 (4)](https://user-images.githubusercontent.com/75001605/165000598-7d0c1b57-cd16-467c-9599-038f1537bff3.png)




