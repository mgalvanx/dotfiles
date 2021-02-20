#!/usr/bin/env bash

function run {
  if ! pgrep -f $1 ;
  then
    $@&
  fi
}

run "xrandr --output DP2-1 --primary"
run "picom"
run "nm-applet"
run "pa-applet"
#sleep 2s
run "nitrogen --restore"
#The 2 xrandr commands above, when they follow each other cause the dual monitors to not display the nitrogen wallpapers properly. They must be split and then followed by the nitrogen command. 

