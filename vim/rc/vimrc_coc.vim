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

Plug 'jamessan/vim-gnupg'
Plug 'tpope/vim-commentary'
Plug 'editorconfig/editorconfig-vim'
Plug 'lotabout/skim', {'dir': '~/.skim', 'do': './install' },
Plug 'lotabout/skim.vim'

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
source ~/.vim/rc/snipe.vim
source ~/.vim/rc/textobject.vim

" Special Bindings:
nnoremap # *NN

" Visual Mappings:
nnoremap <Space>y "+y
vnoremap <Space>y "+y
nnoremap <Space>p "+p
vnoremap <Space>p "+p

" Window Bindings:
nnoremap <C-w>/ <C-w>v
nnoremap <C-w>- <C-w>s
nnoremap <C-w>m :tab split<CR>
nnoremap <Space>wl <C-w>l
nnoremap <Space>wh <C-w>h
nnoremap <Space>wj <C-w>j
nnoremap <Space>wk <C-w>k
nnoremap <Space>w- <C-w>s
nnoremap <Space>w/ <C-w>v
nnoremap <Space>wd <C-w>c
nnoremap <Space>w= <C-w>=
nnoremap <Space>wm :tab split<CR>
nnoremap <Space>wt/ :vert term<CR>
nnoremap <Space>wt- :term<CR>

" Searching:
nnoremap <Space>/ :RgInteractive<CR>

nnoremap <Space>ta :call LoadCoc()<CR>
nnoremap <Space>tA :CocDisable<CR>
nnoremap <Space>tn :set number!<CR>
nnoremap <Space>tr :set relativenumber!<CR>
nnoremap <Space>tw :set list!<CR>
nnoremap <Space>tV :source ~/.vimrc<CR>
nnoremap <Space>tcc :call ToggleCenterCursor()<CR>
nnoremap <Space>tcl :call ToggleCursorLine()<CR>

" Bookmarks:
nnoremap <Space>;E :e ~/.vim/files/bookmarks.vim<CR>
source ~/.vim/files/bookmarks.vim

" File Actions:
nnoremap <Space>fw :w<CR>

" Buffers:
nnoremap <Space>fb :Buffers<CR>
nnoremap <Space>bp :bprevious<CR>
nnoremap <Space>bn :bNext<CR>
nnoremap <Space>bd :bp\|bd #<CR>
nnoremap <Space>b? :w !diff % -<CR>

nnoremap <Space>lj :tabnext<CR>
nnoremap <Space>lk :tabprevious<CR>
nnoremap <Space>ln :tabnew<CR>

nnoremap <silent> <Space>e :call feedkeys(":e \<Tab>", 'tn')<CR>

" WorkMode:
nnoremap <Space>o :WorkMode<CR>

" This isn't really used for anything in my vim config currently, I'm just
" logging all files so i can experiment with a 'recent files' type of scoring
" for fuzzy matchers.
autocmd BufReadPost * :call writefile([localtime().";".getcwd().";".expand("%:p")], glob("~/.vim/files/recent.log"), "a")
autocmd BufWritePost * :call writefile([localtime().";".getcwd().";".expand("%:p")], glob("~/.vim/files/recent-write.log"), "a")

