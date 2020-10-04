set nocompatible

source ~/.config/nvim/pathspec.vim
luafile ~/.config/nvim/globals.lua
source ~/.config/nvim/commands.vim

filetype plugin indent on                    " Load plugins according to detected filetype.
syntax on                                    " Enable syntax highlighting.

luafile ~/.config/nvim/options.lua
luafile ~/.config/nvim/plugins.lua
"luafile ~/.config/nvim/iron.lua
source ~/.config/nvim/coc-config.vim

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

" Skim:
let g:rg_opts = "--smart-case"

" Latex:
let g:livepreview_previewer = 'zathura'
au FileType markdown vmap <Leader><Bslash> :EasyAlign*<Bar><Enter>

" Airline:
let g:airline_powerline_fonts = 0
let g:airline_theme = 'material'
" colorscheme space-vim-dark

" Neosnippet:
let g:neosnippet#disable_runtime_snippets = { '_' : 1 } " don't try to load default snippets
let g:neosnippet#snippets_directory = ['~/.config/nvim/snippets']
imap <C-t>     <Plug>(neosnippet_expand_or_jump)
smap <C-t>     <Plug>(neosnippet_expand_or_jump)
xmap <C-t>     <Plug>(neosnippet_expand_target)

" Use tab as the autocomplete key
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<S-TAB>"
inoremap <expr><M-x>  Commands
" C-n to escape to normal mode in terminal
tnoremap <C-n> <C-\><C-n>
nnoremap <silent> <C-_> :set ignorecase!<CR>

" " Keybindings to navigate between changed hunks
" nnoremap <expr> <M-]> NextGitHunk()
" nnoremap <expr> <M-[> PrevGitHunk()
" inoremap <expr> <M-]> NextGitHunk()
" inoremap <expr> <M-[> PrevGitHunk()


" Vimwiki:
let g:vimwiki_list = [{'path': '~/org/vimwiki', 'syntax': 'markdown', 'ext': '.md'}]
