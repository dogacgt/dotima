set nocompatible
let mapleader = ","

call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-commentary'
Plug 'morhetz/gruvbox'
Plug 'junegunn/goyo.vim'
Plug 'preservim/nerdtree'
call plug#end()

filetype plugin indent on
syntax on
colorscheme gruvbox
set bg=dark
set number relativenumber
set mouse-=a
set splitright splitbelow
set tabstop=5
set noswapfile
set incsearch

noremap <c-z> <nop>
nnoremap <leader>t :term<CR>
map <leader>b :sp ~/Documents/bio.bib<CR>
map <leader>g :Goyo<CR>
map <leader>o :!xdg-open %:r.pdf<CR>
map <leader>n :NERDTreeToggle<CR>
map <C-_> gcc

"compile *rmd, *tex and *c (and run a.out) with F7
autocmd Filetype rmd map <F7> :w \| :!echo<space>"require(rmarkdown);<space>render('<c-r>%')"<space>\|<space>R<space>--vanilla<CR>
autocmd Filetype tex map <F7> :w \| !pdflatex<space><c-r>%<CR>
autocmd Filetype c map <F7> :w<CR> \| :!gcc<space><c-r>%<CR> \| :!./a.out<CR>

autocmd BufWritePre * %s/\s\+$//e
autocmd BufWritePre *[tex|rmd] %s/\n\+\%$//e

"disable auto-commenting new line
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

"give execute permission to .py files when created
autocmd BufNewFile *.py w | !chmod +x <afile>

