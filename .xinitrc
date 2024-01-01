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
#home &
# dwmblocks &
mouse &
xcompmgr &
remaps & 
unclutter &
nextcloud --background &
keynav daemonize &
#setbg &
pulseaudio --start &
xrdb ~/.Xresources &
#sleep 1 && triple-monitors &
xset r rate 150 30 &
# The screens will not turn on if there is not a 3 second delay
sleep 3 && triple-monitors &
sleep 20 && tmux-home &
sleep 21 && pixel &

exec dwm

