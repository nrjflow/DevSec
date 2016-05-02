#!/bin/sh

for domain in `cat $1`
do
    echo _____________________________________________________
    echo PROBING $domain
    echo _____________________________________________________
    xprobe2 $domain
done
