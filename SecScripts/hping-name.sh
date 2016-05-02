#!/bin/sh

while read domain
do
    echo _____________________________________________________
    echo PROBING $domain
    echo _____________________________________________________
    echo hping3 $domain -S --tcp-timestamp -c 3
    hping3 $domain -S -c 3

done < $1
