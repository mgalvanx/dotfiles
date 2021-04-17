
# This is for the dotfile bare repository
alias config='/usr/bin/git --git-dir=/home/mgalvan/.cfg/ --work-tree=/home/mgalvan'
alias g="git"


# rc and shell related shortcuts
alias rc="nvim ~/.bashrc"
alias rr="source ~/.bashrc"
alias al="nvim ~/.bash_aliases"
alias ev="nvim ~/.profile"
alias xi="$EDITOR ~/.xinitrc"   


# Nvim related aliases
alias vi="nvim"
alias vv="nvim ~/.config/nvim/init.vim" 
alias vm="nvim ~/vimwiki/index.wiki"


# DWM related shortcuts
alias dw="nvim ~/.config/dwm/config.h"
alias cdw="cd ~/.config/dwm && ls -a"

#Move TMUX configuration file to .config(Needs to here)
# TMUX_CONFIG="~/.config/tmux/.tmux.conf"

alias tmux="tmux -u -f $TMUX_CONFIG"      
alias tn="tmux -u -f $TMUX_CONFIG new"    
alias ta="tmux -u -f $TMUX_CONFIG attach" 
alias tt="nvim $TMUX_CONFIG"             



# confirm before overwriting something
alias cp="cp -iv"
alias mv='mv -i'
alias rm='rm -i'

# navigation
alias ..='cd ..' 
alias ...='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'

# Folder Shortcuts
alias cf="cd ~/.config && la"   
alias sc="cd ~/.local/bin && ls -a"   
alias h="cd ~/ && pwd" 
alias D="cd ~/Downloads && ls -a" 
alias mn="cd /mnt && ls -a" 
alias sc="cd ~/.local/bin && ls -a"   
alias cfk="$EDITOR ~/.config/sxhkd/sxhkdrc" 

# Changing "ls" to "exa"
alias ls='exa -al --color=always --group-directories-first' # my preferred listing
alias la='exa -a --color=always --group-directories-first'  # all files and dirs
alias ll='exa -l --color=always --group-directories-first'  # long format
alias lt='exa -aT --color=always --group-directories-first' # tree listing
alias l.='exa -a | egrep "^\."'

# These are for mounting drives
alias mountsd="udisksctl mount -b /dev/mmcblk0p1"
alias unmountsd="udisksctl unmount -b /dev/mmcblk0p1"
alias onedrive="rclone --vfs-cache-mode writes mount onedrive: ~/onedrive"

# For fun
alias aq='asciiquarium'     
alias aql='asciiquarium | lolcat'     
alias lc="lolcat"   
alias sl="sl | lolcat"
alias pomo="muccadoro | lolcat"  
alias ka="killall"
