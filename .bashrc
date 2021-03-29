#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#Programs to Run on Startup
colorscript random
python ~/python/scripts/bible_verse_json_gen.py

# Changing "ls" to "exa"
alias ls='exa -al --color=always --group-directories-first' # my preferred listing
alias la='exa -a --color=always --group-directories-first'  # all files and dirs
alias ll='exa -l --color=always --group-directories-first'  # long format
alias lt='exa -aT --color=always --group-directories-first' # tree listing
alias l.='exa -a | egrep "^\."'


# This sets the prompt for terminal
# PS1='[\u@\h \W]\$ '
export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "



stty -ixon # Disable ctrl-s and ctrl-1 (These commands pause and enable the terminal. We are going to disable it.
shopt -s autocd # Allows us to cd into directorys without typing cd.

# Set vim mode in bash and Control-l takes priority over vi mode
set -o vi
bind -m vi-command 'Control-l: clear-screen'
bind -m vi-insert 'Control-l: clear-screen'

### "vim" as manpager
#export MANPAGER='/bin/bash -c "vim -MRn -c \"set buftype=nofile showtabline=0 ft=man ts=8 nomod nolist norelativenumber nonu noma\" -c \"normal L\" -c \"nmap q :qa<CR>\"</dev/tty <(col -b)"'

### "nvim" as manpager
export MANPAGER="nvim -c 'set ft=man' -"

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
alias cp="cp -iv"
alias mv='mv -i'
alias rm='rm -i'


#Some alias
alias p="sudo pacman"
alias SS="sudo systemctl"
alias vi="nvim"
alias sv="sudo nvim"
alias r="ranger"
alias ka="killall"
alias g="git"
alias mkd="mkdir -pv"
alias mountsd="udisksctl mount -b /dev/mmcblk0p1"
alias unmountsd="udisksctl unmount -b /dev/mmcblk0p1"
alias onedrive="rclone --vfs-cache-mode writes mount onedrive: ~/onedrive"
# This adds the .cfg folder as the git repo and Home Directory as the working tree.
alias config='/usr/bin/git --git-dir=/home/mgalvan/.cfg/ --work-tree=/home/mgalvan'

# This starts the Starship prompt
# eval "$(starship init bash)"
