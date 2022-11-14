#!/bin/bash

if [ "$(playerctl status)" = "Stopped" ]; then
    echo "aekala"
elif [ "$(playerctl status)" = "No players found"  ]; then
	playerctl metadata --format "No player"
elif [ "$(playerctl status)" = "Playing"  ]; then
    polybar-msg -p "$(pgrep -f "polybar now-playing")" hook spotify-play-pause 2 1>/dev/null 2>&1
    playerctl metadata --format "{{ title }} - {{ artist }}"
elif [ "$(playerctl status)" = "Paused"  ]; then
    polybar-msg -p "$(pgrep -f "polybar now-playing")" hook spotify-play-pause 2 1>/dev/null 2>&1
    playerctl metadata --format "(PAUSED) {{ title }} - {{ artist }}"
else # Can be configured to output differently when player is paused
	echo "aekala" 
fi
