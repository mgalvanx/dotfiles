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

# This path will make application create file in these directories
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"


# So my tmux scripts use the con
export TMUX_CONFIG="~/.config/tmux/.tmux.conf"
