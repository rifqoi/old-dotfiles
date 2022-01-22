#!/bin/sh
userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap
xsetroot -cursor_name Left_ptr
xset b off


# merge in defaults and keymaps
if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi
if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

redshift -l 6.2088:105.8456 &
xrdb ~/.Xresources
export AWT_TOOLKIT=MToolkit 
~/scripts/utility/startup.sh &
unclutter &
nitrogen --restore &
noisetorch -i
wal -R &
sxhkd &
picom --experimental-backends &
flameshot &
dwmblocks &
greenclip daemon &
# while true; do
# 	/usr/local/bin/dwm 2>/dev/null
# done
# exec awesome
# exec bspwm
# exec dbus-launch leftwm
# exec sway
exec xmonad
