#!/bin/sh

interval=0
path="/home/thousandv/scripts/bar"

battery(){
  source $path/battery.sh
}

brightness(){
  source $path/brightness.sh
}

calendar(){
  source $path/calendar.sh
}

memory(){
  source $path/memory.sh
}

volume(){
    source $path/volume.sh
}

microphone(){
    source $path/microphone.sh
}

datee(){
    source $path/date.sh
}

wifi(){
  source $path/wifi.sh
}

user(){
  username=$(users)
  echo " $username"
}
while true; do

  [ $interval == 0 ] || [ $(($interval % 3600)) == 0 ]
  interval=$((interval + 1))
  
  xsetroot -name "$(memory) / $(microphone) / $(volume) / $(brightness) / $(battery) / $(wifi) / $(calendar) / $(datee) "
done
