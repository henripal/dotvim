filetype off

call pathogen#infect()
call pathogen#helptags()

filetype plugin indent on
syntax on
runtime macros/matchit.vim


" tab behavior pythonesque
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

let python_highlight_all=1
syntax on

" wrapping behavior
set wrap
set textwidth=79
set formatoptions=qrn1
" set colorcolumn=85

" some remappings: change lines regardless of wrapping
" change ; to ;
" change pasting behavior to paste between tmux panes
nnoremap j gj
nnoremap k gk
inoremap jk <Esc>

nnoremap ; :
noremap ty "+y 
noremap tp "+p
noremap tY "+Y 
noremap tP "+P 

set clipboard=unnamedplus


" better search and case behavior
set wildmenu
set wildmode:longest:full,full

set ignorecase
set smartcase
set gdefault
set incsearch

" change the behavior in netrw for easy navigation
autocmd filetype netrw noremap <buffer> <TAB> /
let g:netrw_liststyle=3


" folding: autofold, but open everything on
" Buffer open
set foldmethod=indent
set foldlevel=99
au BufRead * normal zR

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VISUAL STUFF
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline_powerline_fonts = 1
set laststatus=2
let g:airline_theme='solarized'

set background=dark
colorscheme industry 

highlight clear SignColumn
" highlight VertSplit    ctermbg=236
" highlight ColorColumn  ctermbg=237
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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" LATEX STUFF
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:vimtex_view_general_viewer
      \ = '/Applications/Skim.app/Contents/SharedSupport/displayline'
let g:vimtex_view_general_options = '-r @line @pdf @tex'

" This adds a callback hook that updates Skim after compilation
let g:vimtex_latexmk_callback_hooks = ['UpdateSkim']
function! UpdateSkim(status)
  if !a:status | return | endif

  let l:out = b:vimtex.out()
  let l:tex = expand('%:p')
  let l:cmd = [g:vimtex_view_general_viewer, '-r']
  if !empty(system('pgrep Skim'))
    call extend(l:cmd, ['-g'])
  endif
  if has('nvim')
    call jobstart(l:cmd + [line('.'), l:out, l:tex])
  elseif has('job')
    call job_start(l:cmd + [line('.'), l:out, l:tex])
  else
    call system(join(l:cmd + [line('.'), shellescape(l:out), shellescape(l:tex)], ' '))
  endif
endfunction
