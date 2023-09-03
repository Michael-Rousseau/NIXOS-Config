"iNSTALL nPlug if not already done
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

filetype plugin on

call plug#begin('~/.vim/plugged')
    " Autocomplete
    Plug 'vim-scripts/AutoComplPop'

    "Airline
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'

    "File System explorer
    Plug 'preservim/nerdtree'

    " Auto pairs
    Plug 'jiangmiao/auto-pairs'

    " Man pages in Vim
    Plug 'vim-utils/vim-man'

    " Rust detection
    Plug 'rust-lang/rust.vim'

    "colorscheme
    Plug 'TCHEOUValentine/raisen'

    Plug 'drewtempelmeyer/palenight.vim'

    Plug 'vim-syntastic/syntastic'

    Plug 'rhysd/vim-clang-format'

    " Use release branch (recommend)
    Plug 'neoclide/coc.nvim', {'branch': 'release'}

    call plug#end()

syntax on
set encoding=utf8

""""""Colorscheme


"hi Comment ctermfg=242 guifg=#5a80ad
"let g:airline_theme='raisen'
"set termguicolors
"set background=dark
""""""""""""""""""""""""""""""

set expandtab
set shiftwidth=4
set softtabstop=4
set smartindent
set smarttab

set wildmenu
set wildmode=list:longest

set autoindent
set smartindent
set backspace=indent,eol,start

" Numbers
set number
set relativenumber

" Limit line length
set textwidth=80
set colorcolumn=80
highlight Column ctermfg=grey ctermbg=darkblue

" Keep 5 lines below and above the cursor
set scrolloff=5

" fix splitting
set splitbelow splitright

set clipboard+=unnamedplus
set clipboard=unnamed

" resize split automatically
autocmd VimResized * wincmd =

filetype on

set showmatch
set hlsearch
set mouse=a
set number
set cc=80
set cursorline


set statusline=
set statusline+=\ %F\ %M\ %Y\ %R
set statusline+=%=
set statusline+=\ ascii:\ %b\ hex:\ 0x%B\ row:\ %l\ col:\ %c\ percent:\ %p%%
set laststatus=2

set incsearch
set ignorecase
set showmatch
set hlsearch

set belloff=all

set showcmd

set showmode

set backspace=indent,eol,start



" Autocompletion settings
set complete+=kspell,d
set completeopt=menuone,popup
set shortmess+=c

" Better completion experience
set completeopt=menuone,noinsert,noselect

" Avoid mistypes
command W w
command Q q
command WQ wq
command Wq wq

"Spaces display
set list listchars=tab:>.,trail:~,extends:>,precedes:<
highlight SpecialKey ctermfg=blue

"
" NERDTREE
"

" Start NERDTree. If a file is specified, move the cursor to its window
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif

" Exit Vim if NERDTree is the only window remaining in the only tab
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Toggle NerdTree
nnoremap <leader>n :NERDTreeToggle<CR>

"for not reload the configuration each time

augroup AutoReloadVimrc
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END


"
" ACP
"
" Enable ACP at the start
let g:acp_enableAtStartup = 1

" Enable completion menu
map <F5> :AcpEnable<CR>

" Disable completion menu
map <F4> :AcpDisable<CR>

" Enter to select in completion menu
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

nnoremap <C-j> :ClangFormat<CR>

"
" MAN
"

let g:vim_man_cmd = 'man'
let mapleader = '\'

