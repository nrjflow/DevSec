#!/bin/sh

for domain in `cat $1`
do
    echo Probing $domain
    echo ________________________________________
    nmap -sT -O -Pn $domain 
    echo ________________________________________
    echo ________________________________________
done
