#!/bin/sh

status=$(nmcli g | awk 'FNR == 2 {print $2}')

if [ $status == "full" ];
then
  echo " Connected"
elif [ $status == "limited"];
then
  echo " Limited"
elif [ $status == "none"];
then
  echo " Disconnected"
else
  echo " Unknown"
fi
