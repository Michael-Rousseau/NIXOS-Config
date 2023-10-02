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
    Plug 'svermeulen/vim-easyclip'
    Plug 'lervag/vimtex'
    let g:tex_flavor='latex'
    let g:vimtex_view_method='zathura'
    let g:vimtex_quickfix_mode=0
    set conceallevel=1
    let g:tex_conceal='abdmg'"Airline
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.3' }
" or                                , { 'branch': '0.1.x' }
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

    call plug#end()

syntax on
set encoding=utf8

""""""Colorscheme

"hi Comment ctermfg=242 guifg=#5a80ad
let g:airline_theme='raisen'
set termguicolors
set background=dark
"""""""""""""""""""""""""""""

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

set clipboard=unnamedplus

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
" Start NERDTree if a file is specified, move the cursor to its window
"autocmd StdinReadPre * let s:std_in=1

" Start NERDTree if no files are specified

" Start NERDTree and place the cursor in it if no files are specified
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | wincmd h | endif
"close all the windows when on nerdtree and :q
autocmd FileType nerdtree nnoremap <buffer> :qa<CR>

"Exit Vim if NERDTree is the only window remaining in the only tab
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif


" Toggle NERDTree with the n key
nnoremap <silent> n :NERDTree<CR>
nnoremap <Tab> :terminal bash -c "cd %:p:h && $SHELL"<CR>

"for not reload the configuration each time

inoremap <leader>f :Telescope find_files<CR>
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

"VIMTEX

"This is necessary for VimTeX to load properly. The "indent" is optional.
" Note that most plugin managers will do this automatically.
filetype plugin indent on

" This enables Vim's and neovim's syntax-related features. Without this, some
" VimTeX features will not work (see ":help vimtex-requirements" for more
" info).
syntax enable

" Viewer options: One may configure the viewer either by specifying a built-in
" viewer method:
let g:vimtex_view_method = 'zathura'

" Or with a generic interface:
let g:vimtex_view_general_viewer = 'okular'
let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'

" VimTeX uses latexmk as the default compiler backend. If you use it, which is
" strongly recommended, you probably don't need to configure anything. If you
" want another compiler backend, you can change it as follows. The list of
" supported backends and further explanation is provided in the documentation,
" see ":help vimtex-compiler".
let g:vimtex_compiler_method = 'latexrun'

" Most VimTeX mappings rely on localleader and this can be changed with the
" following line. The default is usually fine and is the symbol "\".
let maplocalleader = ","
