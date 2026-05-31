#!/usr/bin/env bash

t="$HOME/list"
r(){ exec "$0"; }
trap r SIGUSR1
[ ! -f "$t" ] && echo "Not found: $t" && exit 1

g=(
  'ffffff' '01ffdc' '4DF527'
  '2b6afb' 'D627F5' 'ff01f5'
  'fbdc2b' 'ff9d01'
)

x=0

next_color(){
  (( x = (x + 1) % ${#g[@]} ))
}

while read l; do
  a=0
  for (( i=0; i<${#l}; i++ )); do
    if (( i < 73 )); then
      printf "%%{F#%s}%s%%{F-}\n" "${g[x]}" "${l:a:i-a+1}"
      next_color
      sleep 0.1
    else
      (( a++ ))
      printf "%%{F#%s}%s%%{F-}\n" "${g[x]}" "${l:a:i-a+1}"
      next_color
      sleep 0.1
    fi
  done
  a=0
  sleep 0.1
done < "$t"
