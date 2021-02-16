#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Just a standard color binding to ls
alias ls='ls --color=auto'
# shows all hidden files with not folders
alias la='ls -A'
# Show long listing with hidden Files that is also human readable
alias ll='ls -alF'
# This sets the prompt for terminal
# PS1='[\u@\h \W]\$ '
export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "


neofetch

stty -ixon # Disable ctrl-s and ctrl-1 (These commands pause and enable the terminal. We are going to disable it.
shopt -s autocd # Allows us to cd into directorys without typing cd.

# Set vim mode in bash
set -o vi


# navigation
alias ..='cd ..' 
alias ...='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'

# get fastest mirrors
alias mirror="sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist"
alias mirrord="sudo reflector --latest 50 --number 20 --sort delay --save /etc/pacman.d/mirrorlist"
alias mirrors="sudo reflector --latest 50 --number 20 --sort score --save /etc/pacman.d/mirrorlist"
alias mirrora="sudo reflector --latest 50 --number 20 --sort age --save /etc/pacman.d/mirrorlist"

# confirm before overwriting something
alias cp="cp -i"
alias mv='mv -i'
alias rm='rm -i'


#Some alias
alias p="sudo pacman"
alias SS="sudo systemctl"
alias v="vim"
alias sv="sudo vim"
alias r="ranger"
alias ka="killall"
alias g="git"
alias mkd="mkdir -pv"
alias mountsd="udisksctl mount -b /dev/mmcblk0p1"
alias unmountsd="udisksctl unmount -b /dev/mmcblk0p1"


# miniconda alias to path, done to avoid conflict by not running conda init and using the direct path
# alias cactivate="source /home/mgalvan/miniconda3/bin/activate"

# This adds the .cfg folder as the git repo and Home Directory as the working tree.
alias config='/usr/bin/git --git-dir=/home/mgalvan/.cfg/ --work-tree=/home/mgalvan'
