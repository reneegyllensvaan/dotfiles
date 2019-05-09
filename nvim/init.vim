filetype plugin indent on                    " Load plugins according to detected filetype.
syntax on                                    " Enable syntax highlighting.

" Use System Clipboard:
"set clipboard=unnamedplus

" Use Terminal Controls In Gui Mode:
set guioptions=

set autoindent                               " Indent according to previous line.
set expandtab                                " Use spaces instead of tabs.
set softtabstop =2                           " Tab key indents by 2 spaces.
set shiftwidth  =2                           " >> indents by 2 spaces.
set shiftround                               " >> indents to next multiple of 'shiftwidth'.

set backspace   =indent,eol,start            " Make backspace work as you would expect.
set hidden                                   " Switch between buffers without having to save first.
"set laststatus  =2                           " Always show statusline.
set display     =lastline                    " Show as much as possible of the last line.

set showmode                                 " Show current mode in command-line.
set showcmd                                  " Show already typed keys when more are expected.

set incsearch " Highlight while searching with / or ?.
set hlsearch  " Keep matches highlighted.
set infercase " Case-insensitive completion
set ignorecase " Case-insensitive search

set ttyfast                                  " Faster redrawing.
set lazyredraw                               " Only redraw when necessary.

set splitbelow                               " Open new windows below the current window.
set splitright                               " Open new windows right of the current window.

"set cursorline                               " Find the current line quickly.
set wrapscan                                 " Searches wrap around end-of-file.
set report      =0                           " Always report changed lines.
set synmaxcol   =200                         " Only highlight the first 200 columns.
set timeoutlen=100                          " Timeout for code updates
set ttimeoutlen=0                            " Timeout for mode updates
" set notimeout
set so=999                                   " always center cursor

set list                                     " Show non-printable characters.
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

" " Put all temporary files under the same directory.
" set backup
" set backupdir   =$HOME/.vim/files/backup/
" set backupext   =-vimbackup
" set backupskip  =
" set directory   =$HOME/.vim/files/swap//
" set updatecount =100
" set undofile
" set undodir     =$HOME/.local/share/nvim/files/undo/
" set viminfo     ='100,n$HOME/.vim/files/info/viminfo


" Vim plugin settings
call plug#begin('~/.local/share/nvim/plugged')

" UI:
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'flazz/vim-colorschemes'
Plug 'Vigemus/nvimux'
Plug 'airblade/vim-gitgutter'

" Statusline:
Plug 'itchyny/lightline.vim'
"Plug 'mgee/lightline-bufferline'

" Utilies:
Plug 'christoomey/vim-system-copy'
Plug 'jamessan/vim-gnupg'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'  " General-purpose fuzzy-matching
Plug 'ctrlpvim/ctrlp.vim'

" Toolbox:
Plug 'liuchengxu/vim-which-key'  " spacemacs-style leader hints
Plug 'junegunn/goyo.vim'  " `:Goyo` to enter distraction-free mode
Plug 'vim-scripts/loremipsum', {'on': 'Lorem'}  " `:Lorem [words]` to generate placeholder text
Plug 'tomtom/tcomment_vim'  " `gc` as a comment operator
Plug 'editorconfig/editorconfig-vim'  " Use .editorconfig files
Plug 'michaeljsmith/vim-indent-object' " enables `vii` and `vai`
Plug 'tpope/vim-surround'

" Language Support:
" General
Plug 'shougo/deoplete.nvim' ", {'for': ['python', 'nim', 'javascript', 'jsx']}
Plug 'shougo/neosnippet.vim', {'for': ['python', 'nim']}
Plug 'w0rp/ale' ", {'for': ['python', 'nim', 'javascript', 'jsx']}
" Go
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries', 'for': 'go'}
" Nim
Plug 'zah/nim.vim', {'for': 'nim'}
" Latex
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
" Python
Plug 'davidhalter/jedi-vim', {'for': 'python'}
Plug 'zchee/deoplete-jedi', {'for': 'python'}
Plug 'pangloss/vim-javascript' ", {'for': ['javascript', 'jsx']}
Plug 'mxw/vim-jsx' ", {'for': 'jsx'}


