#!/bin/bash

rofi_command="rofi -theme $HOME/.config/rofi/dracula-power.rasi"

# Options
shutdown="⏻ Shutdown"
reboot="⩽ Restart"
suspend="⏾ Sleep"
logout="⟰ Logout"

# Variable passed to rofi
options="$suspend\n$logout\n$reboot\n$shutdown"

#chosen="$(echo -e "$options" | $rofi_command -p "Power" -dmenu)"
chosen="$(echo -e "$options" | $rofi_command -p "アエカラ" -dmenu -selected-row 0)"
case $chosen in
    $shutdown)
        systemctl poweroff
        ;;
    $reboot)
        systemctl reboot
        ;;
    $suspend)
        systemctl suspend
        ;;
    $logout)
	bspc quit
        ;;
esac
