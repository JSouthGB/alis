#!/usr/bin/env bash

#if type "xrandr"; then
#  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
#    MONITOR=$m polybar --reload example &
#  done
#else
#  polybar --reload example &
#fi

if type "xrandr"; then
  for d in $(xrandr --query | grep " disconnected" | cut -d" " -f1); do
    if [ "$d" = "DP-1"] || [ "$d" = "HDMI-0" ]
      echo "disconnected"
    else
      for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
        echo $m
  done
else
  echo "no"
fi
