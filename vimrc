filetype off

call pathogen#infect()
call pathogen#helptags()

filetype plugin indent on
syntax on
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
noremap ty "+y 
noremap tp "+p
noremap tY "+Y 
noremap tP "+P 

set wildmenu
set wildmode:longest:full,full

set ignorecase
set smartcase
set gdefault
set incsearch

autocmd filetype netrw noremap <buffer> <TAB> /
let g:netrw_liststyle=3

let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"

set foldmethod=indent
au BufRead * normal zR

set background=dark
colorscheme base16-railscasts

highlight clear SignColumn
highlight VertSplit    ctermbg=236
highlight ColorColumn  ctermbg=237
highlight LineNr       ctermbg=236 ctermfg=240
highlight CursorLineNr ctermbg=236 ctermfg=240
highlight CursorLine   ctermbg=236
highlight StatusLineNC ctermbg=238 ctermfg=0
highlight StatusLine   ctermbg=240 ctermfg=12
highlight IncSearch    ctermbg=3   ctermfg=1
highlight Search       ctermbg=1   ctermfg=3
highlight Visual       ctermbg=3   ctermfg=0
highlight Pmenu        ctermbg=240 ctermfg=12
highlight PmenuSel     ctermbg=3   ctermfg=1
highlight SpellBad     ctermbg=0   ctermfg=1
