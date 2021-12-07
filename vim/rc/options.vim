" vim: fdm=marker ft=sourceonsave.vim
set encoding=utf-8

" Enable line numbers and gutters by default
set number
set signcolumn=yes

" Traversing braces should not open folds
set foldopen-=block
" h/l should not open folds
set foldopen-=hor

" Remove comment operators when joining commented lines
set formatoptions+=j

" Always choose "edit anyway" if a swap file is found
set shortmess=A

" Automatically refresh files changed on disk if no unsaved changes
set autoread

" Indent according to previous line.
set autoindent

set expandtab    " Use spaces instead of tabs.
set tabstop=2      " Tab key indents by 2 spaces.
set softtabstop=2  " Tab key indents by 2 spaces.
set shiftwidth=2   " >> indents by 2 spaces.
set shiftround     " >> indents to next multiple of 'shiftwidth'.

set cursorline  " Highlight current cursor line
set backspace=indent,eol,start " Allow full editing with backspace
set hidden  " Switch between buffers without having to save first.
set laststatus=1  " Show statusline if multiple windows
"set display     =lastline         " Show as much as possible of the last line.

set foldmethod=syntax  " Collapsing with `za` should be based on syntax
set foldlevel=99       " But unfold all text by default

set wildmenu  " Use fancy tab completion menu
" And configure wildmenu to:
"   - longest: complete to longest shared prefix
"   - :full: and use wildmenu
"   - ,full: fall back to cycling thru matches
set wildmode=longest:full,full

set showmode " Show current mode in command-line.
set showcmd  " Show already typed keys when more are expected.

set incsearch  " Highlight while searching with / or ?.
set hlsearch   " Keep matches highlighted.
if has('nvim')
  set inccommand=nosplit
end

set ttyfast          " Faster redrawing.
set lazyredraw       " Only redraw when necessary.

set splitbelow       " Open new windows below the current window.
set splitright       " Open new windows right of the current window.

set wrapscan         " Searches wrap around end-of-file.
set report      =0   " Always report changed lines.
set synmaxcol   =800 " Only highlight the first N columns.
set timeoutlen=1000  " Timeout for code updates
set ttimeoutlen=0    " Timeout for mode updates
set so=999   " Keeps cursor in center of window by default.

set ignorecase  " Case-insensitive :commands and /search
set smartcase   " Case-sensitive search if query contains an uppercase letter

set nolist  " Show non-printable characters.
if has('multi_byte') && &encoding ==# 'utf-8'
  " let &listchars = 'tab:▸ ,extends:❯,precedes:❮,nbsp:±'
  let &listchars = 'tab:│ ,trail:·,extends:→,precedes:❮,nbsp:±'
else
  let &listchars = 'tab:> ,extends:>,precedes:<,nbsp:.'
endif

" The fish shell is not very compatible to other shells and unexpectedly
" breaks things that use 'shell'.
if &shell =~# 'fish$'
  set shell=/usr/bin/bash
endif

" Put all temporary files under the same directory.
let s:base_dir = $HOME."/.vim/files/".(has('nvim') ? 'nvim' : 'vim')
let &backupdir = s:base_dir."/backup/"
let &directory = s:base_dir."/swap//"
let &undodir   = s:base_dir."/undo/"
let &viminfo = "100,n".s:base_dir."/info/viminfo"
set backup
set backupext   =-vimbackup
set backupskip  =
set updatecount =100
set undofile

" Use `rg` as grep provider
let &grepprg = "gr-vim"
set grepformat=%f:%l:%c:%m
