#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <netdb.h> 

void main(){
	char *args[101];
	int i;
	for(i=0;i<100;i++){
		args[i]="A";
	}
	args['A']="\x00";
	args['B']="\x20\x0a\x0d";
	args['C']=5555;
	args[100]=NULL;
	
	char* env[2]={"\xde\xad\xbe\xef=\xca\xfe\xba\xbe",NULL};

	int fd0[2];
	int fd2[2];
	pipe(fd0);
	pipe(fd2);
	
	FILE* fp = fopen("\x0a", "ab+");
	fwrite("\x00\x00\x00\x00", 4, 1, fp);

	#define CHILD_READ0 fd0[0]
	#define PARENT_WRITE0 fd0[1]
	#define CHILD_READ2 fd2[0]
	#define PARENT_WRITE2 fd2[1]
	pid_t child;
	if((child=fork())<0){
		printf("Fucking bastard\n");
	}else if(child==0){

		
		close(PARENT_WRITE0);
		close(PARENT_WRITE2);
		dup2(CHILD_READ0,0);
		dup2(CHILD_READ2,2);
		close(CHILD_READ0);
		close(CHILD_READ2);
		execve("./input",args,env);
		
	}else{
		close(CHILD_READ0);
		close(CHILD_READ2);
		write(PARENT_WRITE0,"\x00\x0a\x00\xff",4);
		write(PARENT_WRITE2,"\x00\x0a\x02\xff",4);
	    int sockfd, portno, n;
	    struct sockaddr_in serv_addr;
	    struct hostent *server;
	    portno = atoi(args['C']);
	    sockfd = socket(AF_INET, SOCK_STREAM, 0); 
	    server = gethostbyname("127.0.0.1");
	    bzero((char *) &serv_addr, sizeof(serv_addr));
	    serv_addr.sin_family = AF_INET;
	    bcopy((char *)server->h_addr, 
		 (char *)&serv_addr.sin_addr.s_addr,
		 server->h_length);
	    serv_addr.sin_port = htons(portno);
	    sleep(5);
	    if (connect(sockfd,(struct sockaddr *) &serv_addr,sizeof(serv_addr)) < 0) 
		error("ERROR connecting");
	    write(sockfd,"\xde\xad\xbe\xef",4);
	    close(sockfd);

	}
}
