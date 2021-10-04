#
# ~/.bashrc
#
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#This is to source our aliases
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

#FZF Keybindings
bind '"\C-f": "cd_with_fzf\n"'
bind '"\C-o": "open_with_fzf\n"'
bind '"\C-v": "nvim\n"'
#Programs to Run on Startup
# colorscript random
# python ~/python/scripts/bible_verse_json_gen.py

#2  a This sets the prompt for terminal
export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "


# Disable ctrl-s and ctrl-1 (These commands pause and enable the terminal. We are going to disable it.
stty -ixon
# Allows us to cd into directorys without typing cd.
shopt -s autocd 

### "vim" as manpager
#export MANPAGER='/bin/bash -c "vim -MRn -c \"set buftype=nofile showtabline=0 ft=man ts=8 nomod nolist norelativenumber nonu noma\" -c \"normal L\" -c \"nmap q :qa<CR>\"</dev/tty <(col -b)"'

### "nvim" as manpager
export MANPAGER="nvim -c 'set ft=man' -"

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
