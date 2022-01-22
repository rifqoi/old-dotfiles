#!/bin/sh

# record screen only
# ffmpeg -f x11grab -s 1920x1080 -i :0.0   -y  ~/test.mp4
# ffmpeg -f x11grab -s 1920x1080 -i :0.0   -y  ~/test.gif

# record screen + desktop audio
# ffmpeg -f x11grab -s 1920x1080  -i :0.0 -f pulse -ac 2 -i alsa_output.pci-0000_00_1f.3.analog-stereo.monitor -y  ~/test.mp4

# record screen + voice 
# https://ffmpeg.org/ffmpeg-filters.html#amix
# ffmpeg -f x11grab -s 1920x1080 -r 30 -i :0.0 -f pulse -ac 2 -i 0  -y ~/test.mp4

# record audio
ffmpeg -f pulse -ac 2 -i default -y ~/test.mp4
