
set nocompatible " change to compatible to get vi-compatiblity mode

" #######################   vi-compatible   ##############################
"set noflash " Get rid of the seizure inducing flash
set number " set line numbers on the bottom right
set ruler " set up line and column numbers on the bottom right
set showmode " show command and insert mode
set tabstop=2 " ake tab take up only 2 spaces instead of 4
set autowrite " save files automatically when all files are open
set autoindent " auto indent a new line(does not work with functions)

" #######################   vim   ##############################
syntax on
set smarttab "backspace delete the same number of spaces set to tabstop
set expandtab " replace tabs with spaces automatically
set shiftwidth=2  " when you use > or < for indent a line it will equal 2
set relativenumber " sets current line number as 0 for line jumping with numbers
set softtabstop=2  " used by language to autoindent text
set smartindent "works with autoindent for language specific syntax(indents whenever there is a function

"match ErrorMsg '\s\+$' "sets trailing spaces as errors

"if v:version >= 800
if v:version >= 800
  " stop vim from silently messing with files that it shouldn't
	set nofixendofline

  " better ascii friendly listchars
	set listchars=space:*,trail:*,nbsp:*,extends:>,precedes:<,tab:\|>

  " i hate automatic folding
	set foldmethod=manual
	set nofoldenable
endif

" highlight search hits(Ctl+L  disables highlights)
set hlsearch
set incsearch
set linebreak

" more risky, but cleaner
set nobackup
set noswapfile
set nowritebackup

set icon

"Better ex command autocomplete
set wildmenu

set viminfo="" "Prevents vim from creating a viminfo directory in home

"set clipboard=unnamedplus

let g:netrw_banner = 0
" ####################### Remaps ##############################
noremap <C-n> <C-d>
noremap <C-p> <C-u>
nnoremap <C-L> :nohl<CR><C-L> 
map Y y$

" ####################### Functions ##############################
fu! Greet()
  echo "Hello World"
endf

command! Greet call Greet()

" This gives us the highlight attribute of the word or character the current cursor is on(This depends on the filetype syntax)
if has("syntax")
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
endif

" ####################### Autocommands ##############################

" au vimleavepre *.md !emoji %

" start at the last place you were editing
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal!      g'\"" | endif

" #######################   Functions Keys   ##############################
map <F1> :set number!<CR> :set relativenumber!<CR>
nmap <F2> :call <SID>SynStack()<CR>
set pastetoggle=<F3>
map <F4> :set list!<CR>
map <F5> :set cursorline!<CR>
map <F7> :set spell!<CR>
