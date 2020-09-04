" vim:fdm=marker
let loaded_matchparen = 1
filetype plugin indent on         " Load plugins according to detected filetype.
syntax on                         " Enable syntax highlighting.
set nocompatible
set encoding=utf-8

" Use System Clipboard:
"set clipboard=unnamedplus

set autoindent                    " Indent according to previous line.
set expandtab                     " Use spaces instead of tabs.
set softtabstop =2                " Tab key indents by 2 spaces.
set shiftwidth  =2                " >> indents by 2 spaces.
set shiftround                    " >> indents to next multiple of 'shiftwidth'.

set backspace   =indent,eol,start " Make backspace work as you would expect.
set hidden                        " Switch between buffers without having to save first.
"set laststatus  =2               " Always show statusline.
"set display     =lastline         " Show as much as possible of the last line.

set foldmethod=syntax
set foldlevel=99                  " Unfold all by default

set wildmenu
set wildmode=longest:full,full

set showmode                      " Show current mode in command-line.
set showcmd                       " Show already typed keys when more are expected.

set incsearch                     " Highlight while searching with / or ?.
set hlsearch                      " Keep matches highlighted.

set ttyfast                       " Faster redrawing.
set lazyredraw                    " Only redraw when necessary.

set splitbelow                    " Open new windows below the current window.
set splitright                    " Open new windows right of the current window.

"set cursorline                   " Find the current line quickly.
set wrapscan                      " Searches wrap around end-of-file.
set report      =0                " Always report changed lines.
set synmaxcol   =800              " Only highlight the first 200 columns.
set timeoutlen=2000                " Timeout for code updates
set ttimeoutlen=0                 " Timeout for mode updates
" set notimeout
set so=999                        " always center cursor

set ignorecase                    " Case insensitive grep
set smartcase
set infercase                     " Case insensitive tab completion

set nolist                          " Show non-printable characters.
if has('multi_byte') && &encoding ==# 'utf-8'
  let &listchars = 'tab:▸ ,extends:❯,precedes:❮,nbsp:±'
else
  let &listchars = 'tab:> ,extends:>,precedes:<,nbsp:.'
endif

" The fish shell is not very compatible to other shells and unexpectedly
" breaks things that use 'shell'.
if &shell =~# 'fish$'
  set shell=/usr/bin/bash
endif

" Put all temporary files under the same directory.
set backup
set backupdir   =$HOME/.vim/files/backup/
set backupext   =-vimbackup
set backupskip  =
set directory   =$HOME/.vim/files/swap//
set updatecount =100
set undofile
set undodir     =$HOME/.vim/files/undo/
set viminfo     ='100,n$HOME/.vim/files/info/viminfo

" Vim plugin settings
call plug#begin('~/.vim/plugged')

Plug 'christoomey/vim-system-copy'
Plug 'jamessan/vim-gnupg'
Plug 'tpope/vim-commentary'
Plug 'editorconfig/editorconfig-vim'
Plug 'lotabout/skim', {'dir': '~/.skim', 'do': './install' },
"Plug 'lotabout/skim.vim'

Plug 'sheerun/vim-polyglot'

if has('gui_running')
  Plug 'joshdick/onedark.vim'
endif

Plug 'neoclide/coc.nvim', {'branch': 'release', 'on': 'CocEnable'}

call plug#end()

noremap <Space> <Nop>
nnoremap <Space> <Nop>
let mapleader = "\<Space>"
let g:mapleader = "\<Space>"
"let maplocalleader = ','

source ~/.vim/rc/commands.vim
source ~/.vim/rc/fzy.vim
source ~/.vim/rc/look_and_feel.vim
source ~/.vim/rc/surround.vim

" Window Bindings:
nnoremap <C-w>/ <C-w>v
nnoremap <C-w>- <C-w>s
nnoremap <Leader>wl <C-w>l
nnoremap <Leader>wh <C-w>h
nnoremap <Leader>wj <C-w>j
nnoremap <Leader>wk <C-w>k
nnoremap <Leader>w- <C-w>s
nnoremap <Leader>w/ <C-w>v
nnoremap <Leader>wd <C-w>c
nnoremap <Leader>w= <C-w>=

" Searching:
nnoremap <Leader>/ :RgInteractive<CR>

nnoremap <Leader>ta :call LoadCoc()<CR>
nnoremap <Leader>tA :CocDisable<CR>
nnoremap <Leader>tn :set number!<CR>
nnoremap <Leader>tr :set relativenumber!<CR>
nnoremap <Leader>tw :set list!<CR>
nnoremap <Leader>tV :source ~/.vimrc<CR>
nnoremap <Leader>tcc :call ToggleCenterCursor()<CR>
nnoremap <Leader>tcl :call ToggleCursorLine()<CR>

" Bookmarks:
nnoremap <Leader>;E :e ~/.vim/files/bookmarks.vim<CR>
source ~/.vim/files/bookmarks.vim

" File Actions:
nnoremap <Leader>fw :w<CR>

nnoremap <Leader>fb :Buffers<CR>
nnoremap <Leader>bp :bprevious<CR>
nnoremap <Leader>bn :bNext<CR>
nnoremap <Leader>bd :bp\|bd #<CR>

nnoremap <Leader>lj :tabnext<CR>
nnoremap <Leader>lk :tabprevious<CR>
nnoremap <Leader>ln :tabnew<CR>

nnoremap <silent> <Leader>e :call feedkeys(":e \<Tab>", 'tn')<CR>

" This isn't really used for anything in my vim config currently, i'm just
" logging all files so i can experiment with a 'recent files' type of scoring
" for fuzzy matchers.
autocmd BufReadPost * :call writefile([localtime().";".getcwd().";".expand("%:p")], glob("~/.vim/files/recent.log"), "a")

