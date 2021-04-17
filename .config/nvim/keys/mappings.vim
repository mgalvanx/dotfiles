" " Better nav for omnicomplete
" inoremap <expr> <c-j> ("\<C-n>")
inoremap <expr> <c-k> ("\<C-p>")

" Use alt + hjkl to resize windows
" nnoremap <M-j>    :resize -2<CR>
" nnoremap <M-k>    :resize +2<CR>
" nnoremap <M-h>    :vertical resize -2<CR>
" nnoremap <M-l>    :vertical resize +2<CR>

" I hate escape more than anything else
inoremap jk <Esc>
inoremap kj <Esc>

" Easy CAPS
inoremap <c-u> <ESC>viwUi
nnoremap <c-u> viwU<Esc>

" TAB in general mode will move to text buffer
nnoremap <TAB> :bnext<CR>
" SHIFT-TAB will go back
nnoremap <S-TAB> :bprevious<CR>

" Alternate way to save
nnoremap <C-s> :w<CR>
" Alternate way to quit
nnoremap <C-Q> :wq!<CR>
" <TAB>: completion.
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

" Better tabbing
vnoremap < <gv
vnoremap > >gv

" Change : to ; to access the vim terminal faster
nnoremap ; :
nnoremap : ;
vnoremap ; ;
vnoremap : ;

"Paste the last thing you yanked and not deleted with ,p/,P
nmap ,p "0p
nmap ,P "0P

" Better window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <Leader>o o<Esc>^Da
nnoremap <Leader>O O<Esc>^Da

" Use space + F to activate goyo
map <leader>f :Goyo \| set bg=dark \| set linebreak<CR>

" Nerd Tree Toggle
noremap <leader>n :NERDTreeToggle<CR>
let NERDTreeChDirMode = 2
let NERDTreeShowHidden = 1

" Typing MakeTags creates a tags file used for finding definition. (may need to install ctags first)
command! MakeTags !ctags -R .
" - Use ^] to jump to tag under cursor
" - Use g^] for ambiguous tags
" - Use ^t to jump back up the tag stack


" Enable F5 to autocheck python code
nnoremap <F5> :sp <CR> :term python % <CR>
nnoremap <F6> :bd!<CR>
