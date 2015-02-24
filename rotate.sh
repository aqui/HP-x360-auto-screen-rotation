#!/bin/bash
################################################################################
# Just add this script to the startup applications. That's all you have to do. #
# Akif Batur                                                                   #
# akfbtr@gmail.com                                                             #
# http://www.akifbatur.com                                                     #
# https://github.com/aqui/HP-x360-auto-screen-rotation/blob/master/LICENSE     #
################################################################################

positionFile="/sys/devices/platform/lis3lv02d/position"

while :
do
  position=$(cat "$positionFile")
  arr=$(echo $position | grep -Eo "[0-9]{1,}|\-[0-9]{1,}")
  echo $position
  array=(${arr// / })
  x="${array[0]}"
  y="${array[1]}"
  #z="${array[2]}"
  if [ $x -gt 800 ]
    then
    xrandr -o right
  elif [ $x -lt -800 ]
    then
    xrandr -o left
  else
    if [ $y -lt -800 ]
      then
      xrandr -o normal
    fi
    if [ $y -gt 800 ]
      then
      xrandr -o inverted
    fi  
  fi
done
