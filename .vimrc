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
"Edit surronding text i.e. ()
Plugin 'tpope/vim-surround'
" colorschmes
Plugin 'alnjxn/base16-oceanicnext'
" Bubble text + other goodies
Plugin 'tpope/vim-unimpaired'

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
set t_Co=16
colorscheme solarized
"colorscheme base16-oceanicnext

"CtrlP Settings
let g:ctrlp_max_files=0
let g:ctrlp_clear_cache_on_exit=0
let g:ctrlp_user_command = ['.git/', 'git ls-files --cached --others  --exclude-standard %s','ag %s -l --nocolor -g ""']
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
let g:ctrlp_working_path_mode = 'ra'
set wildignore+=
" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
"Don't forget to install silver searcher
"Silver Searcher
if executable('ag')
      " Use ag over grep
         set grepprg=ag\ --nogroup\ --nocolor
      
           " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
       " ag is fast enough that CtrlP doesn't need to cache (act no i am not seeing it is)
       "let g:ctrlp_use_caching = 0
endif" The Silver Searcher

"YouCompleteMe Settings
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/youcompleteme/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_always_populate_location_list = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_semantic_triggers = {
             \ 'c' : ['->', '.'],
             \ 'cpp' : ['->', '.'],
             \ }



"Use system clipboard
" RUN THIS sudo apt-get install vim-gtk
set clipboard=unnamed
set clipboard=unnamedplus

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
