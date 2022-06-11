#
# ~/.bashrc
#
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#This is to source our aliases
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi


# cdpath
export CDPATH=.:\
$HOME/.config:\
~

# Make every new terminal use the current pywal colorscheme
#source ~/.cache/wal/colors-tty.sh

#FZF Keybindings
bind '"\C-f": "cd_with_fzf\n"'
bind '"\C-o": "open_with_fzf\n"'

#This sets the prompt for terminal
PROMPT_LONG=50
PROMPT_MAX=95

__ps1(){
  local P='$'
  #colors for prompt
  local r='\[\e[1;31m\]' #
  local u='\[\e[1;36m\]'
  local h='\[\e[1;32m\]'
  local w='\[\e[34m\]'
  local p='\[\e[34m\]'
  local g='\[\e[37m\]'
  local x='\[\e[0m\]'

  PS1="$u\u$g@$h\h$g:$w\W$p$P$x "
}

PROMPT_COMMAND="__ps1"
#--------------Bash Shell Options---------------------------
# Disable ctrl-s and ctrl-1 (These commands pause and enable the terminal. We are going to disable it.
stty -ixon
# Will not store any commands that start with a space and will not save duplicate commands
export HISTORYCONTROL=ignoreboth
export HISTSIZE=5000
export HISTFILESIZE=10000
#Enable Bash History To Append
shopt -s histappend
shopt -s globstar

# This will protect us from overwriting a file using >
# set - o noclobber

# This needed in case we are on a remote machine. Otherwise inputrc is read locally
set -o vi

# Terminal Alias
alias ls='ls -ah --color=auto --group-directories-first'
alias ll='ls -alh --color=always --group-directories-first'  # long format
alias lt='ls -aT --color=always --group-directories-first'  # long format
alias la='ls -a --color=always --group-directories-first'  # all files and dirs
alias grep='grep -i --colour=auto'
alias egrep='egrep -i --colour=auto'
alias fgrep='fgrep -i --colour=auto'
alias temp='cd $(mktemp -d)'
alias ctemp='. $SCRIPTS/ctemp'
alias x='exit'
alias b='cd -'
alias c='printf "\e[H\e[2J"'
alias clear='printf "\e[H\e[2J"'
alias chmox='chmod +x'
alias ip='ip -c'
alias ..='cd ..' 
alias ...='cd ../..'



# Pager
# Hack that makes man pages uses color(More minimal than using bat) Rob suggest to copy and paste(Manpager variable does not work on all system , this works universally)# See beginner boost 27 at the 10:00 mark to get this to work

if test -x /usr/bin/lesspipe; then
	export LESSOPEN="| /usr/bin/lesspipe %s";
	export LESSCLOSE="/usr/bin/lesspipe %s %s";
fi
export LESS_TERMCAP_mb="[35m" # magenta
export LESS_TERMCAP_md="[32m" # green
export LESS_TERMCAP_me="[0m" # "^[0m"
export LESS_TERMCAP_se="[0m" # "^[0m"
export LESS_TERMCAP_so="[34m"  # purple
export LESS_TERMCAP_ue="[0m" # "^[0m"
export LESS_TERMCAP_us="[4m"  # underline

### bat as a manpager

#export MANPAGER="sh -c 'col -bx | bat -l man -p'"


# temp() {
#   if [[ -z $TEMP_DIR ]]; then
#     temp_dir=$(mktemp -d)
#     export TEMP_DIR="$temp_dir"
#   fi
#   cd $TEMP_DIR
# }

#Fzf Functions
# A set of functions that allows us to quickly navigate to folders,files and even open them will our default applications
#Source:https://www.youtube.com/watch?v=QeJkAs_PEQQ

open_with_fzf() {
    fd -t f -H -I | fzf -m --preview="xdg-mime query default {}" | xargs -ro -d "\n" xdg-open 2>&-
}

cd_with_fzf() {
    cd $HOME && cd "$(fd -t d | fzf --preview="tree -L 1 {}" --bind="space:toggle-preview" --preview-window=:hidden)" 
}

owncomp=(greet)
for i in ${owncomp[@]}; do complete -C $i $i; done
