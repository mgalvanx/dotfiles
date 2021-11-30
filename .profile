# I'm using a .profile instead of a .bash_profile because it looks neater in the home directory.(It also has better compatibility with other shells)
# This file runs once I login and sets up envirnmental variables so my programs can know my default(where to save data).


# This command sources the bash rc file.
[[ -f ~/.bashrc ]] && . ~/.bashrc

# Default Programs
export EDITOR="nvim"
export TERMINAL="alacritty"
export BROWSER="firefox"

# Adds `~/.local/bin` to $PATH(So my custom scripts can run from the command line)
# export PATH=$PATH:~/.local/bin/scripts
export PATH=~/.local/bin/scripts:$PATH
export PATH=$PATH:~/.local/bin/cert_scripts
export PATH=$PATH:~/.local/bin/py_scripts
export PATH=$PATH:~/.local/bin
export PATH=$PATH:~/.local/bin/statusbar


# These settings will make applications create configuration files in these custom locations(To keep home directory clean)
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export INPUTRC="${XDG_CONFIG_HOME:-$HOME/.config}/shell/inputrc"
export HISTFILE=~/.config/bash/.bash_history


# This makes tmux use .config to save configuration files.(Used with bash aliases)
export TMUX_CONFIG="~/.config/tmux/.tmux.conf"

# moves .python_history to .config 
# export PYTHONSTARTUP="${XDG_CONFIG_HOME:-$HOME/.config}/pythonstartup.py"
export PYTHONSTARTUP="${XDG_CONFIG_HOME:-$HOME/.config}/python/pythonstartup.py"

# Autostart startx
if [ "$(tty)" = /dev/tty1 ]; then
   exec startx
fi