" Plug 'klen/python-mode', {'for': 'python'}


call plug#end()

" " Nvimux:
" let g:nvimux_prefix = '<C-a>'
" let g:nvimux_open_term_by_default = 1
" let g:nvimux_new_window_buffer = 'single'
" let g:nvimux_quickterm_direction = 'botright'
" let g:nvimux_quickterm_orientation = 'vertical'
" let g:nvimux_quickterm_scope = 't'
" let g:nvimux_quickterm_size = '80'
" nnoremap <C-a>s :NvimuxHorizontalSplit<CR>
" nnoremap -v :NvimuxVerticalSplit<CR>

" Grep:
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
endif
if executable('rg')
  set grepprg=rg\ --color=never
endif

" Completion:
let g:deoplete#enable_at_startup=1
let g:deoplete#auto_complete_delay=0
let g:auto_refresh_delay=0
let g:python_host_prog = '/usr/local/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'
let g:deoplete#sources#rust#racer_binary='/Users/renee/.cargo/bin/racer'
let g:deoplete#sources#rust#rust_source_path='/Users/renee/.rustup/toolchains/stable-x86_64-apple-darwin/lib/rustlib/src/'
let g:deoplete#sources#rust#show_duplicates=1
" ignore buffer and surrounding lines
" let g:deoplete#ignore_sources = {}
" let g:deoplete#ignore_sources._ = ['buffer', 'around']

" Python:
let g:jedi#goto_command = "<leader>d"
let g:jedi#goto_assignments_command = "<leader>ga"
let g:jedi#goto_definitions_command = "<leader>gd"
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>n"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#rename_command = "<leader>r"


" CtrlP:
let g:ctrlp_buffer_func = { 'enter': 'CtrlPMappings' }
" Configs for specific plugins
function! CtrlPMappings()
  nnoremap <buffer> <silent> <M-d> :call <sid>DeleteBuffer()<cr>
endfunction
function! s:DeleteBuffer()
  let path = fnamemodify(getline('.')[2:], ':p')
  let bufn = matchstr(path, '\v\d+\ze\*No Name')
  exec "bd" bufn ==# "" ? path : bufn
  exec "norm \<F5>"
endfunction

" Airline:
let g:airline_powerline_fonts = 1
let g:airline_theme = 'material'
colorscheme space-vim-dark

" Neosnippet:
let g:neosnippet#disable_runtime_snippets = { '_' : 1 }
let g:neosnippet#snippets_directory = ['~/.config/nvim/snippets']
imap <C-t>     <Plug>(neosnippet_expand_or_jump)
smap <C-t>     <Plug>(neosnippet_expand_or_jump)
xmap <C-t>     <Plug>(neosnippet_expand_target)

let g:mapleader = "\<Space>"
let g:maplocalleader = ','


function! s:fzf_neighbouring_files()
  let current_file =expand("%")
  let cwd = fnamemodify(current_file, ':p:h')
  let command = 'rg -g "" -f ' . cwd . ' --depth 0'
  call fzf#run({
        \ 'source': command,
        \ 'sink':   'e',
        \ 'options': '-m -x +s',
        \ 'window':  'enew' })
endfunction

" Custom Commands For Leader:
command! FzfProjectFiles call fzf#run({'source': 'git ls-files', 'sink': 'e', 'down': '30%'})
command! ToggleLineNumbers :set invnumber
command! FZFNeigh call s:fzf_neighbouring_files()

" Root which-key mappings
let g:which_key_map =  {
      \ '/' : ['Rg', 'ripgrep'],
      \ }

" Tabs:
let g:which_key_map.l = {
      \ 'name' : '+tabs' ,
      \ 'n' : ['tabnew'      , 'tabnew']     ,
      \ 'k' : ['tabprevious' , 'tabprevious'],
      \ 'j' : ['tabnext'     , 'tabnext']    ,
      \ }

" Project:
let g:which_key_map.p = {
      \ 'name' : '+project' ,
      \ 'f' : ['FzfProjectFiles'    , 'fzf-project-files']            ,
      \ }

