extern _MessageBoxA@16
section .text

global _WinMain@16:

_WinMain@16:
xor ecx, ecx
mul ecx
push eax

push 0x786f6220
push 0x7327656e
push 0x61696675
push 0x6f532020
mov edi, esp

push eax
push 0x65686568
push 0x20786f62
push 0x2079786f
push 0x62206579
push 0x65792020
mov esi, esp

add eax, 0x41
push eax
push edi
push esi
push ecx

; mov edx, 0x756dfd1e
; jmp edx
call _MessageBoxA@16

;nasm -fwin32 msgBox.asm
;link /ENTRY:WinMain /SUBSYSTEM:WINDOWS user32.lib msgBox.obj