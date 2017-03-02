filetype off

call pathogen#infect()
call pathogen#helptags()

filetype plugin indent on
syntax on
set background=dark
colorscheme solarized
runtime macros/matchit.vim
let g:airline_powerline_fonts = 1

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

set wrap
set textwidth=79
set formatoptions=qrn1
set colorcolumn=85

nnoremap j gj
nnoremap k gk

nnoremap ; :

set wildmenu
set wildmode:longest:full,full

set ignorecase
set smartcase
set gdefault
set incsearch

autocmd filetype netrw noremap <buffer> <TAB> /
let g:netrw_liststyle=3
