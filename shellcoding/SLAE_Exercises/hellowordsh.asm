; hello world shellcode and shit

global _start

section .text

_start:
	
	jmp short define_message
_print:

	pop ecx
	xor eax, eax
	mov al, 0x4

	xor ebx, ebx
	mov bl, 0x1
	xor edx, edx
	mov dl, 0xd
	int 0x80

	xor eax, eax
	mov al, 0x1
	xor ebx, ebx
	int 0x80

define_message:
	call _print
	db "hello world", 0xA