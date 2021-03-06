set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
"

"----------------- THEMES----------------
"
Plugin 'sjl/badwolf'
Plugin 'jnurmine/Zenburn'
Plugin 'dracula/vim'
"
"----------------------------------------
"
" vim-gitgutter shows signs for line additions (+), modifications (~), or 
" removals (-) in the vim window gutter if the file you’re modifying is in a git repo.
Plugin 'airblade/vim-gitgutter'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'

" Easy quoting with the surround plugin
Plugin 'tpope/vim-surround'

"Fuzzy finder
Plugin 'ctrlpvim/ctrlp.vim'

Plugin 'itchyny/lightline.vim'

" gc and gcc to toggle commenting
Plugin 'tomtom/tcomment_vim'
"
" <l><l>w to jump around code
Plugin 'easymotion/vim-easymotion'

" Allow UNIX commands from within VIM
Plugin 'tpope/vim-eunuch'

Plugin 'rizzatti/dash.vim'

" Tags and file management
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'majutsushi/tagbar'

Plugin 'nvie/vim-flake8'
Plugin 'tmhedberg/SimpylFold'
Plugin 'Vimjas/vim-python-pep8-indent'

Plugin 'justinj/vim-pico8-syntax'

Plugin 'christoomey/vim-tmux-navigator'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
"
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
" Put your non-Plugin stuff after this line
"
" Make Vim more useful


" --- NERD Tree ---
let g:NERDTreeChDirMode = 2
let g:NERDTreeIgnore = ['\.vim$', '\~$', '\.pyc$', '^__pycache__$', '\.swp$', '\.git$', '\.egg', '\.egg\-info', '\.coverage', '\.tox', '.DS_Store', '.sass-cache']
let g:NERDTreeSortOrder = ['^__\.py$', '\/$', '*', '\.swp$', '\~$']
let g:NERDTreeShowBookmarks = 1
let g:NERDTreeShowHidden = 1

map <C-o> :NERDTreeToggle<CR>


" ---- ctags -----
nnoremap <leader>. :CtrlPTag<cr>
nnoremap <silent> <Leader>b :TagbarToggle<CR>

" --- ctrlp ---
let g:ctrlp_dont_split = 'NERD_tree_2'
set wildignore+=*.pyc,*/*.egg-info/*
set wildignore+=.git,.hg
set wildignore+=*.orig
set wildignore+=*.jpg,*.jpeg,*.gif,*.png
set wildignore+=*.mp3
set wildignore+=*.sw?

" --- Git Gutter ---
highlight clear SignColumn  " same as the row number column
highlight GitGutterAddDefault          guifg=Green  guibg=NONE  ctermfg=DarkGreen   ctermbg=NONE
highlight GitGutterChangeDefault       guifg=Yellow guibg=NONE  ctermfg=DarkYellow  ctermbg=NONE
highlight GitGutterDeleteDefault       guifg=Red    guibg=NONE  ctermfg=DarkRed     ctermbg=NONE

colorscheme dracula

" Use the OS clipboard by default (on versions compiled with `+clipboard`)
set clipboard=unnamed
" Enhance command-line completion
set wildmenu
" Allow cursor keys in insert mode
" set esckeys
" Allow backspace in insert mode
set backspace=indent,eol,start
" Optimize for fast terminal connections
set ttyfast
" Add the g flag to search/replace by default
set gdefault

" Use UTF-8 without BOM
set encoding=utf-8 nobomb

" Change mapleader
let mapleader=","

" Don’t add empty newlines at the end of files
set binary
set noeol

" Centralize backups, swapfiles and undo history
" set backupdir=~/.vim/backups
" if exists("&undodir")
" 	set undodir=~/.vim/undo
" endif

" Don’t create backups when editing files in certain directories
set backupskip=/tmp/*,/private/tmp/*

" Respect modeline in files
set modeline
set modelines=4
" Enable per-directory .vimrc files and disable unsafe commands in them
set exrc
set secure
" Enable line numbers
set number
" Enable syntax highlighting
syntax on
" Highlight current line
set cursorline
" Show “invisible” characters
set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
set list
" Highlight searches
set hlsearch
" Ignore case of searches
set ignorecase
" Highlight dynamically as pattern is typed
set incsearch
" Always show status line
set laststatus=2
" Enable mouse in all modes
set mouse=a
" Disable error bells
set noerrorbells
" Don’t reset cursor to start of line when moving around.
set nostartofline
" Show the cursor position
set ruler
" Don’t show the intro message when starting Vim
set shortmess=atI
" Show the current mode
set showmode
" Show the filename in the window titlebar
set title
" Show the (partial) command as it’s being typed
set showcmd
" " Use relative line numbers
" if exists("&relativenumber")
" 	set relativenumber
" 	au BufReadPost * set relativenumber
" endif
" Start scrolling three lines before the horizontal window border
set scrolloff=3

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

set splitbelow
set splitright

" PEP8
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

au BufNewFile,BufRead *.js,*.html,*.css,*.p8
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2

" Strip trailing whitespace (,ss)
function! StripWhitespace()
	let save_cursor = getpos(".")
	let old_query = getreg('/')
	:%s/\s\+$//e
	call setpos('.', save_cursor)
	call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace()<CR>
" Save a file as root (,W)
noremap <leader>W :w !sudo tee % > /dev/null<CR>

" Automatic commands
if has("autocmd")
	" Enable file type detection
	filetype on
	" Treat .json files as .js
	autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
	" Treat .md files as Markdown
	autocmd BufNewFile,BufRead *.md setlocal filetype=markdown
endif

"" Copy/paste to clipboard and back
vnoremap <C-c> :w !pbcopy<CR><CR>
noremap <C-v> :r !pbpaste<CR><CR>

"" CRtags + CtrlP
nnoremap <leader>. :CtrlPTag<cr>
