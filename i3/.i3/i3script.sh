#!/bin/bash

# shell scipt to prepend i3status with more stuff

i3status | while :
do
        read line
        LG=$(setxkbmap -print | awk -F"+" '/xkb_symbols/ {print $2}')
        echo "LG: $LG | $line" || exit 1
done
