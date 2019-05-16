; test

global main

EXTERN printf
EXTERN exit

section .text
main:

	mov ecx, 0x6
Ploop:
	
	push ecx
	push str1
	call printf
	add esp, 0x4
	pop ecx
	loop Ploop

	cld
	mov ecx, str1len
	lea esi, [str1]
	lea edi, [dest]

	rep movsb

	push dest
	call printf
	add esp, 0x4

	cld
	mov ecx, str2len
	lea esi, [str2]
	lea edi, [dest]

	rep movsb

	push dest
	call printf
	add esp, 0x4

	mov ecx, str1len
	lea esi, [str1]
	lea edi, [dest]

	repe cmpsb

	jz equal
	push nosucc
	call printf
	add esp, 0x4
	jmp exitp
equal:
	push succ
	call printf
	add esp, 0x4
exitp:

	call exit

section .data
	str1: db "Fuck world", 0xA, 0x0
	str1len equ $-str1
	str2: db "Fuck word", 0xA, 0x0
	str2len equ $-str2

	succ: db "yes", 0xA, 0x0
	nosucc: db "no", 0xA, 0x0

section .bss
	dest: resb 100