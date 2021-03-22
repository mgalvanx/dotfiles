# This command sources the bash rc file.
[[ -f ~/.bashrc ]] && . ~/.bashrc

# Autostart startx
#if [ "$(tty)" = /dev/tty1 ]; then
#    exec startx
#fi

# Adds `~/.local/bin` to $PATH
export PATH=$PATH:~/.local/bin

# Default Programs
export EDITOR="nvim"
export TERMINAL="alacritty"
export BROWSER="firefox"
