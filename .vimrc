syntax on

set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set mouse=a
set number
set incsearch
set noshowmode
" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'arcticicestudio/nord-vim'
call plug#end()

colorscheme nord

" Vim-Airline settings
let g:airline_powerline_fonts = 1
let g:airline_theme = 'nord'
