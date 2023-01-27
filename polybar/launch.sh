#!/usr/bin/env bash

killall -q polybar
# Terminate already running bar instances
# If all your bars have ipc enabled, you can use 
polybar-msg cmd quit
# Otherwise you can use the nuclear option:
# killall -q polybar

# Launch bar1 and bar2
echo "---" | tee -a /tmp/polybar1.log /tmp/polybar2.log
polybar -c $HOME/.config/polybar/config.ini primary 2>&1 | tee -a /tmp/polybar1.log & disown
my_laptop_external_monitor = $(xrandr --query | grep 'VGA-1')
#if [[ $my_laptop_external_monitor = *connected* ]]; then
polybar -c $HOME/.config/polybar/config.ini secondary 2>&1 | tee -a /tmp/polybar1.log & disown
#fi

echo "Bars launched..."
