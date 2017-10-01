"execute pathogen#helptags()
syntax on
filetype plugin indent on
call pathogen#infect()

" airline config:
let g:airline_powerline_fonts = 1
let g:airline_extensions = []
let g:airline_theme='bubblegum'

" lightline config
set laststatus=2

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename', 'modified', 'helloworld' ] ]
      \ },
      \ 'component': {
      \   'helloworld': 'Hello, world!'
      \ },
      \ }
