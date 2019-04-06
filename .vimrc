
" General config {{{
set nocompatible              " be iMproved, required

set history=500               " store more command line history
set hidden                    " hide buffer when it is abandoned

let mapleader = ","           " change <leader> key from / to ,

set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8

" }}}

" Vundle {{{


filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.

" plugin on GitHub repo
Plugin 'sjl/tslime.vim'
Plugin 'luochen1990/rainbow'
Plugin 'joshdick/onedark.vim'
Plugin 'easymotion/vim-easymotion'
Plugin 'elzr/vim-json'

" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'paredit.vim'
Plugin 'repeat.vim'
Plugin 'surround.vim'
Plugin 'commentary.vim'
Plugin 'unite.vim'
Plugin 'VimIM'

" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'

" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'

" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" }}} Put your non-Plugin stuff after this line

" Custom Mapping {{{


" jk is escape in insert mode
inoremap jk <esc>

" make j and k move to the next displayed line,
" instead of the physical line in normal mode.
nnoremap j gj
nnoremap k gk

"edit my vimrc
nnoremap <leader>ve :e $MYVIMRC<cr>

"source my vimrc
nnoremap <leader>vs :source $MYVIMRC<cr>

" toggle absolute and hybrid number
nnoremap <leader>r :set relativenumber!<CR>

"toggle rainbow parentheses
"nnoremap <leader>( :RainbowParenthesesToggle<CR>
nnoremap <leader>( :RainbowToggle<CR>

" turn off search hightlight
nnoremap <leader><space> :nohlsearch<CR>

"copy to/paste from system clipboard, make sure xclip is installed
nnoremap <leader>sc :call system("xclip -i -selection clipboard", getreg("\""))<CR>
nnoremap <leader>sp :call setreg("\"", system("xclip -o -selection clipboard"))<CR>p

" saves the file (handling the permission-denied error)
cnoremap w!! w !sudo tee > /dev/null %<CR>

" plugin unite.vim
let g:unite_source_history_yank_enable = 1
call unite#filters#matcher_default#use(['matcher_fuzzy'])
nnoremap <silent><leader>uf :Unite -no-split buffer file file_mru directory_mru file_rec<CR>
nnoremap <silent><leader>uy :Unite -no-split history/yank<CR>
nnoremap <silent><leader>ul :Unite -no-split line -auto-highlight -start-insert<CR>

" }}}

" tslime {{{
" setting for Plugin tslime
let g:tslime_ensure_trailing_newlines = 1
" }}}

" paredit {{{
" setting for Plugin paredit
" use paredit in .json file
au FileType json call PareditInitBuffer()
" let g:paredit_mode = 0
" }}}
   
"rainbow {{{
" setting for Plugin rainbow
let g:rainbow_active = 0 "0 if you want to enable it later via :RainbowToggle

" }}}

"Color {{{

set  termguicolors
let &t_8f = "\<Esc>[38:2:%lu:%lu:%lum"
let &t_8b = "\<Esc>[48:2:%lu:%lu:%lum"

"set t_Co=256

syntax on
"colorscheme onedark           
colorscheme desert           

syntax enable                 " enable syntax processing
" }}}

"Spaces and Tabs {{{

"for editing files in languages that prefer spaces over tabs
set tabstop=4                 "number of visual spaces per TAB
set softtabstop=4             "number of spaces in tab when editing
set expandtab                 "tabs are spaces
" }}}

"UI Config {{{

"show relativenumber, make it easier to browse vertically
set number                           "show line number in vim
set relativenumber                   "show relative line number

set cursorline                "highlight current line
set wildmenu                  " visual autocomplete for command menu
set lazyredraw                " redraw only when needed
set showmatch                 " hightlight matching [{()}]
set showcmd                   " show command on status line

" }}}

"Searching {{{

" the following 2 lines together make vim deal with
" case-sensitive search intelligently.
set ignorecase
set smartcase

set incsearch                 " search as characters are entered
set hlsearch                  " hightlight matches

" }}}

"Folding {{{

set foldenable                " enable folding
set foldlevelstart=10         " open most folds by default
set foldnestmax=10            " 10 nested fold max
set shiftwidth=2

" round indent to multiple of 'shiftwidth'
set shiftround

"space open/close folds
nnoremap <space> za

set foldmethod=indent         " fold based on indent level

" }}}

set fileencodings=utf-8,gbk,ucs-bom,cp936
set modelines=1
" vim:foldmethod=marker:foldlevel=0
