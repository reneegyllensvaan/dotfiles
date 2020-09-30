" vim:fdm=marker
filetype plugin indent on         " Load plugins according to detected filetype.
syntax on                         " Enable syntax highlighting.
set nocompatible
set encoding=utf-8

set autoindent                    " Indent according to previous line.
set expandtab                     " Use spaces instead of tabs.
set softtabstop =2                " Tab key indents by 2 spaces.
set shiftwidth  =2                " >> indents by 2 spaces.
set shiftround                    " >> indents to next multiple of 'shiftwidth'.

set backspace   =indent,eol,start " Make backspace work as you would expect.
set hidden                        " Switch between buffers without having to save first.
"set laststatus  =2               " Always show statusline.
"set display     =lastline         " Show as much as possible of the last line.

set foldmethod=syntax  " Collapsing with `za` should be based on syntax
set foldlevel=99       " But unfold all text by default

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

" ['gnupg','commentary','editorconfig','skim','polyglot','floaterm','onedark','coc']
"   .map(v => `/Users/renee/.vim/blugin/${v}`).join(',')+'/Users/renee/.skim';
function! EnsureLoaded(name, ...) abort
  let plugin_path = expand('~/.vim/blugin/'.a:name)
  if !(&rtp =~ plugin_path)
    let &rtp.=','.plugin_path
    " exec ''.a:name.'.vim'
  endif
  if !empty(a:000)
    echo "refresh!"
    exec "runtime plugin/".a:name.".vim"
  endif
endfunction
let &rtp.=','.expand('~/.skim')
call EnsureLoaded('gnupg')
call EnsureLoaded('commentary')
call EnsureLoaded('editorconfig')
call EnsureLoaded('skim')
call EnsureLoaded('polyglot')
call EnsureLoaded('floaterm')
if has('gui_running')
  call EnsureLoaded('onedark')
endif

" Plugin Config: {{{
let g:skim_history_dir = '~/.local/share/skim-history'
let g:floaterm_autoclose = 2
" Plugin Config }}}

" This is a special hack because some functions need to know if they're part
" of a repeated command. An example is the `sneak` functions, which use it to
" determine whether they should prompt for new text, or re-use the same input
" from the last command.
let g:is_repeating = 0
function! DoRepeat()
  let g:is_repeating = 1
  exec 'normal! .'
  let g:is_repeating = 0
endfunction
nnoremap <silent> . :call DoRepeat()<CR>

source ~/.vim/rc/commands.vim
source ~/.vim/rc/fzy.vim
source ~/.vim/rc/look_and_feel.vim
source ~/.vim/rc/surround.vim
source ~/.vim/rc/snipe.vim
source ~/.vim/rc/textobject.vim

if exists('$SPACELAB')
  source ~/.vim/rc/space.vim
else
  source ~/.vim/rc/bindings.vim
end

" This isn't really used for anything in my vim config currently, I'm just
" logging all files so i can experiment with a 'recent files' type of scoring
" for fuzzy matchers.
autocmd BufReadPost * :call writefile([localtime().";".getcwd().";".expand("%:p")], glob("~/.vim/files/recent.log"), "a")
autocmd BufWritePost * :call writefile([localtime().";".getcwd().";".expand("%:p")], glob("~/.vim/files/recent-write.log"), "a")

