#!/bin/sh


icon="󰍛"
checkmem="$(free -h | awk '/^Mem/ { print $3 }' | sed s/i//g)"

echo $icon $checkmem
