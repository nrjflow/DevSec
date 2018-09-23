.386
.model flat, stdcall
option casemap :none

extrn MessageBoxA@16 :PROC
extrn ExitProcess@4 :PROC
.data
	msg db "Fuck", 0
	msgTitle db "Fuck yeah", 0
	OKCANCEL equ 1
.code
start:
	push OKCANCEL
	lea esi, msgTitle
	push esi
	lea esi, msg
	push esi
	push 0
	call MessageBoxA@16
	push 0
	call ExitProcess@4
end start