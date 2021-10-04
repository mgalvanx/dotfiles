" General Remaps 
  
" Sets leader p to copy an image from the clipboard and paste it with a reference in our _resources folder.
" nmap <buffer><silent> <leader>p :call mdip#MarkdownClipboardImage()<CR>
noremap <leader>p :call mdip#MarkdownClipboardImage()<CR>
" there are some defaults for image directory and image name, you can change them
let g:mdip_imgdir_absolute= '/home/mgalvan/nextcloud/notes/_resources'
let g:mdip_imgdir_intext= '../../_resources'
" let g:mdip_imgname = 'image.png'
"
"Use '' as a second leader key to jump around files with FZF 
"Source https://www.youtube.com/watch?v=QeJkAs_PEQQ&t=306s 

" . = location of current file
nnoremap '.  :exe ":FZF " . expand("%:h")<CR>
" / = /
nnoremap '/  :e /<C-d>
" b = buffers
nnoremap 'b  :Buffers<cr>
" d = documents
nnoremap 'd  :FZF ~/Documents/<cr>
" f = fzf
nnoremap 'f  :FZF<cr>
" g = grep (ripgrep)
nnoremap 'g  :Rg 
" h = home
nnoremap 'h  :FZF ~/<cr>
" n = notes
nnoremap 'n  :FZF ~/nextcloud/notes/<cr>
" t = tags
nnoremap 't  :Tags<cr>
" r = bashrc
nnoremap 'r  :e ~/.bashrc<cr>
" v = vimrc
nnoremap 'v  :e $MYVIMRC<cr>
" toggle last buffer
nnoremap ''  :b#<cr>

" Change : to ; to access the vim terminal faster
" nnoremap ; :
" nnoremap : ;
" vnoremap ; ;
" vnoremap : ;

" Change Y to y$(Y does the same as yy so let make Y useful and make it act
" like D and C)
nnoremap Y y$

""Paste the last thing you yanked and not deleted with ,p/,P
nmap ,p "0p
nmap ,P "0P

" Center the n and N commands(Your cursor stays in the same place)
nnoremap n nzzzv
nnoremap N Nzzzv

" Keep cursor in place when you join lines
nnoremap J mzJ'z

" Create undo breakpoint everytime we do punctuation 
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap * *<c-g>u
inoremap ? ?<c-g>u

" Fixing history when relative line jumping/ makes it work like it should
nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'
nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'

" Move lines in visual mode
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" TAB in general mode will move to text buffer
nnoremap <TAB> :bnext<CR>
" SHIFT-TAB will go back
nnoremap <S-TAB> :bprevious<CR>

" " Better nav for omnicomplete
" inoremap <expr> <c-j> ("\<C-n>")
inoremap <expr> <c-k> ("\<C-p>")

" Use alt + hjkl to resize windows
" nnoremap <M-j>    :resize -2<CR>
" nnoremap <M-k>    :resize +2<CR>
" nnoremap <M-h>    :vertical resize -2<CR>
" nnoremap <M-l>    :vertical resize +2<CR>

" I hate escape more than anything else (Use jk to escape )
" inoremap jk <Esc>
" inoremap kj <Esc>

" Easy CAPS
" inoremap <c-u> <ESC>viwUi
" nnoremap <c-u> viwU<Esc>


" Alternate way to save
" nnoremap <C-s> :w<CR>
" Alternate way to quit
" nnoremap <C-Q> :wq!<CR>
" <TAB>: completion.
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

" Better tabbing
vnoremap < <gv
vnoremap > >gv


" Better window navigation
" nnoremap <C-h> <C-w>h
" nnoremap <C-j> <C-w>j
" nnoremap <C-k> <C-w>k
" nnoremap <C-l> <C-w>l

nnoremap <Leader>o o<Esc>^Da
nnoremap <Leader>O O<Esc>^Da

" Use space + F to activate goyo
" map <leader>f :Goyo \| set bg=dark \| set linebreak<CR>

" Use Control G to activate Goyo
" map <C-g> :Goyo \| set bg=dark \| set linebreak<CR>
noremap <leader>f :Goyo<CR>

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
