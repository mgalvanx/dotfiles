# I'm using a .profile instead of a .bash_profile because it looks neater in the home directory.(It also has better compatibility with other shells)
# This file runs once I login and sets up envirnmental variables so my programs can know my default(where to save data).


# This command sources the bash rc file.
[[ -f ~/.bashrc ]] && . ~/.bashrc

# Default Programs
export EDITOR="vim" # This is alias to a vim that is a tmux wrapper
export TERMINAL="st"
export BROWSER="firefox"
export BROWSERCLI="w3m"

# Path Variables
export SCRIPTS=~/.local/bin/scripts
export WALLPAPER=~/nextcloud/wallpaper
export NOTES=~/nextcloud/notes

# Adds `~/.local/bin` to $PATH(So my custom scripts can run from the command line)
# export PATH=$PATH:~/.local/bin/scripts
export PATH=~/.local/bin/scripts:$PATH
export PATH=$PATH:$SCRIPTS/cert_scripts
export PATH=$PATH:$SCRIPTS/tmux_scripts
export PATH=$PATH:$SCRIPTS/notescripts
export PATH=$PATH:$SCRIPTS/work-scripts
export PATH=$PATH:~/.local/bin
export PATH=$PATH:~/.local/bin/statusbar


# These settings will make applications create configuration files in these custom locations(To keep home directory clean)
export GITUSER="${USER}x"
export REPOS="${HOME}/repos/${GITUSER}"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export INPUTRC="${XDG_CONFIG_HOME:-$HOME/.config}/shell/inputrc"
export XDG_DESKTOP_DIR="${HOME}/${USER}"
export XDG_DOWNLOAD_DIR="${HOME}/downloads"
#export HISTFILE=~/.config/bash/.bash_history

# Change the default GOPATH and GOBIN
#export GOPATH="$HOME/.local/share/go"
#export GOBIN="$HOME/.local/bin"

# This makes tmux use .config to save configuration files.(Used with bash aliases)
#export TMUX_CONFIG="~/.config/tmux/.tmux.conf"

# moves .python_history to .config 
# export PYTHONSTARTUP="${XDG_CONFIG_HOME:-$HOME/.config}/pythonstartup.py"
export PYTHONSTARTUP="${XDG_CONFIG_HOME:-$HOME/.config}/python/pythonstartup.py"

# Autostart startx
#if [ "$(tty)" = /dev/tty1 ]; then
#   exec startx
#fi

