#!/bin/bash

echo '[+] Assembling with Nasm ... '
nasm -f elf32 -o $1.o $1.asm

echo '[+] Linking ...'
ld -o $1 $1.o

echo '[+] Done!'

shellcode=$(objdump -d ./$1|grep '[0-9a-f]:'|grep -v 'file'|cut -f2 -d:|cut -f1-6 -d' '|tr -s ' '|tr '\t' ' '|sed 's/ $//g'|sed 's/ /\\x/g'|paste -d '' -s |sed 's/^/"/'|sed 's/$/"/g')

echo '[+] Generated shellcode : '
echo $shellcode

python -c "print '[+] Generated shellcode length: %d' % len(bytearray($shellcode))"

cat > test$1.c << _EOF
#include <stdio.h>
#include <string.h>

unsigned char code[] = \\
$shellcode;

void main()
{

	printf("Shellcode Length:  %d\n", strlen(code));

	int (*ret)() = (int(*)())code;

	ret();

}
_EOF

echo '[+] C test program written!'

gcc test$1.c -o test$1 -fno-stack-protector -z execstack -m32

echo '[+] C test program compiled!'