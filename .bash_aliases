# Bash Aliases

# Lynx Alias
alias '?'=duck
alias '??'=google
alias '???'=bing

# newsboat
alias nb='newsboat'

# ytfzf 
alias yt='ytfzf -t '
alias yts='ytfzf -St '
alias yth='ytfzf -Ht '

# notes
alias notes='cd $NOTES'
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
alias config='/usr/bin/git --git-dir=/home/mgalvan/.dotfiles/ --work-tree=/home/mgalvan'
alias g="git"

# rc and shell related shortcuts
alias rc="$EDITOR ~/.bashrc"
alias rr="source ~/.bashrc"
alias al="$EDITOR ~/.bash_aliases"
alias ev="$EDITOR ~/.profile"
alias xi="$EDITOR ~/.xinitrc"   
 

# Grub Menu Editing
alias gr="sudoedit /etc/default/grub"
# Nvim related aliases
alias vi="vim"
alias vv="nvim ~/.config/nvim/init.vim" 
alias vm="nvim ~/vimwiki/index.wiki"


# DWM related shortcuts
alias dw="$EDITOR ~/.config/dwm/config.h"
alias cdw="cd ~/.config/dwm && ls -a"

#Move TMUX configuration file to .config(Needs to here)
# TMUX_CONFIG="~/.config/tmux/.tmux.conf"

#alias tmux="tmux -u -f $TMUX_CONFIG"      
#alias tn="tmux -u -f $TMUX_CONFIG new"    
#alias ta="tmux -u -f $TMUX_CONFIG attach" 
#alias tt="$EDITOR $TMUX_CONFIG"             


# Changing "ls" to "exa"
#alias ls='exa -al --color=always --group-directories-first' # my preferred listing
#alias la='exa -a --color=always --group-directories-first'  # all files and dirs
#alias ll='exa -l --color=always --group-directories-first'  # long format
#alias lt='exa -aT --color=always --group-directories-first' # tree listing
#alias l.='exa -a | egrep "^\."'

# These are for mounting drives
alias mountsd="udisksctl mount -b /dev/mmcblk0p1"
alias unmountsd="udisksctl unmount -b /dev/mmcblk0p1"

# For fun
alias fishes='asciiquarium | lolcat'     
alias lc="lolcat"   
alias sl="sl | lolcat"
alias pomo="muccadoro | lolcat"  
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
alias cf="cd ~/.config && la"   
alias sc="cd ~/.local/bin/scripts && ls -a"   
alias h="cd ~/ && pwd" 
alias mn="cd /mnt && ls -a" 
alias cwars="cd ~/projects/codewars"
alias d="cd /home/mgalvan/nextcloud/files/0_Inbox_Files"
alias cqk="cd /home/mgalvan/projects/qmk_firmware/keyboards/planck/keymaps/mgalvanx"
alias mt="cd /mnt"
