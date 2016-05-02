#!/bin/sh

for domain in `cat $1`
do
    echo Probing $domain
    echo ________________________________________
    nslookup $domain 
    echo ________________________________________
    echo ________________________________________
done

