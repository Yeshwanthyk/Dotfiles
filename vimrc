filetype off
runtime! autoload/pathogen.vim
silent! call pathogen#helptags()
silent! call pathogen#runtime_append_all_bundles()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Sets how many lines of history VIM has to remember
set history=700

"" Enable filetype plugins
filetype plugin on
filetype indent on

"" Set to auto read when a file is changed from the outside
set autoread

"" With a map leader it's possible to do extra key combinations
"" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Ignore compiled files
set wildignore=*.o,*~,*.pyc
set number

""Always show current position
set ruler

"" Height of the command bar
set cmdheight=2

"" A buffer becomes hidden when it is abandoned
set hid

"" Ignore case when searching
set ignorecase

"" When searching try to be smart about cases
set smartcase

"" Highlight search results
set hlsearch

"" Makes search act like search in modern browsers
set incsearch

"" Don't redraw while executing macros (good performance config)
set lazyredraw

"" For regular expressions turn magic on
set magic

"" Show matching brackets when text indicator is over them
set showmatch
"" How many tenths of a second to blink when matching brackets
set mat=2

"" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" "Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable
syntax on

colorscheme MountainDew
set background=dark

"" Set utf8 as standard encoding and en_US as the standard
"  language
set encoding=utf8

"" Use Unix as the standard file type
set ffs=unix,dos,mac


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Use spaces instead of tabs
set expandtab

"" Be smart when using tabs ;)
set smarttab

"" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

"" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

" " Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> /
map <c-space> ?

" " Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove

map <leader>ct :TlistToggle
"""""""""""""""""""""""""""""""
" " => Status line
"""""""""""""""""""""""""""""""
"" Always show the status line
set laststatus=2
set nocompatible
"set statusline=%<%f\
set statusline+=%f\                    " file name
"set statusline+=%h%1*%m%r%w%0*         " flags
set statusline+=%-14.(%l,%c%V%)\ %<%P  " offset
"set statusline+=\ [%{&ff}/%Y]            " filetype
"set statusline+=\ [%{getcwd()}]          " current dir
"set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
set statusline+=%{fugitive#statusline()} "  Git Hotness
"set statusline+=%w%h%m%r " Options

"""""""""""""""""""""""""""""""
" " => Indentation
"""""""""""""""""""""""""""""""
nmap <D-[> <<
nmap <D-]> >>
vmap <D-[> <gv
vmap <D-]> >gv

autocmd BufWritePre *.py normal m`:%s/\s\+$//e``

"""""""""""""""""""""""""""
" " => Mini Buffer Explorer
"""""""""""""""""""""""""""
let g:miniBufExplModSelTarget = 1
let g:miniBufExplorerMoreThanOne = 0
let g:miniBufExplModSelTarget = 0
let g:miniBufExplUseSingleClick = 1
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplVSplit = 15
let g:miniBufExplSplitBelow=1

map <c-w><c-t> :WMToggle<cr>

""PyLint

"set makeprg=pylint\ --reports=n\ --output-format=parseable\ %:p
"set errorformat=%f:%l:\ %m

"Whitespaces
:highlight ExtraWhitespace ctermbg=red guibg=red
:match ExtraWhitespace /\s\+$/

"NerdTree Setting

let NERDTreeChDirMode=2
let NERDTreeIgnore=['\.vim$', '\~$', '\.pyc$', '\.swp$']
let NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$',  '\~$']
let NERDTreeShowBookmarks=1

map <F2> :NERDTreeToggle<CR>
map <F3> :TMiniBufExplorer<CR>
map <F4> :TlistToggle<CR>

nnoremap <Leader>g :GundoToggle<CR>
let g:gundo_width = 60
let g:gundo_preview_height = 40
let g:gundo_right = 1


let g:pydoc_highlight=0

set backspace=2 " make backspace work like most other apps
