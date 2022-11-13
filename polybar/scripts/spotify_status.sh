#!/bin/bash

if [ "$(playerctl --player=playerctld status)" = "Stopped" ]; then
    playerctl --player=playerctld metadata --format "Music Stopped"
elif [ "$(playerctl --player=playerctld status)" = "No players found"  ]; then
	playerctl --player=playerctld metadata --format "No player"
elif [ "$(playerctl --player=playerctld status)" = "Playing"  ]; then
    polybar-msg -p "$(pgrep -f "polybar now-playing")" hook spotify-play-pause 2 1>/dev/null 2>&1
    playerctl --player=playerctld metadata --format "{{ title }} - {{ artist }}"
elif [ "$(playerctl --player=playerctld status)" = "Paused"  ]; then
    polybar-msg -p "$(pgrep -f "polybar now-playing")" hook spotify-play-pause 2 1>/dev/null 2>&1
    playerctl --player=playerctld metadata --format "(PAUSED) {{ title }} - {{ artist }}"
else # Can be configured to output differently when player is paused
	echo -e "aekala" 
fi
