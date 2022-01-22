#!/bin/sh

# This 2 lines start the gnome-keyring needed to autologin to nextcloud.

xrdb ~/.Xresources &

eval $(gnome-keyring-daemon --start)
export SSH_AUTH_SOCK
# which_remaps &
# sudo kmonad ~/.config/kmonad/game_sir.kbd &
# sudo kmonad ~/.config/kmonad/thinkpadT440p.kbd &
# kmonad_remaps &
togglemon & 
trackpoint &
dunst &
dwm_status &
# dwmblocks &
picom &
xset r rate 300 50 &
remaps & 
# xinput disable "SynPS/2 Synaptics TouchPad" &
unclutter &
nextcloud --background &
setbg &

exec dwm
