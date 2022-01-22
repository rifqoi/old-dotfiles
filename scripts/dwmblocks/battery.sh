#!/bin/sh

bat="$(upower -i $(upower -e | grep 'BAT') | grep state | awk '{print $2}')"
#percent="$(upower -i $(upower -e | grep 'BAT') | grep percent | awk '{print $2}' | sed 's/%//')"
for battery in /sys/class/power_supply/BAT?*; do
	percent=$(cat "$battery/capacity")
	if [ $bat == "discharging" ];
	then
		if [ $percent -gt 90 ]; then
			icon=""
		elif [ $percent -lt 91 ]; then
			icon=""
		elif [ $percent -lt 60 ]; then
			icon=""
		elif [ $percent -lt 20 ]; then
			icon=""
		elif [ $percent -lt 10]; then
			icon=""
		else 
			icon=""
		fi
	else
		if [ $percent -gt 90 ]; then
			icon=""
		elif [ $percent -lt 91 ]; then
			icon=""
		elif [ $percent -lt 60 ]; then
			icon=""
		elif [ $percent -lt 20 ]; then
			icon=""
		elif [ $percent -lt 10]; then
			icon=""
		else 
			icon=""
		fi
	fi

  if [[ $bat == "discharging" ]]; then
    printf "%s %d%%" "$icon" "$percent" "cas goblok";
  else
    printf "%s %d%%" "$icon" "$percent";
  fi
done && exit 0

