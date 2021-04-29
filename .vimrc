let mapleader = ","

call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-commentary'
Plug 'morhetz/gruvbox'
Plug 'junegunn/goyo.vim'
Plug 'preservim/nerdtree'
Plug 'vim-utils/vim-man'
call plug#end()

filetype plugin indent on
syntax on
colorscheme gruvbox
set bg=dark
set number relativenumber
set splitright splitbelow
set mouse-=a
set laststatus=2
set tabstop=4 shiftwidth=4
set noswapfile
set incsearch
set autoread

map <C-z> <nop>
map <C-_> gcc
map <C-s> :w<CR>
tmap <C-n> <C-w><S-n>
nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <leader>g :Goyo<CR>
nnoremap <leader>t :term<CR>
nnoremap <leader>vt :vert term<CR>
nnoremap <leader>b :sp ~/Documents/bio.bib<CR>
nnoremap <leader>o :!xdg-open %:r.pdf >/dev/null 2>&1<CR>
nnoremap <leader>= :normal gg=G<CR>

"navigation mappings
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
tmap <C-h> <C-w>h
tmap <C-j> <C-w>j
tmap <C-k> <C-w>k
tmap <C-l> <C-w>l

"compile with F7
autocmd Filetype rmd map <F7> :w \| :!echo<space>"require(rmarkdown);<space>render('<c-r>%')"<space>\|<space>R<space>--vanilla<CR>
autocmd Filetype tex map <F7> :w \| !pdflatex<space><c-r>%<CR>
autocmd Filetype c map <F7> :w \| :!gcc<space><c-r>%<CR>
autocmd Filetype cc,cpp map <F7> :w \| :!c++<space><c-r>%<CR>

"whitespace handling
autocmd BufWritePre * %s/\s\+$//e
autocmd BufWritePre *[tex|rmd] %s/\n\+\%$//e

"disable auto-commenting new line
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

"give execute permission in creation
autocmd BufNewFile *.py,*.sh w | :silent !chmod +x <afile>

"texclear
autocmd VimLeave *.tex !texclear %
