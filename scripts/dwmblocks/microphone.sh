#!/bin/sh

getmute="$(pactl get-source-mute @DEFAULT_SOURCE@ | awk '{print $2}')"

case $getmute in
	("yes")	echo "󰍭" ;;
	("no")	echo "󰍬" ;;
esac

