#
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#This is to source our aliases
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

_source_if() { [[ -r "$1" ]] && source "$1"; }

# cdpath
export CDPATH=.:\
$HOME/.config:\
~

# SSH-Agent
# This will allow a single ssh-agent process to run at a time.
# Passwords will only be saved for 1 hour
#
ssh-agent-fix(){
  if ! pgrep -u "$USER" ssh-agent > /dev/null; then
        ssh-agent -t 1h > "$XDG_RUNTIME_DIR/ssh-agent.env"
  fi
  if [[ ! -f "$SSH_AUTH_SOCK" ]]; then
        source "$XDG_RUNTIME_DIR/ssh-agent.env" >/dev/null
  fi
}

#ssh-agent-fix

# Make every new terminal use the current pywal colorscheme
#source ~/.cache/wal/colors-tty.sh

## bash autocomplete tab
bind "TAB:menu-complete"
bind '"\e[Z": menu-complete-backward'
bind "set show-all-if-ambiguous on"
bind "set menu-complete-display-prefix on"
bind "set completion-ignore-case on"


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
alias vi='$EDITOR'
alias ls='ls -ah --color=auto --group-directories-first'
alias grep='grep -i --colour=auto'
alias egrep='egrep -i --colour=auto'
alias fgrep='fgrep -i --colour=auto'
alias pgrep='pgrep -i --colour=auto'
alias diff='diff --color=auto'
alias lss='ls | less'
alias ip='ip -c'
alias temp='cd $(mktemp -d)'
alias ctemp='. $SCRIPTS/ctemp'
alias x='exit'
alias b='cd -'
alias c='printf "\e[H\e[2J"'
alias clear='printf "\e[H\e[2J"'
alias chmox='chmod +x'
alias ..='cd ..' 
alias ...='cd ../..'

# Function Alias
alias f='open_with_fzf'
alias o='cd_with_fzf'

# Function Alias
alias sy='youtube'
alias sw='wiki'
alias sr='reddit'
alias di='dict'

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

# open_with_fzf() {
#   choice=$(find $HOME -type f | fzf -d / --with-nth=-1 --cycle --layout=reverse-list   --keep-right --preview="cat {}" --preview-window=wrap:right:60% --bind=space:toggle-preview --bind=ctrl-l:preview-down --bind=ctrl-h:preview-up)
#   if [[ -z $choice ]];then
#     return
#   fi 
#   $EDITOR $choice
# }

open_with_fzf() {
  choice=$(find $HOME -maxdepth 5 \( -path "${HOME}/.cache" -o -path "${HOME}/.mozilla" -o -name "BraveSoftware" -o -name "virtualbox-vms" \) -prune -o  -type f -print| sort | fzf -d "${USER}/" --with-nth=2 --keep-right --cycle --layout=reverse-list  --preview="cat {}" --preview-window=wrap:right:60% --bind=space:toggle-preview --bind=ctrl-l:preview-down --bind=ctrl-h:preview-up)
  if [[ -z $choice ]];then
    return
  fi 

  if [[ $(xdg-mime query filetype "$choice") == *text* ]];then
    xdg-open $choice
    return  
  fi
  setsid -f  xdg-open "$choice"
  #xdg-mime query filetype example.ext
}


cd_with_fzf() {
  local dir_path=$(find $HOME -maxdepth 4 \( -path "${HOME}/.cache" -o -path "${HOME}/.mozilla" -o -name "BraveSoftware" -o -name "virtualbox-vms" \) -prune -o -type d -print| fzf -d "${USER}/" --with-nth=2 --keep-right --cycle --layout=reverse-list  --preview="cat {}" --preview-window=wrap:right:60% --bind=space:toggle-preview --bind=ctrl-l:preview-down --bind=ctrl-h:preview-up)
  #local dir_path=$(find $HOME -maxdepth 3 -type d  | grep -v 'gdrive\|.cache\|.dotfiles\|.git\|keyboards\|firefox\/\|qmk_firmware\/\|OpenCorePkg\/' | fzf --preview="tree -L 1 {}" --bind="space:toggle-preview" --preview-window=:hidden)
  local dir="${dir_path##*/}"
  cd "${dir_path}"

#   if [[ -z "$TMUX" ]]; then
#     tmux new-session  -s "$dir" && tmux attach -t "$dir" &&  tmux send-keys -t "${dir}:1" "cd ${dir_path}" Enter
#     echo "attach isn't attaching"
#     echo "keys aren't being sent"
#     return 0
#   fi
#   echo "This shouldn't run when we are calling from outside tmux"
#   tmux new-session -d -s "$dir"
#   tmux send-keys -t "${dir}:1" "cd ${dir_path}" Enter
#   tmux switch-client -t "$dir"

}

install_vim() {
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  vim -es -u ${HOME}/.vimrc -i NONE -c "PlugInstall" -c "qa"
}


owncomp=(greet)
for i in ${owncomp[@]}; do complete -C $i $i; done

_source_if "$HOME/.bash_personal"
_source_if "$HOME/.bash_private"
_source_if "$HOME/.bash_work"
