" Plugins
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'yuttie/comfortable-motion.vim'
Plug 'morhetz/gruvbox'
Plug 'itchyny/lightline.vim'
Plug 'vimwiki/vimwiki'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'google/vim-searchindex'
Plug 'preservim/nerdcommenter'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'https://github.com/adelarsq/vim-matchit'
Plug 'nelsyeung/twig.vim'
Plug 'jiangmiao/auto-pairs'
call plug#end()

source $HOME/.config/nvim/plug-config/coc.vim
let g:coc_global_extensions = ['coc-phpls', 'coc-html']

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

" Line wrapping
set showbreak=>…
set linebreak
set textwidth=100

set number
set showcmd

set hidden

" Only if some kind of statusline plugin is set
set noshowmode

" Custom dir for swap files
set directory^=$HOME/.vim/tmp//

" Autocommands
autocmd BufRead bash-fc.* set syntax=sh
autocmd BufWritePre *.[ch] silent! %s/^\s\+$//

" --CUSTOM MAPINGS--
map Y y$

nnoremap j gj
nnoremap k gk

" Easier split movement. Check: https://thoughtbot.com/blog/vim-splits-move-faster-and-more-naturally
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Where the new split is located
set splitbelow
set splitright

" Maps Alt-[h,j,k,l] to resizing a window split
map <silent> <A-h> <C-w><
map <silent> <A-j> <C-W>-
map <silent> <A-k> <C-W>+
map <silent> <A-l> <C-w>>

" Inspired in https://github.com/tpope/vim-unimpaired
nnoremap ]q :cnext<ENTER>
nnoremap [q :cprev<ENTER>

set pastetoggle=<F4>

" Clipoard yank/pasting
noremap <Leader>y "+y
noremap <Leader>p "+p
noremap <Leader>P "+P
