#!/bin/bash

# verbs=( "BCOPY" "BDELETE" "BMOVE" "BPROPFIND" "BPROPPATCH" "NOTIFY" "POLL" "SUBSCRIBE" "UNSUBSCRIBE" "X-MS-ENUMATTS" "OPTIONS" "GET" "HEAD" "POST" "PUT" "DELETE" "TRACE" "CONNECT" "PROPFIND" "PROPPATCH" "MKCOL" "COPY" "MOVE" "LOCK" "UNLOCK" "VERSION-CONTROL" "REPORT" "CHECKOUT" "CHECKIN" "UNCHECKOUT" "MKWORKSPACE" "UPDATE" "LABEL" "MERGE" "BASELINE-CONTROL" "MKACTIVITY" "ORDERPATCH" "ACL" "PATCH" "SEARCH" )
verbs=( "OPTIONS" , "TRACE" )
for domain in `cat $1`
do
    echo Probing $domain
    echo ________________________________________

    for verb in "${verbs[@]}"
    do
	    echo Probing VERB : $verb
	    echo ------------------------------------------------
		curl -X $verb -I $domain -H 'Accept:text/html' -H 'Accept-Encoding: gzip, deflate, sdch' -H 'Accept-Language: en-US,en;q=0.8,fr-FR;q=0.6,fr;q=0.4,ar;q=0.2' -H 'Upgrade-Insecure-Requests: 1' -H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.80 Safari/537.36' -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8' -H 'Referer: http://toolbar.netcraft.com/site_report?url=http%3A%2F%2Fwww.wafaassurance.ma' -H 'Cookie: __utma=126155282.16164972.1445618892.1445618892.1445618892.1; __utmc=126155282; __utmz=126155282.1445618892.1.1.utmcsr=google|utmccn=(organic)|utmcmd=organic|utmctr=(not%20provided); netcraft_js_verification_challenge=djF8dmE3R2cxOTU2NlNrYldManc5S0F2S00zZ00zcEpxNlpNN0F5QTVSQ1hEd3FYZVY1Tzh2Zi9h%0ATVlQZFpySkxseG50R2J3MlVQNm9scwppNHlBTVBBY1lRPT0KfDE0NDU3ODU4Mjg%3D%0A%7C23d6318686f6853808653e029967bf9025cf9875; netcraft_js_verification_response=dd8a6e458821b9db11dc528dada74f6e0a3007eb; __utmt=1; __utmt_b=1; __utma=207282326.2141731985.1445618921.1445618921.1445785836.2; __utmb=207282326.2.10.1445785836; __utmc=207282326; __utmz=207282326.1445618921.1.1.utmcsr=google|utmccn=(organic)|utmcmd=organic|utmctr=(not%20provided)' -H 'Connection: keep-alive' -H 'Cache-Control: max-age=0'
	done
    echo ________________________________________
    echo ________________________________________
done