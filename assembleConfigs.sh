#!/usr/bin/env bash
configList=('alacritty' 'bspwm' 'polybar' 'rofi' 'sxhkd')
for i in "${configList[@]}"; do
  rm -rf ./$i
  cp -r ~/.config/$i ./$i
done
