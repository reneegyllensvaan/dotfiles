filetype plugin indent on                    " Load plugins according to detected filetype.
syntax on                                    " Enable syntax highlighting.

luafile ~/.config/nvim/init.lua

" Which-key
luafile ~/.config/nvim/which-key.lua
command! FzfProjectFiles call fzf#run({'source': 'git ls-files', 'sink': 'e', 'down': '30%'})
command! ToggleLineNumbers :set invnumber
command! FZFNeigh call s:fzf_neighbouring_files()
call which_key#register('<Space>', "g:which_key_map")
nnoremap <silent> <leader> :<c-u>WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :<c-u>WhichKeyVisual '<Space>'<CR>

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
let g:python_host_prog = 'python'
let g:python3_host_prog = 'python3'
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
" Use tab as the autocomplete key
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<S-TAB>"
inoremap <expr><M-x>  Commands
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
