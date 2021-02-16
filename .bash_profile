# This command sources the bash rc file.
[[ -f ~/.bashrc ]] && . ~/.bashrc

# Autostart startx
if [ "$(tty)" = /dev/tty1 ]; then
    exec startx
fi