" Files:
let g:which_key_map.f = {
      \'name': '+file' ,
      \'t': ['NERDTreeToggle', 'nerdtree'],
      \}

" Vim:
let g:which_key_map.V = {
      \'name': '+Vim' ,
      \'e': [':@*', 'eval-region'],
      \}

let g:which_key_map.g = {
      \'name': '+toggle' ,
      \'s': [':!git status', 'git-status'],
      \}

let g:which_key_map.t = {
      \'name': '+toggle' ,
      \'n': ['ToggleLineNumbers', 'toggle-line-numbers'],
      \'g': {
      \   'name': '+git',
      \   'd': ['GitGutterBufferToggle', 'gitgutter (buffer)'],
      \   'D': ['GitGutterToggle', 'gitgutter (global)'],
      \},
      \'c': {
      \   'name': 'center',
      \   'b': ['Goyo', 'toggle-goyo'],
      \},
      \}

let g:which_key_map.w = {
      \ 'name' : '+windows' ,
      \ 'w' : ['<C-W>w'     , 'other-window']          ,
      \ 'd' : ['<C-W>c'     , 'delete-window']         ,
      \ '-' : ['<C-W>s'     , 'split-window-below']    ,
      \ '/' : ['<C-W>v'     , 'split-window-right']    ,
      \ '2' : ['<C-W>v'     , 'layout-double-columns'] ,
      \ 'h' : ['<C-W>h'     , 'window-left']           ,
      \ 'j' : ['<C-W>j'     , 'window-below']          ,
      \ 'l' : ['<C-W>l'     , 'window-right']          ,
      \ 'k' : ['<C-W>k'     , 'window-up']             ,
      \ 'H' : ['<C-W>5<'    , 'expand-window-left']    ,
      \ 'G' : ['GoldenRatioToggle', 'expand-window-left']    ,
      \ 'J' : ['resize +5'  , 'expand-window-below']   ,
      \ 'L' : ['<C-W>5>'    , 'expand-window-right']   ,
      \ 'K' : ['resize -5'  , 'expand-window-up']      ,
      \ '=' : ['<C-W>='     , 'balance-window']        ,
      \ 's' : ['<C-W>s'     , 'split-window-below']    ,
      \ 'v' : ['<C-W>v'     , 'split-window-below']    ,
      \ '?' : ['Windows'    , 'fzf-window']            ,
      \ }

let g:which_key_map.b = {
      \ 'name' : '+buffer' ,
      \ '1' : ['b1'        , 'buffer 1']        ,
      \ '2' : ['b2'        , 'buffer 2']        ,
      \ 'd' : [':bp\|bd'   , 'delete-buffer']   ,
      \ 'f' : ['bfirst'    , 'first-buffer']    ,
      \ 'h' : ['Startify'  , 'home-buffer']     ,
      \ 'l' : ['blast'     , 'last-buffer']     ,
      \ 'n' : ['bnext'     , 'next-buffer']     ,
      \ 'p' : ['bprevious' , 'previous-buffer'] ,
      \ 'b' : ['Buffers'   , 'fzf-buffer']      ,
      \ }

call which_key#register('<Space>', "g:which_key_map")
nnoremap <silent> <leader> :<c-u>WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :<c-u>WhichKeyVisual '<Space>'<CR>
" Use tab as the autocomplete key
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<S-TAB>"
" C-n to escape to normal mode in terminal
tnoremap <C-n> <C-\><C-n>

lua << EOF
local nvimux = require('nvimux')
-- Nvimux configuration
nvimux.config.set_all{
  prefix = '<C-t>',
  new_window = 'enew',
  open_term_by_default = true,
  new_window_buffer = 'single',
}
-- Nvimux custom bindings
nvimux.bindings.bind_all{
  {'i', ':NvimuxHorizontalSplit', {'n', 'v', 'i', 't'}},
  {'s', ':NvimuxVerticalSplit', {'n', 'v', 'i', 't'}},
}
-- Required so nvimux sets the mappings correctly
nvimux.bootstrap()
EOF

