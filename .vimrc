"Set leader  button as space for shortcuts
let mapleader = " "


call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'junegunn/goyo.vim'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'itchyny/lightline.vim'
call plug#end()
"This let command fixes the gray background issue in the dracula colorscheme
let g:dracula_colorterm = 0
colorscheme dracula
"This is needed to get lightline to use dracula
let g:lightline = {
  \ 'colorscheme': 'dracula'
\}


set laststatus=2             "This is need to get the lightline status bar too work


" Goyo plugin makes text more readable when writing prose im using leader + f
map <leader>f :Goyo \| set bg=light \| set linebreak<CR>

" turn off  search highlight
" nnoremap <leader> :nohlsearch<CR>



" enable syntax highlighting
syntax on
" keeps the cursor towards the middle of the screen when scrolling
set scrolloff=8 
"Show all whitespace,tabs and blank lines
set list listchars=tab:▷⋅,trail:⋅,nbsp:⋅
set statusline=%F%m%r%h%w\ [TYPE=%Y\ %{&ff}]\
  \ [%l/%L\ (%p%%)

" general tab options
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
" show line numbers
set number relativenumber  
" highlight as you search and highlight all matches
set incsearch
set hlsearch
" enable auto complete
set wildmode=longest,list,full
" Show key inputs in bottom right corner
set showcmd
" Copy and Pasting Hacks
"set colorcolumn=80
"set signcolumn=yes
" Stops the creation of vim swapfile/ backups
set noswapfile
set nobackup

" Enable system clipboard to +
set clipboard=unnamedplus
" remap copy and paste to control C and Control 
vnoremap <C-c> "+y
map<C-v> "+P
" This command copies to both the clipboard and primary selection in Linux
vnoremap <C-c> "*y :let @+=@*<CR>

" Coding Options

" enable all Python syntax highlighting features
let python_highlight_all = 1
" show the matching part of the pair for [] {} and ()
set showmatch
