#
# ~/.bashrc
#
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#This is to source our aliases
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Make every new terminal use the current pywal colorscheme
#source ~/.cache/wal/colors-tty.sh

#FZF Keybindings
bind '"\C-f": "cd_with_fzf\n"'
bind '"\C-o": "open_with_fzf\n"'
bind '"\C-v": "nvim\n"'
#Programs to Run on Startup
# colorscript random
# python ~/python/scripts/bible_verse_json_gen.py

#2  a This sets the prompt for terminal
export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "

#--------------Bash Shell Options---------------------------
# Disable ctrl-s and ctrl-1 (These commands pause and enable the terminal. We are going to disable it.
stty -ixon
# Will not store any commands that start with a space and will not save duplicate commands
export HISTORYCONTROL=ignoreboth
export HISTSIZE=5000
export HISTFILESIZE=10000
#Enable Bash History To Append
shopt -s histappend

# This will protect us from overwriting a file using >
# set - o noclobber

# Allows us to cd into directorys without typing cd.
# shopt -s autocd 


### bat as a manpager

export MANPAGER="sh -c 'col -bx | bat -l man -p'"


#Fzf Functions
# A set of functions that allows us to quickly navigate to folders,files and even open them will our default applications
#Source:https://www.youtube.com/watch?v=QeJkAs_PEQQ

open_with_fzf() {
    fd -t f -H -I | fzf -m --preview="xdg-mime query default {}" | xargs -ro -d "\n" xdg-open 2>&-
}

cd_with_fzf() {
    cd $HOME && cd "$(fd -t d | fzf --preview="tree -L 1 {}" --bind="space:toggle-preview" --preview-window=:hidden)" 
}

pacs() {
    sudo pacman -S $(pacman -Ssq | fzf -m --preview="pacman -Si {}" --preview-window=:hidden --bind=space:toggle-preview)
}
