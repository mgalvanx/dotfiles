#!/bin/sh
userresources=$HOME/.Xresources
sysresources=/etc/X11/xinit/.Xresources

# merge in defaults and keymaps

if [ -f $sysresources ]; then

    xrdb -merge $sysresources

fi

if [ -f "$userresources" ]; then

    xrdb -merge "$userresources"

fi


# This 2 lines start the gnome-keyring needed to autologin to nextcloud.
eval $(gnome-keyring-daemon --start)
export SSH_AUTH_SOCK
# which_remaps &
# sudo kmonad ~/.config/kmonad/game_sir.kbd &
# sudo kmonad ~/.config/kmonad/thinkpadT440p.kbd &
# kmonad_remaps &
togglemon & 
xset r rate 300 50 &
xrdb ~/.Xresources &
trackpoint &
dunst &
dwm_status &
# dwmblocks &
#picom &
remaps & 
unclutter &
nextcloud --background &
setbg &

exec dwm
