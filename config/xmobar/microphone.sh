#!/bin/sh

getmute="$(pactl get-source-mute @DEFAULT_SOURCE@ | awk '{print $2}')"

case $getmute in
	("yes")	echo "<fn=4>󰍭</fn> ded" ;;
	("no")	echo "<fn=4>󰍬</fn> alive" ;;
esac

