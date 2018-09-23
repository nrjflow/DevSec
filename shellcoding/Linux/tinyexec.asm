;tinyexec.asm

global _start

section .text
_start:
	xor ecx,ecx
	mul ecx
	push ecx
	push 0x68732f6e
	push 0x69622f2f
	mov ebx, esp

	mov al, 0x0b
	int 0x80