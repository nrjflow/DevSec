#!/bin/sh

for domain in `cat $1`
do
    echo Probing $domain
    echo ________________________________________
    nmap -T4 -A -v -Pn $domain 
    echo ________________________________________
    echo ________________________________________
done

