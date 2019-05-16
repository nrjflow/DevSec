;shellcode attempts

global _start

_start:
	
	xor eax,eax
	xor ebx,ebx
	mov al,0x1
	int 0x80