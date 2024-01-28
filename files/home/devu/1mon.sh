#!/usr/bin/env bash

polybar-msg cmd quit

while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

#i3 &

polybar -q main -c ~/.config/polybar/material/config.ini &
#polybar -q second -c ~/.config/polybar/material/config.ini &

/usr/bin/numlockx

xrandr --output DP-0 --mode 2560x1440 --primary --rate 240 --output DP-1 --off --output HDMI-0 --off

exit
