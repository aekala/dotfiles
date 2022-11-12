#!/usr/bin/env bash
configList=('alacritty' 'bspwm' 'rofi' 'sxhkd')
for i in "${configList[@]}"; do
  cp -r ~/.config/$i ./$i
done
