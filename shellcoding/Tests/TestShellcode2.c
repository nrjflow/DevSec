#include <stdio.h>
#include <string.h>

unsigned char code[] = \
"\xcc\xc3";
int main()
{
	int (*ret)() = (int(*)())code;

	ret();
    return 0;
}
