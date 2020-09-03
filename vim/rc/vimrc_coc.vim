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
Plug 'tpope/vim-commentary', {'on': 'Commentary'}
"Plug 'tomtom/tcomment_vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'lotabout/skim', {'dir': '~/.skim', 'do': './install' },
Plug 'lotabout/skim.vim'

Plug 'sheerun/vim-polyglot'

if has('gui_running')
  Plug 'joshdick/onedark.vim'
endif
" Plug 'vimwiki/vimwiki', {'branch': 'release', 'on': 'idk if i will add this'}
Plug 'jupyter-vim/jupyter-vim'
", {'on': 'JupyterConnect'}

Plug 'neoclide/coc.nvim', {'branch': 'release', 'on': 'CocEnable'}

call plug#end()

noremap <Space> <Nop>
nnoremap <Space> <Nop>
let mapleader = "\<Space>"
let g:mapleader = "\<Space>"
"let maplocalleader = ','

" Commands For Leaders:
let g:rg_opts = '--smart-case'
command! FzfProjectFiles call skim#run({'source': 'git ls-files-root', 'sink': 'e', 'down': '30%'})
command! -bang -nargs=* RgInteractive call fzf#vim#rg_interactive(<q-args>)
command! -bang -nargs=* RgSkim call fzf#vim#rg_interactive(<q-args>, fzf#vim#with_preview('right:50%:hidden', 'alt-h'))
command! -nargs=* Fd call skim#run({'source': "fd <args>", 'sink': 'e', 'down': '30%'})

function! LoadCoc()
  execute 'CocEnable'
  if !exists("g:coc_is_sourced")
      let g:coc_is_sourced = 1
      execute 'source' "~/.vim/rc/coc.vim"
      if has('gui_running')
        execute 'CocStart'
      endif
  endif
endfunction

let g:center_cursor_disabled_scrolloff = 4
function! ToggleCenterCursor()
  if &so == 999
    exec 'set so=' . g:center_cursor_disabled_scrolloff
    let g:center_cursor_disabled_scrolloff = &so
  else
    set so=999
  end
endfunction

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
nnoremap <Leader>ft :Tags<CR>
nnoremap <Leader>fp :FzfProjectFiles<CR>
nnoremap <Leader>ff :Fd<CR>
nnoremap <Leader>/ :RgInteractive<CR>
nnoremap <Leader>? :RgSkim<CR>

nnoremap <Leader>ta :call LoadCoc()<CR>
nnoremap <Leader>tA :CocDisable<CR>
nnoremap <Leader>tn :set number!<CR>
nnoremap <Leader>tr :set relativenumber!<CR>
nnoremap <Leader>tw :set list!<CR>
nnoremap <Leader>tV :source ~/.vimrc<CR>
nnoremap <Leader>tcc :call ToggleCenterCursor()<CR>
nnoremap <Leader>tcl :set cursorline!<CR>

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

source ~/.vim/rc/fzy.vim

" UI Customization: {{{

hi Pmenu ctermbg=16
hi Search ctermbg=11 ctermfg=black
hi Visual ctermbg=238 ctermfg=NONE
hi CocHighlightText ctermbg=0

"" statusline
hi User1 ctermbg=darkgray ctermfg=white guibg=#98C379 guifg=grey
hi User2 ctermbg=green ctermfg=black guibg=#C678DD guifg=black
hi User3 ctermbg=darkgray ctermfg=lightgreen guibg=#ffffff guifg=lightgreen
set laststatus=2
set statusline=                          " left align
set statusline+=%2*\ %{StatuslineMode()}
set statusline+=\ %1*\ %f                  " short filename
set statusline+=%=                       " right align
set statusline+=%*
set statusline+=%3*\%h%m%r               " file flags (help, read-only, modified)
set statusline+=%3*\%.25F                " long filename (trimmed to 25 chars)
set statusline+=%3*\::
set statusline+=%3*\%l/%L\\|             " line count
set statusline+=%3*\%y                   " file type

"" statusline
function! StatuslineMode()
    let l:mode=mode()
    if l:mode==#"n"
        hi User2 ctermbg=green ctermfg=black guibg=#98C379 guifg=black
        return "NORMAL"
    elseif l:mode==?"v"
        hi User2 ctermbg=magenta ctermfg=black guibg=#C678DD guifg=black
        return "VISUAL"
    elseif l:mode==#"i"
        hi User2 ctermbg=cyan ctermfg=black guibg=#56B6C2 guifg=black
        return "INSERT"
    elseif l:mode==#"R"
        hi User2 ctermbg=red ctermfg=black guibg=#E06C75 guifg=black
        return "REPLACE"
    endif
endfunction

"hi CursorLine cterm=NONE ctermbg=238
"augroup CursorLine
"  au!
"  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
"  au WinLeave * setlocal nocursorline
"augroup END

let g:netrw_banner=0
let g:netrw_browse_split=4
let g:netrw_altv=1
let g:netrw_liststyle=3
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'
let g:netrw_list_hide.=',\.(pyc)$'

function! ToggleVExplorer()
  if exists("t:expl_buf_num")
      let expl_win_num = bufwinnr(t:expl_buf_num)
      if expl_win_num != -1
          let cur_win_nr = winnr()
          exec expl_win_num . 'wincmd w'
          close
          exec cur_win_nr . 'wincmd w'
          unlet t:expl_buf_num
      else
          unlet t:expl_buf_num
      endif
  else
      exec '1wincmd w'
      Vexplore
      let t:expl_buf_num = bufnr("%")
  endif
endfunction

let g:netrw_winsize = -28
nnoremap <silent> <Leader>tf :call ToggleVExplorer()<CR>
let g:netrw_fastbrowse = 0
autocmd FileType netrw setl bufhidden=wipe

" }}} UI Customization

autocmd BufReadPost * :call writefile([getcwd().";".expand("%:p")], "/Users/renee/.vim/files/recent.log", "a")

if has('gui_running')
  colorscheme onedark
  set guioptions=
  set guifont=Menlo-Regular:h11
end

command! RC edit ~/.vimrc
command! RCFzy edit ~/.vim/rc/fzy.vim
command! RCSurround edit ~/.vim/rc/surround.vim
command! RCWorkMode edit ~/workmode.vim
command! WorkMode source ~/workmode.vim

