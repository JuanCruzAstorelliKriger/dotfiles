" Plugins
call plug#begin('~/.vim/plugged')
Plug 'yuttie/comfortable-motion.vim'
Plug 'morhetz/gruvbox'
Plug 'itchyny/lightline.vim'
Plug 'vimwiki/vimwiki'
call plug#end()

let mapleader = " "

set nocompatible
filetype plugin on

" Color conf
set termguicolors
let g:gruvbox_italic=1
let g:gruvbox_contrast_dark='hard'
colorscheme gruvbox
set background=dark

" Tabs and indentation
set expandtab
set softtabstop=4
set shiftwidth=4
set smartindent

set number
set showcmd

set hidden

" Only if some kind of line plugin is set
set noshowmode

" Custom mappings
map Y y$
