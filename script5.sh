#!/bin/bash

hosts=("www.google.com" "www.geeksforgeeks.org" "twitter.com")

for host in "${hosts[@]}"; do
    if ping -c 1 "$host"; then
        echo "$host is up"
    else
        echo "$host is down"
    fi
done
