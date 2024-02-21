#!/bin/bash

# File path with phrases
t="/home/error/.config/bspwm/list" # Change this to your list path
a=0 

while IFS= read -r line; do
    for ((i = 0; i < ${#line}; i++)); do
        eh="${line:$a:$((i-a+1))}"
        echo $eh
        sleep 0.1 # Printing speed
        if [ $i -gt 120 ];then
        ((a++))
        echo "${line:$a:$((i-a+1))}"
        sleep 0.1 # Printing speed after max characters
       fi 
    done
a=0
sleep 0.5 # Waiting time between each quote
done < "$t"
