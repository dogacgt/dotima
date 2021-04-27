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
set splitright splitbelow
set mouse-=a
set laststatus=2
set tabstop=4 shiftwidth=4
set noswapfile
set incsearch
set autoread

map <c-z> <nop>
map <C-_> gcc
map <C-w> <C-w>w
tmap <C-w> <C-w>w
nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <leader>g :Goyo<CR>
nnoremap <leader>t :term<CR>
nnoremap <leader>b :sp ~/Documents/bio.bib<CR>
nnoremap <leader>o :!xdg-open %:r.pdf >/dev/null 2>&1<CR>
nnoremap <leader>= :normal gg=G<CR>

"compile with F7
autocmd BufNewFile,Filetype rmd map <F7> :w \| :!echo<space>"require(rmarkdown);<space>render('<c-r>%')"<space>\|<space>R<space>--vanilla<CR>
autocmd BufNewFile,Filetype tex map <F7> :w \| !pdflatex<space><c-r>%<CR>
autocmd BufNewFile,Filetype c map <F7> :w \| :!gcc<space><c-r>%<CR>
autocmd BufNewFile,Filetype cc,cpp map <F7> :w \| :!c++<space><c-r>%<CR>

"whitespace handling
autocmd BufWritePre * %s/\s\+$//e
autocmd BufWritePre *[tex|rmd] %s/\n\+\%$//e

"disable auto-commenting new line
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

"give execute permission in creation
autocmd BufNewFile *.py w | :silent !chmod +x <afile>
autocmd BufNewFile *.sh w | :silent !chmod +x <afile>

"texclear
autocmd VimLeave *.tex !texclear %
