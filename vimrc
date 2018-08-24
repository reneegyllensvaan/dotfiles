"execute pathogen#helptags()
syntax on
filetype plugin indent on
"call pathogen#infect()

" airline config:
let g:airline_powerline_fonts = 1
let g:airline_extensions = []
let g:airline_theme='bubblegum'

" lightline config
set laststatus=2
if !has('gui_running')
  set t_Co=256
endif

