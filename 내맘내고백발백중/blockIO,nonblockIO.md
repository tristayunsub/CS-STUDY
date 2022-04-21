https://www.youtube.com/watch?v=mb-QHxVfmcs&t=11s&ab_channel=%EC%89%AC%EC%9A%B4%EC%BD%94%EB%93%9C

block IO, noblockI/O 개념. + Multiplexing
io의종류
network(socket), file io, pipe(프로세스간 통신) io, device io

socket을 통해 데이터 입출력.

backend server. 네트워크 상의 요청자들과 각각 소켓을 열고 통신한다.

block I/O와 NONBLOCK I/O가 어떻게 동작하는지 보자.


i/o 작업을 요청한 프로세스/스레드는 요청이 완료될떄까지 block된다.

read blocking system call 호출. read 시스템 호출하는순간.
  이 thread는 block이된다. 커널모드 실행되고. read io 실행
data moved from kernal. 

  socket 에게 block I/O란? 
  SOCKET A(send_buffer, recv_buffer)

  SOCKET B(send_buffer, recv_buffer)
  read(socket a), write(Socket b)

send버퍼가 빌떄까지 블락이된다. 

nonblock i/o는 
프로세스를 블락시키지 않고. 현재 상태를 즉시 리턴


nonblocking ioㅡㄷ가면 -1 (egain or ewouldblock)->에러코드 가 추가된다.
즉시 리턴하니까 좋다.

socket s에서 a로 데이터 보낼떄 a에 대고 recv버퍼에 데이터있는지
read로 확인. 데이터가 없다면 그냥 없다고 알려주고 read시스템콜은 바로 종료 한마디로 블락이 안됨

send 버퍼에 다 차있으면 write 시스템콜을 호출한 스레드가
공간이 생길떄까지 블락되있었겟지만 논블락이니까 적절한 에러코드와 함께
write 시스템이 반환된다.

I/O 작업 완료를 어떻게 확인할껀가? 이게 중요

1. 완료됐는지 반복적으로 확인 준비되지않았다면 -1 코드 반환

다른코드 실행시키다가. READ NONBLOCK 시스템호출해서 확인

준비될떄까지 확인.

완료된 시간과 완료를 확인한 시간 사이의 갭으로 인해

처리속도가 느려질 수 있음.

완료됐는지 반복적인 확인은 CPU낭비가 발생. 다른 소켓이 들어갔다 할지라도
소켓하나 블락되있으면 못움직임 서버가

BLOCKING 모드로 READ못하죠. 
어 그럼 모든 소켓에 대해서 데이터가 드러오길 기다리니까

하나라도 들어왔으면 하나라도 들어왔다고 커널에 알려주면되지않나?

I/O multiplexing. 이란?
관심있는 io작업들을 동시에 모니터링 하고, 그중에 완료된 i/o 작업들을 한번에 알려줌

I/O multiplexing systemcall(monitor 2 sockets non-blocking read)


notify data available, 
read system call
data moved
read systemcall
data moved. 한번의 콜로 여러 이벤트들을 한번에 처리함

종류는 select, poll, epoll, kqueue, IOCP
앞에 두개는 성능 안좋아서 잘안쓰이고 EPOLL, KQUEUE->macos,
iocp는 솔라리스나 윈도우.

Linux epoll 이란?
서버가 8개 열려있으면 epoll토 통해 8개중 하나라도 read 이벤트 열려있으면
등록. 꺠어나면서 동시에 socket에 데이터가 있다는걸 알려줌. 그 정보 바탕으로 들어온 소켓에 대해서만 데이터 처리하면됌.

thread pool 사용하게된다면~ 그 요청들을 거기다 넣어서 할당받게 함

3.Callback/signal 
aio_read non-blocking system call. 

POSIX AIO, LINUX AIO .

              BLOCKING            NON-BLOCKING
SYNCHRONOUS  READ/WRITE              READ/WRITE
ASYNCHRONOUS IOMULTIPLEXING           AIO

Iomultiplexing은 select나 poll은 블락이되수도있음.
io 멀티플렉싱은 논블락킹

ㅁ무쳤다...
