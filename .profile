# This command sources the bash rc file.
[[ -f ~/.bashrc ]] && . ~/.bashrc

# Adds `~/.local/bin` to $PATH
export PATH=$PATH:~/.local/bin
export PATH=$PATH:~/.local/bin/statusbar

# Default Programs
export EDITOR="nvim"
export TERMINAL="alacritty"
export BROWSER="firefox"

# This path will make application create file in these directories
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export INPUTRC="${XDG_CONFIG_HOME:-$HOME/.config}/shell/inputrc"
export HISTFILE=~/.config/bash/history
# So my tmux scripts use the con
export TMUX_CONFIG="~/.config/tmux/.tmux.conf"
# moves .python_history to .config
export PYTHONSTARTUP="${XDG_CONFIG_HOME:-$HOME/.config}/pythonstartup.py"
# Autostart startx
if [ "$(tty)" = /dev/tty1 ]; then
   exec startx
fi

