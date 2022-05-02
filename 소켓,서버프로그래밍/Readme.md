https://www.youtube.com/watch?v=iDNoNN7k8w4&list=PL_fV1knZRgi6oxsVBVTXtUQH5wOMOttyt&index=1&ab_channel=%EC%96%B8%EC%A0%9C%EB%82%98%ED%9C%B4%EC%9D%BC-%ED%94%84%EB%A1%9C%EA%B7%B8%EB%9E%98%EB%A8%B8




https://www.inflearn.com/course/%EC%9C%A0%EB%8B%88%ED%8B%B0-mmorpg-%EA%B0%9C%EB%B0%9C-part4/lecture/41387?tab=curriculum&volume=0.46
c# 서버개발


https://wiserloner.tistory.com/708?category=831127

파일과 소켓?




https://velog.io/@rhdmstj17/%EC%86%8C%EC%BC%93%EA%B3%BC-%EC%9B%B9%EC%86%8C%EC%BC%93-%ED%95%9C-%EB%B2%88%EC%97%90-%EC%A0%95%EB%A6%AC-2

웹소켓? http, tcp ip 소켓


클라이언트 개발자가 서버에서 자꾸 웹소켓을 끊어서 연결에 실패한다는거야
근데 내가 만든 테스트용 클라는 서버랑 존나 잘붙는데 이상하잖아
그래서 저는 잘돼요~ 라고 할수는 있겠지만 영 찝찝하지

여기서 tcp지식이 있고 tcpdump나 wireshark를 쓸줄 안다면
tcp 패킷을 분석해서 누가 먼저 shutdown(close)을 시도해서 연결이 끊기는지 다 알 수 있다

일단 tcp는 연결할때도 핸드쉐이크 하고 연결 끊을때도 핸드쉐이크 한다

![1651484485](https://user-images.githubusercontent.com/75001605/166215167-e313104d-855d-4e9a-ba23-b68a13565735.jpg)

따라서 위 와이어샤크 화면을 보면 서버쪽 포트가 5500이고 반대는 로드밸런서인데 로드밸런서가 FIN을 먼저 보냈으니 클라가 먼저 종료 요청을 했다는걸 알 수 있다

우리가 만들어둔 웹소켓 프로토콜 상 서버도 클라도 유저가 종료하고 싶은 경우 빼면 종료요청 하면 안되는데 저런다는건 클라에서 뭔가 잘못처리해서 에러나고 있다는 뜻임

이렇게 tcp 패킷 분석해서 클라 개발자한테 가져가면 설명도 가능하고 서버에 문제 찾느라 삽질할 필요도 없고 그 시간에 클라 개발자 디버깅 하는거 도와줄 수도 있음

그리고 연결 시도할때도 마찬가지다 중간에 어떤 과정으로 인해 연결이 실패했는지 tcp 패킷 분석해서 어디서 문제가 발생하는지
클라쪽에서도 패킷 따서 보고 그러다보면 로드밸런서가 문제인 경우도 가끔 나옴

프레임워크만 믿고 이런거 모르고 서버 개발한다? 자기 이슈 아닌데 삽질 존나게하고 결국에 클라에서 해결됐다는말 듣고 시간 낭비한거 깨닫고 현타오고 작업 효율 떨어지고 그런거다 ㅇㅇ

꼭 공부해라 학교에서 괜히 가르쳐주는거 아님 
tcpdump나 wireshark도 필수로 알려줘야한다고 생각함

핸드쉐이크 문제가 아니라 그냥 앱 자체적으로 레이스컨디션으로 인한 오류로 꺼진거라 서버에선 프로토콜 에러가 안나와
