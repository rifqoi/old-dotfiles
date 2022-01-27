xsetroot -cursor_name Left_ptr
xset b off
kdeconnect-cli --pair -d d288f02606af1f24 &
redshift -l 6.2088:105.8456 &
export AWT_TOOLKIT=MToolkit 
~/scripts/utility/startup.sh &
unclutter &
#nitrogen --restore &
wal -R &
noisetorch -i
sxhkd &
picom --experimental-backends &
flameshot &
greenclip daemon &

