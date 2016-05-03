#include <stdio.h>
#include <stdlib.h>

main(){
	char *args[101];
	int i;
	for(i=0;i<100;i++){
		args[i]="A";
	}
	args['A']="\x00";
	args['B']="\x20\x0a\x0d";
	args[100]=NULL;
	
	char* env[2]={"\xde\xad\xbe\xef=\xca\xfe\xba\xbe",NULL};

	int fd0[2];
	int fd2[2];
	int c0,c2;
	pipe(fd0);
	pipe(fd2);
	close(fd0[0]);
	close(fd2[0]);

	if(fork()==0){
		c0=dup2(fd0[1],0);
		c2=dup2(fd2[1],2);	
		close(fd0[1]);
		close(fd2[1]);
		execve("./input",args,env);
		
	}else{
		write(c0,"\x00\x0a\x00\xff",4);
		write(c2,"\x00\x0a\x02\xff",4);
	}
}
