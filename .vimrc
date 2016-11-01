" .vimrc File
" Created by: Niki Wells, who has no idea what she's doing
" good luck
 
"i took most of this from the internet
 
" Set line numbers bc that shit is where it's at
set nu
 
" Enable filetypes
filetype on
filetype plugin on
" filetype indent on
syntax on

" Pathogen, I guess
execute pathogen#infect()

" Display cursor in bottom right corner
set ruler
 
" Tab stuff
set tabstop=3
set shiftwidth=3
set softtabstop=3
set expandtab
 
" Indent stuff
set smartindent
set autoindent
 
" Highlight searching
set hlsearch
 
" Enable code folding
set foldenable

" soft wrapping
set wrap
set linebreak
set nolist
 
" Colors heck ye
colorscheme spacegray
"

" Backspace for tmux
set backspace=indent,eol,start

" Syntastic config
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" LaTeX stuff
let g:tex_flavor = 'latex'
augroup HardLineWrapsLaTex
    autocmd!
    autocmd FileType tex setlocal textwidth=80 spell spelllang=en_us
augroup END

" OCaml
let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
execute "set rtp+=" . g:opamshare . "/merlin/vim"
set rtp^="/Users/niki/.opam/4.03.0/share/ocp-indent/vim"
