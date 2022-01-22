#!usr/bin/sh
ID=500
APPNAME="mic_notif"

# Sends the notification
function dunst_notif {
    muted=$(pactl get-source-mute @DEFAULT_SOURCE@ | awk '{print $2}')
    # The other stuff
    if [[ "$muted" == "yes"  ]] ; then
      icon_name="~/.config/dunst/icons/hutao_ghost.png"
    fi
    # Send notification thing
    dunstify --icon=~/.config/dunst/icons/barbara_heal.png  -r $ID -a $APPNAME -h string:bgcolor:#0f1213 -h string:frcolor:#4c566a -h string:fgcolor:#ccdce4 '󰧰󰧰󰧰󰧰󰧰󰧰' "<span foreground='#556A73' font_desc='Fira Code Nerd Font Italic 17'><b>Mi</b></span><span foreground='#9C7863' font_desc='Fira Code Nerd Font Italic 17'><b>cro</b></span><span foreground='#5A7988' font_desc='Fira Code Nerd Font Italic 17'><b>phone</b></span>\n<span foreground='#ccdce4' font_desc='Material Icon Design 17'><b>R E V I V E D</b></span>"
    # dunstify  -i $icon_name -r $ID -a $APPNAME -h string:bgcolor:#0f1213 -h string:frcolor:#4c566a -h string:fgcolor:#ccdce4 '      ' "<span foreground='#556A73' font_desc='Fira Code Nerd Font Italic 19'><b>Vo</b></span><span foreground='#9C7863' font_desc='Fira Code Nerd Font Italic 19'><b>lu</b></span><span foreground='#5A7988' font_desc='Fira Code Nerd Font Italic 19'><b>me</b></span>\n<span foreground='#ccdce4' font_desc='Material Icon Design 17'><b>$(bar_thingy)</b></span>"
}


# Main thing
if [[ $# -gt 0 ]] ; then
    case "$1" in
        toggle)
            pactl set-source-mute @DEFAULT_SOURCE@ toggle
            muted=$(pactl get-source-mute @DEFAULT_SOURCE@ | awk '{print $2}')
            if [[ "$muted" == "yes" ]] ; then
                icon_name="~/.config/dunst/icons/hutao_ghost.png"
                dunstify  -i $icon_name -r $ID -a $APPNAME -h string:bgcolor:#0f1213 -h string:frcolor:#4c566a -h string:fgcolor:#ccdce4 '󰚌󰚌󰚌󰚌󰚌󰚌' "<span foreground='#556A73' font_desc='Fira Code Nerd Font Italic 17'><b>Mi</b></span><span foreground='#9C7863' font_desc='Fira Code Nerd Font Italic 17'><b>cro</b></span><span foreground='#5A7988' font_desc='Fira Code Nerd Font Italic 17'><b>phone</b></span>\n<span foreground='#ccdce4' font_desc='Material Icon Design 18'><b>D E D</b></span>"
                canberra-gtk-play -i message-sent-email -d "micDED"
            else
                dunst_notif
                canberra-gtk-play -i bell-terminal	 -d "micRevived"
            fi
            ;;
    esac
fi

