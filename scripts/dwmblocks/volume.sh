#!/bin/sh

checkmute="$(pamixer --get-mute)"
volume="$(pamixer --get-volume)"
if  [ $checkmute = false ] 
then
	if [ $volume -ge 50 ]
	then
		icon="󰕾" 
	elif [ $volume -gt 20 -a $volume -lt 51 ]
	then
		icon="󰖀" 
	else
		icon="󰕿"
	fi
else [ $checkmute = true ]
	icon="󰖁"
	volume="0"
fi

echo "$icon $volume%"
