call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'soft-aesthetic/soft-era-vim'
Plug 'ctrlpvim/ctrlp.vim' " fuzzy find files
Plug 'scrooloose/nerdcommenter'
Plug 'mattn/emmet-vim'
Plug 'ap/vim-css-color'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'dracula/vim'
Plug 'airblade/vim-gitgutter'
Plug 'christoomey/vim-tmux-navigator'
call plug#end()

" j/k will move virtual lines (lines that wrap)
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

syntax enable
colorscheme dracula

set smarttab
set cindent
set nocursorline " don't highlight current line
set autoread " reload files when changed on disk, i.e. via `git checkout`
set backspace=2 " Fix broken backspace in some setups
set backupcopy=yes " see :help crontab
set clipboard=unnamed " yank and paste with the system clipboard
set directory-=. " don't store swapfiles in the current directory
set encoding=utf-8
set ignorecase                                               " case-insensitive search
set incsearch                                                " search as you type
set laststatus=2 " always show statusline
set list " show trailing whitespace
set listchars=tab:▸\ ,trail:▫
set number " show line numbers
set ruler " show where you are
set scrolloff=3 " show context above/below cursorline
set showcmd
set smartcase " case-sensitive search if any caps
set wildignore=log/**,node_modules/**,target/**,tmp/**,*.rbc
set wildmenu " show a navigable menu for tab completion
set wildmode=longest,list,full

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

" Don’t add empty newlines at the end of files
set binary
set noeol

" Quick save files
map <Esc><Esc> :w<CR>

" keyboard shortcuts
let mapleader = ','
nmap <leader>d :NERDTreeToggle<CR>
nmap <leader>f :NERDTreeFind<CR>
nmap <leader>z :CtrlP<CR>

nmap <leader><space> :call <SID>StripTrailingWhitespaces()<CR>
autocmd BufWritePre *.py,*.js :call <SID>StripTrailingWhitespaces()

" thanks to http://vimcasts.org/e/4
function! <SID>StripTrailingWhitespaces()
    " preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction

inoremap jk <ESC>
nmap <C-n> :NERDTreeToggle<CR>
vmap ++ <plug>NERDCommenterToggle
nmap ++ <plug>NERDCommenterToggle

""""""""""""""" NERDTree"""""""""""""""
let g:NERDTreeGitStatusWithFlags = 1
let g:NERDTreeIgnore = ['^node_modules$']

""""""""""""""" GitGutter """""""""""""
"let g:gitgutter_enabled = 0
"nmap <leader>g :GitGutterToggle<CR>
set updatetime=100
""""""""""""""" ctrp """""""""""""
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let g:ctrlp_match_window = 'order:ttb,max:20'
"emmet
let g:user_emmet_leader_key=','

" --- Git Gutter ---
highlight clear SignColumn  " same as the row number column
highlight GitGutterAddDefault          guifg=Green  guibg=NONE  ctermfg=DarkGreen   ctermbg=NONE
highlight GitGutterChangeDefault       guifg=Yellow guibg=NONE  ctermfg=DarkYellow  ctermbg=NONE
highlight GitGutterDeleteDefault       guifg=Red    guibg=NONE  ctermfg=DarkRed     ctermbg=NONE
