#!/bin/sh


echo 2 > /tmp/libinput_discrete_deltay_multiplier ;
pactl set-source-volume "alsa_input.pci-0000_00_1f.3.analog-stereo"	30% ; 
pactl set-source-volume "nui_mic_remap" 130% ;
discord --no-sandbox
