call plug#begin()
	" Better Syntax Support
  " Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
	Plug 'sheerun/vim-polyglot'
	" File Explorer
	Plug 'scrooloose/NERDTree'
	" Auto pairs for '(' '[' '{'
	Plug 'jiangmiao/auto-pairs'
	" Use gcc to comment line
	Plug 'tpope/vim-commentary'
	" Allow us to rename and move and delete within the vim buffer 
	Plug 'tpope/vim-eunuch'
	" Use cs' to change ' to " or any surrounding pairs
	Plug 'tpope/vim-surround'
	" Set Dracula Theme
	Plug 'dracula/vim', { 'as': 'dracula' }
	" use space + f binding to center text
	Plug 'junegunn/goyo.vim'
	" Set a status bar that uses buffers
  Plug 'vim-airline/vim-airline'
	" Use ranger in vim
	Plug 'kevinhwang91/rnvimr', {'do': 'make sync'}
	" Relative Line Number Practice Game
  " Plug 'ThePrimeagen/vim-be-good'		
	" Gets you vim wiki... Will I be switching
  Plug 'vimwiki/vimwiki'
	" This md-img-paste only works for regular vim
	Plug 'ferrine/md-img-paste.vim'
	" Allows us to use fzf in vim
	Plug 'junegunn/fzf.vim'
call plug#end()
