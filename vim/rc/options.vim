set nocompatible
set encoding=utf-8

set autoindent     " Indent according to previous line.
set expandtab      " Use spaces instead of tabs.
set softtabstop=2  " Tab key indents by 2 spaces.
set shiftwidth=2   " >> indents by 2 spaces.
set shiftround     " >> indents to next multiple of 'shiftwidth'.

set backspace=indent,eol,start " Allow full editing with backspace
set hidden  " Switch between buffers without having to save first.
set laststatus=1  " Show statusline if more than 2 windows
"set display     =lastline         " Show as much as possible of the last line.

set foldmethod=syntax  " Collapsing with `za` should be based on syntax
set foldlevel=99       " But unfold all text by default

set wildmenu  " Use fancy tab completion menu
" And configure wildmenu to:
"   - longest: complete to longest shared prefix
"   - :full: and use wildmenu
"   - ,full: fall back to cycling thru matches
set wildmode=longest:full,full

set noshowmode " Show current mode in command-line.
set showcmd  " Show already typed keys when more are expected.

set incsearch  " Highlight while searching with / or ?.
set hlsearch   " Keep matches highlighted.

set ttyfast                       " Faster redrawing.
set lazyredraw                    " Only redraw when necessary.

set splitbelow                    " Open new windows below the current window.
set splitright                    " Open new windows right of the current window.

set wrapscan                      " Searches wrap around end-of-file.
set report      =0                " Always report changed lines.
set synmaxcol   =800              " Only highlight the first 200 columns.
set timeoutlen=2000                " Timeout for code updates
set ttimeoutlen=0                 " Timeout for mode updates
set so=999   " Keeps cursor in center of window by default.

set ignorecase  " Case-insensitive :commands and /search
set smartcase   " Case-sensitive search if query contains an uppercase letter

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
