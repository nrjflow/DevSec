#!/bin/sh

for domain in `cat $1`
do
    echo Probing $domain
    nmap -sP $domain 2> /dev/null \
        | grep ^Host
done
