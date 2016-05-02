#!/bin/sh

for domain in `cat $1`
do
    echo _____________________________________________________
    echo PROBING $domain
    echo _____________________________________________________
    ping $domain -c 3
done
