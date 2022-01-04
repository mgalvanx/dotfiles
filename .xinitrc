#!/bin/sh
userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then

    xrdb -merge $sysresources

fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then

    xrdb -merge "$userresources"

fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi
# This 2 linesr start the gnome-keyring needed to autologin to nextcloud.
eval $(gnome-keyring-daemon --start)
export SSH_AUTH_SOCK
#udiskie --tray &
# which_remaps &
# sudo kmonad ~/.config/kmonad/game_sir.kbd &
# sudo kmonad ~/.config/kmonad/thinkpadT440p.kbd &
# kmonad_remaps &
xrdb ~/.Xresources &
togglemon & 
dunst &
dwm_status &
# dwmblocks &
picom &
xset r rate 300 50 &
#xrandr --dpi 156
# nitrogen --restore &
remaps & 
unclutter &
nextcloud --background &
setbg &

exec dwm
