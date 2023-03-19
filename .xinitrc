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
#rclone mount --daemon --vfs-cache-mode full gdrive: /home/mgalvan/gdrive/ &
#eval $(gnome-keyring-daemon --start)
trackpoint &
dunst &
dwm_status &
# dwmblocks &
mouse &
xcompmgr &
remaps & 
unclutter &
#nextcloud --background &
#setbg &
pulseaudio --start &
xrdb ~/.Xresources &
xset r rate 150 30 &
sleep 8 && togglemon &

exec dwm
