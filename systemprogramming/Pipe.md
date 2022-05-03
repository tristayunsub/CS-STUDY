
https://www.youtube.com/watch?v=WMAcerym0sM&t=2s&ab_channel=HPCLab.KOREATECH


Pipe

uni-directional byte stream. name or ID가 없음. related process 간에 사용 가능(e.g. fork())


close unused fds

pipe가 full 일때 write 시도하면 blocking

write size가 buffer보다 짝으면 atomic, 크면 interleaved가 될수있음.




named pipe란. 이름을 가진 piep를 통해서 프로세스들 간에 단방향 통신을 지원하며, 서로 다른 프로세스들이 pipe 이름만 알면 통신이 가능.

익명의 pipe와 마찬가지 fifo 구조이며, 생성된 pipe 에 대하여 write 또는 read만 가능하게 된다.

전혀 다른 모든 프로세스들 사이에서 통신이 가능한데 그 이유는 프로세스 통신을 위해 이름이 있는 파일을ㄹ 사용

mkfifo를 통해 생성. 쌍방 통신을 위해 write용 pipe하나. read pipe하나 만어야됌

read write가 기본적으로 block 모드로 작동

파일경로가 id, fifo 생성과 open이 분리되어있음. open() 시 read-side와 write-side가 동기화됨.
 char int mkfifo(const *pathname, mode_t mode);
 -named pipe 파일을 생성한다.
 
 파라미터. 
 dpathname: 생성할 named pipe 파일 경로.
 moode: permission
 
 반환값. 성공시 0 리턴, 실패시 -1리턴.
