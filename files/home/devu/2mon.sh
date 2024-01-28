#!/usr/bin/env bash

polybar-msg cmd quit

while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

#i3 &

polybar -q main -c ~/.config/polybar/material/config.ini &
polybar -q second -c ~/.config/polybar/material/config.ini &

/usr/bin/numlockx

xrandr --output DP-0 --off --output DP-1 --primary --mode 3840x2160 --rate 119.91 --gamma 0.9:0.9:0.9 --left-of HDMI-0 --output HDMI-0 --mode 2560x1440 --rate 120

feh --bg-scale $HOME/.config/background/firewatch-dark-minimal-5k-58.jpg

exit
