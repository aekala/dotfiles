#!/usr/bin/env bash

killall -q polybar
# Terminate already running bar instances
# If all your bars have ipc enabled, you can use 
polybar-msg cmd quit
# Otherwise you can use the nuclear option:
# killall -q polybar

polybar -c $HOME/.config/polybar/config.ini primary 2>&1 | tee -a /tmp/polybar1.log & disown
polybar -c $HOME/.config/polybar/config.ini secondary 2>&1 | tee -a /tmp/polybar1.log & disown
printf "Polybar launched...\n\n"
cat /tmp/polybar.log
