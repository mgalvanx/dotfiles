# Bash Aliases

# rc and shell related shortcuts
alias cfb="vi ~/.bashrc"
alias cfv="vi ~/.vimrc"
alias cfa="vi ~/.bash_aliases"
alias cfp="vi ~/.profile"
alias cfg="sudoedit /etc/default/grub"
alias cfx="vi ~/.xinitrc"   
alias cfX="vi ~/.Xresources"   
alias cfn="vi ~/.local/newsboat/config"   
alias cfu="vi ~/.local/newsboat/urls"   


alias gmk="sudo grub-mkconfig -o /boot/grub/grub.cfg"


# cli browsing aliases
alias ?='clibrowse lynx duck'
alias ?b='clibrowse lynx brave'
alias ?g='clibrowse lynx google'
alias ??='clibrowse w3m duck'
alias ??b='clibrowse w3m brave'
alias ??g='clibrowse w3m google'


# Tmux
alias ta='tmux attach'
#alias tx='tmux new-session -n shell'

# newsboat
alias nb='newsboat'

# ytfzf 
#alias yt='ytfzf -t --detach -l' # default sorts by relevance
alias yt='yt_pages' # default sorts by relevance
alias yth='ytfzf -t -H'
alias ytv='ytfzf -t --sort-by=view_count'
alias ytd='ytfzf -t --sort-by=upload_date'
alias ytr='ytfzf -t --sort-by=rating'

yt_pages(){
  query="$*"
  count=1
  if [[ -z "$query" ]]; then
    exit 0
  fi
  clear
  while true; do
    clear
    ytfzf -t --detach  -l --pages-start="$count" "$query"
    read -p "Enter n for next page? " input
    case "$input" in
  		n) ((count=count+1)) ;;
  		l) continue ;;
			*) break
 		esac
  done
  clear
}

# virtual box
alias vmlist='vboxmanage list vms'
#alias vmon='vboxmanage list runningvms'

# notes
alias notes='cd $NOTES'
alias repos='cd $REPOS'
alias n='notesearch'
alias nn='newnote'
alias in='inbox'
alias pr='projects'
alias ar="areas"
alias re="cd /home/mgalvan/nextcloud/notes/3_Resources && la"
alias ah="cd /home/mgalvan/nextcloud/notes/4_Archives && la"

# Terminal Aliases
alias o='xdg-open'
alias open='xdg-open'



# This is for the dotfile bare repository
alias dot='/usr/bin/git --git-dir=/home/mgalvan/.dotfiles/ --work-tree=/home/mgalvan'
alias g="git"

# DWM related shortcuts
alias dw="$EDITOR ~/.config/dwm/config.h"
alias cdw="cd ~/.config/dwm && ls -a"

#Move TMUX configuration file to .config(Needs to here)
# TMUX_CONFIG="~/.config/tmux/.tmux.conf"

#alias tmux="tmux -u -f $TMUX_CONFIG"      
#alias tn="tmux -u -f $TMUX_CONFIG new"    
#alias ta="tmux -u -f $TMUX_CONFIG attach" 
#alias tt="$EDITOR $TMUX_CONFIG"             



# For fun
alias fishies='asciiquarium | lolcat'     
alias lc="lolcat"   
alias sl="sl | lolcat"
alias ka="killall"


# This function works by automatically creating a alias for the present working directory
# Simply type ad followed by the name of the alias you want the pwd to be called
# I modified it from the original source below so that the alias are saved to bash_aliases
#https://benmyers.dev/blog/alias-directories-unix/

function ad() {    
    if [[ "$#" -ne 1 ]]    
    then        
        echo "USAGE: ad <alias>"        
        return 0    
    elif [[ -n "$(alias $1 2>/dev/null)" ]]    
    then        
        echo "Alias already exists!"        
        return 0    
    fi    
        echo -e "alias $1=\"cd $(pwd)\"" >> ~/.bash_aliases
        source ~/.bashrc    
        echo "Alias was added successfully."
    }




# Folder Shortcuts
alias snippets='cd $SNIPPETS'
alias cloud='cd $HOME/nextcloud'
alias conf="cd ~/.config"   
alias sc="cd ~/.local/bin/scripts && ls -a"   
alias mn="cd /mnt && ls -a" 
alias d="cd /home/mgalvan/nextcloud/files/0_Inbox_Files"
alias mt="cd /mnt"
