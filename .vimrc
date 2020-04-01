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
Plugin 'tomtom/tcomment_vim'
" Comments code
Plugin 'L9'
" You complete me plugin
Plugin 'valloric/youcompleteme'
" "Fuzzy find
" Plugin 'ctrlpvim/ctrlp.vim'
"Solarize color plugin
Plugin 'altercation/vim-colors-solarized'
"Edit surronding text i.e. ()
Plugin 'tpope/vim-surround'
" " colorschmes
Plugin 'alnjxn/base16-oceanicnext'
" Bubble text + other goodies
Plugin 'tpope/vim-unimpaired'
" " Plugin for visual search
Plugin 'nelstrom/vim-visual-star-search'
" " Plugin for auto pep8 + format based on config in repo
Plugin 'editorconfig/editorconfig-vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'powerline/fonts'
Plugin 'scrooloose/syntastic'
Plugin 'taketwo/vim-ros'
Plugin 'tpope/vim-dispatch'
Plugin 'Chiel92/vim-autoformat'

Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " basic engine
Plugin 'junegunn/fzf.vim' " vim-plugin for engine
Plugin 'pbogut/fzf-mru.vim' " keeps MRU list and feeds it to fzf
Plugin 'bpierce1/fzf-index.vim' " indexing to avoid doing `find .` on dir every time

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
"
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim default settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set number
syntax enable

"Use system clipboard
set clipboard=unnamed
set clipboard=unnamedplus

"Vim Defaults
set autoindent        " always set autoindenting on
set showmatch        " Show matching brackets.
set ignorecase    " Do case insensitive matching
set hlsearch
set incsearch " search as characters are entered
set lazyredraw " redraw only when we need to.
set smartcase " Use smartcase sensitive search (ignores case unless capitalization is used)
set cursorline
" move vertically by visual line
nnoremap j gj
nnoremap k gk
filetype indent on
set tabstop=4
set shiftwidth=4
set expandtab

" Move to the next buffer
nmap <leader>l :bnext<CR>

" Move to the previous buffer
nmap <leader>h :bprevious<CR>

" Jump between verticle splits
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Solarized
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set background=dark
let g:solarized_termcolors=256
set t_Co=16
colorscheme solarized
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim airline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Dont forget to add powerline fonts https://github.com/powerline/fonts
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_theme='jellybeans'
let g:airline_powerline_fonts = 1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FZF
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:fzf_index_cache_dir = $HOME.'/.cache/fzf_index'
let g:fzf_index_clear_cache_on_exit = 0
let g:fzf_index_user_command = 'rg -L --no-ignore-vcs --ignore-file ~/.rgignore --files'

" regular fzf.vim config
" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Default fzf layout
" - down / up / left / right
let g:fzf_layout = { 'down': '~30%' }

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }


" In Neovim, you can set up fzf window using a Vim command
let g:fzf_history_dir = '~/.local/share/fzf-history'

" make :FZFCommit look nicer
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

" TODO - make sure tags generation works with deoplete
let g:fzf_tags_command = 'ctags -R'

" Similarly, we can apply it to fzf#vim#grep. To use ripgrep instead of ag:
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)


" fzf list buffers
nnoremap <C-b> :Buffers<CR>

" fzf list MRU files
nnoremap <C-g> :FZFMru<CR>

" initiate grep
nnoremap <C-f> :Rg 
 
" grep selection
vnoremap <C-f> y:Rg <C-R>"<CR>

" grep under cursor
nnoremap K y:Rg "\b<C-R><C-W>\b<CR>"

" change to FZF if FZF-Index disappears
nnoremap <C-p> :FZFIndex<CR>
let mapleader=" "
nnoremap <leader>p :FZFIndexReindex<CR>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"YouCompleteMe Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/youcompleteme/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_always_populate_location_list = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_semantic_triggers = {
             \ 'c' : ['->', '.'],
             \ 'cpp' : ['->', '.'],
             \ }
" You Complete Me improvements found on
" http://vim.wikia.com/wiki/Make_Vim_completion_popup_menu_work_just_like_in_an_IDE
set completeopt=longest,menuone
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
  \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
  \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Syntastic Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_pylint_post_args="--max-line-length=100"
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++'
let g:syntastic_cpp_clang_check_post_args = ""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Clang Format 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:clang_format_path = '/usr/local/bin/clang-format'
let g:formatters_python = ['yapf']
map <C-K> :Autoformat<cr> 
imap <C-K> <c-o>:Autoformat<cr> 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Vim ROS 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ros_build_system='catkin-tools'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
