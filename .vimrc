set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'
" You complete me plugin
Plugin 'valloric/youcompleteme'
"Fuzzy find
Plugin 'ctrlpvim/ctrlp.vim'
"Solarize color plugin
Plugin 'altercation/vim-colors-solarized'




" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"

"Solarized & Styling Settings
set number
syntax enable
set background=dark
let g:solarized_termcolors=256
colorscheme solarized

"CtrlP Settings
let g:ctrlp_max_files=0
let g:ctrlp_clear_cache_on_exit=0
" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
" RUN THIS sudo apt-get install vim-gtk


"YouCompleteMe Settings
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/youcompleteme/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/youcompleteme/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_always_populate_location_list = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_semantic_triggers = {
             \ 'c' : ['->', '.'],
             \ 'cpp' : ['->', '.'],
             \ }



"Use system clipboard
:set clipboard=unnamed
:set clipboard=unnamedplus

"Vim Defaults
set autoindent        " always set autoindenting on
set showmatch        " Show matching brackets.
set ignorecase    " Do case insensitive matching

" indentation
filetype indent on
set tabstop=4
set shiftwidth=4
set expandtab





" Brief help
"
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

