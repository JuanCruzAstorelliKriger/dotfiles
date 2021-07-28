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
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'https://github.com/adelarsq/vim-matchit'
Plug 'nelsyeung/twig.vim'
Plug 'tpope/vim-eunuch'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'dense-analysis/ale'
Plug 'wellle/targets.vim'
Plug 'tpope/vim-ragtag'
Plug 'othree/yajs.vim'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'posva/vim-vue'
Plug 'ap/vim-css-color'
Plug 'tomtom/tcomment_vim'
Plug 'cakebaker/scss-syntax.vim'
call plug#end()

let mapleader = " "

source $HOME/.config/nvim/plug-config/coc.vim
let g:coc_global_extensions = ['coc-phpls', 'coc-html', 'coc-tsserver', 'coc-vetur', 'coc-pairs']
" Para coc-pairs
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

source $HOME/.config/nvim/plug-config/fzf.vim

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
autocmd BufRead *.yml,*.yaml set softtabstop=2 shiftwidth=2

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Line wrapping
" Common part
set showbreak=>…
set linebreak

" Soft-wrapping (Only visual. Preferable since it lets you change the width
" for the wrapping at will. Doing it with 'textwidth' doesn't work that well
" beacuse it inserts the \n in the textfile)
" I don't use it because 'columns' doesn't preserve the background beyond the
" given limit.
"
"" (already set by default) set wrap
"set linebreak
"set columns=100

" Hard-wrapping
" autocmd BufRead *.txt,*.wiki,*.md set textwidth=100
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set number
set showcmd

set hidden

" Only if some kind of statusline plugin is set
set noshowmode

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" BACKUP STUFF
silent ! mkdir -p $HOME/.config/nvim/backups/swap
set directory=$HOME/.config/nvim/backups/swap//

" Guarda una copia del estado del archivo antes del último :write
set backup
" Archivo backup auxiliar por si hay algún problema durante el proceso de
" escritura en el archivo original
set writebackup

" From: https://superuser.com/questions/1135293/possible-to-make-a-backup-of-original-file-in-vim
" Ya que 'path//' no funciona con backupdir
"
" Acompañado de cron/anacron: find $HOME/.config/nvim/backups/backup/ -type f -ctime 1 -execdir rm '{}' \;
function! BackupDir()
  let l:backupdir=$HOME.'/.config/nvim/backups/backup'.expand('%:p:h')

   if !isdirectory(l:backupdir)
      call mkdir(l:backupdir, 'p', 0700)
   endif

   let &backupdir=l:backupdir
   let &backupext=strftime('~%Y-%m-%d_%H-%M-%S~')
endfunction
autocmd! bufwritepre * call BackupDir()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" ALE conf
let g:ale_php_phpcs_executable=$HOME.'/.config/composer/vendor/bin/phpcs'
let g:ale_php_php_cs_fixer_executable=$HOME.'/.config/composer/vendor/bin/php-cs-fixer'
let g:ale_fixers = {
\   'php': ['php_cs_fixer'],
\   'javascript': ['eslint'],
\   'typescript': ['eslint'],
\   'vue': ['eslint'],
\}
let g:ale_fix_on_save = 1

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

" From a guy in this post: https://www.reddit.com/r/vim/comments/gymvjg/htmlvue_recommended_plugins/
inoremap <C-s> <esc>yiwi<lt><esc>ea></><esc>hpF>i

noremap <Leader>s :call search('<script')<cr>:normal zz<cr>
