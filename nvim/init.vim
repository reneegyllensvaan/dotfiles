source ~/.config/nvim/pathspec.vim "
luafile ~/.config/nvim/globals.lua
source ~/.config/nvim/commands.vim

filetype plugin indent on                    " Load plugins according to detected filetype.
syntax on                                    " Enable syntax highlighting.

luafile ~/.config/nvim/options.lua
luafile ~/.config/nvim/plugins.lua

" Which-key
let g:mapleader = "\<Space>"
let g:maplocalleader = ','
luafile ~/.config/nvim/which-key.lua
call which_key#register('<Space>', "g:which_key_map")
nnoremap <silent> <leader> :<c-u>WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :<c-u>WhichKeyVisual '<Space>'<CR>

let &listchars = 'tab:> ,extends:>,precedes:<,nbsp:.'
if &shell =~# 'fish$'
  set shell=/usr/bin/zsh
endif

" Completion:
let g:deoplete#enable_at_startup=1
let g:deoplete#auto_complete_delay=0
let g:auto_refresh_delay=0
let g:deoplete#sources#rust#show_duplicates=1
" ignore buffer and surrounding lines
" let g:deoplete#ignore_sources = {}
" let g:deoplete#ignore_sources._ = ['buffer', 'around']

" Python:
let g:jedi#goto_command = "<leader>gg"
let g:jedi#goto_assignments_command = "<leader>ga"
let g:jedi#goto_definitions_command = "<leader>gd"
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>n"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#rename_command = "<leader>r"


" Airline:
let g:airline_powerline_fonts = 0
let g:airline_theme = 'material'
colorscheme space-vim-dark

" Neosnippet:
let g:neosnippet#disable_runtime_snippets = { '_' : 1 } " don't try to load default snippets
let g:neosnippet#snippets_directory = ['~/.config/nvim/snippets']
imap <C-t>     <Plug>(neosnippet_expand_or_jump)
smap <C-t>     <Plug>(neosnippet_expand_or_jump)
xmap <C-t>     <Plug>(neosnippet_expand_target)

" Custom Commands For Leader:
" Use tab as the autocomplete key
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<S-TAB>"
inoremap <expr><M-x>  Commands
" C-n to escape to normal mode in terminal
tnoremap <C-n> <C-\><C-n>
