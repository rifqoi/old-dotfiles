Config { font            = "xft:Droid Sans Mono Nerd Font:pixelsize=30:antialias=true:hinting=true"
       , additionalFonts = [ "xft:Iosevka Nerd Font:pixelsize=20:antialias=true:hinting=true"
                           , "xft:Font Awesome 5 Free Solid:pixelsize=22"
                           , "xft:Fira Code Nerd Font:pixelsize=18:antialias=true:hinting=true"
                           , "xft:Material Design Icons:size=17"
                           , "xft:Material Design Icons:size=15"
                           , "xft:Font Awesome 5 Brands:pixelsize=12"
                           ]
       -- , bgColor      = "#2e3440"
       , bgColor      = "BGCOLOR"
       , fgColor      = "FGCOLOR"
       -- Position TopSize and BottomSize take 3 arguments:
       --   an alignment parameter (L/R/C) for Left, Right or Center.
       --   an integer for the percentage width, so 100 would be 100%.
       --   an integer for the minimum pixel height for xmobar, so 24 would force a height of at least 24 pixels.
       --   NOTE: The height should be the same as the trayer (system tray) height.
       , position       = Static {xpos = 1430, ypos = 5, width = 290, height = 50}
       -- , position       = TopSize L 100 50
       , lowerOnStart = True
       , hideOnStart  = False
       , allDesktops  = True
       , persistent   = True
       , iconRoot     = ".xmonad/xpm/"  -- default: "."
       , commands = [
                     Run UnsafeStdinReader
                    , Run BatteryP ["BAT1"]
                     ["-t", "<acstatus>"
                     , "-L", "20", "-H", "80"
                     , "-l", "#bf616a", "-h", "#bbb"
                     , "--", "-O", "<fc=#87af87><fn=4>󰂄</fn></fc> <left>%", "-o", "<fc=#bf616a><fn=4>󰁹</fn></fc> <left>%", "-i", "<fc=#87af87><fn=4>󰂅</fn></fc> <left>%"
                     ,"-a", "notify-send -i ~/.config/dunst/icons/skull.svg -u critical -t 500 'BATREEEE \n GOBLOOOK \n 󰚌󰚌󰚌'"
                     ,"-A", "20"
                     ] 10
                    , Run Date "<fc=COLOR1><fn=4>󰃭</fn> %A, %_d %B</fc> <fc=COLOR1><fn=4>󰅒</fn> %H:%M</fc>" "date" 10
                    -- , Run Date "<fc=COLOR1><fn=4>󰅒</fn> %H:%M</fc>" "date" 10
                    , Run Volume "default" "Master"
                      [ "-t", "<status> <fc=COLOR7><volume>%</fc>"
                      , "--"
                      , "-o", "<fn=4>󰎊</fn>" , "-O", ""
                      , "-C", "COLOR7" , "-c" , "#ea6962" 
                      , "-H", "60" , "-h", "<fn=4>󰎌</fn>", "-m" , "<fn=4>󰎋</fn>"
                      , "-L", "30" , "-l", "<fn=4>󰎉</fn>"
                      ] 1
                    , Run Brightness
                      ["-t", "<percent> <ipat>",  "--", "-D", "/sys/class/backlight/intel_backlight/"
                      ] 1 
                    -- , Run Memory ["-t", "<used>/<total>M"] 100
                    , Run Memory ["-t", "<used>M"] 100
                    , Run Wireless "" ["-t", "<ssid>"] 10
                    , Run Com "/home/thousandv/.config/xmobar/microphone.sh" [] "mic"1
                    , Run Com "/home/thousandv/.config/xmobar/wifi.sh" [] "wifi"1
                    ]
       , sepChar = "%"
       , alignSep = "}{"
       , template = " \
       \<action=`alacritty -e nmtui`><fn=3><fc=COLOR3><fn=4>󰖩</fn> %wifi%</fc></fn></action> \
       \<action=`xdotool key super+shift+y`><fn=3><fc=COLOR2><fn=4>󰘚</fn> %memory%</fc></fn></action> \
       \"
       }

       -- , position       = TopSize L 98 50
