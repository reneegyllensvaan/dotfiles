" This is my minimal vimrc for contexts where I don't want to set up my whole
" environment and plugins and nonsense. It's a single file so I can just
" scp ~/.vim/vimrc_minimal.vim <host>:.vimrc

set encoding=utf-8
set number
set signcolumn=yes
set foldopen-=block
set foldopen-=hor
set formatoptions+=j
set shortmess=A
set autoread
set autoindent
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set shiftround
set cursorline
set backspace=indent,eol,start
set hidden
set laststatus=1
set foldmethod=syntax
set foldlevel=99
set wildmenu
set wildmode=longest:full,full
set showmode
set showcmd
set incsearch
set hlsearch
if has('nvim')
  set inccommand=nosplit
end
set ttyfast
set lazyredraw
set splitbelow
set splitright
set wrapscan
set report      =0
set synmaxcol   =800
set timeoutlen=1000
set ttimeoutlen=0
set so=999
set ignorecase
set smartcase
set nolist
if has('multi_byte') && &encoding ==# 'utf-8'
  let &listchars = 'tab:│ ,trail:·,extends:→,precedes:❮,nbsp:±'
else
  let &listchars = 'tab:> ,extends:>,precedes:<,nbsp:.'
endif
if &shell =~# 'fish$'
  set shell=/usr/bin/bash
endif
if !glob('~/.vim')
  !mkdir -p ~/.vim/{vim,nvim}/files/{backup,swap,undo}
endif
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

function! DrillWindowOrTab(b)
  if a:b
    if winnr() == 1
      normal! gT
      $wincmd w
    else
      exec (winnr()-1)."wincmd w"
    end
  else
    if winnr() == winnr('$')
      normal! gt
      1wincmd w
    else
      exec (winnr()+1)."wincmd w"
    end
  end
endfunction

nnoremap <C-u> <Nop>
noremap ZZ <Nop>
noremap ZQ <Nop>
noremap ' :
noremap <A-'> :!
noremap <Delete> '
noremap Y <Nop>
nnoremap v V
nnoremap V v
xnoremap v v
nnoremap <C-s> <Nop>
nnoremap <C-t> <Nop>
nnoremap <C-c> <Nop>
nnoremap <C-c><C-c> <Nop>
nnoremap <C-a> <Nop>
noremap <Space> <Nop>
noremap q <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
noremap <expr> Q (empty(reg_recording()) ? "q".tolower(nr2char(getchar())) : "q")
nnoremap <C-a><C-a> <C-a>
nnoremap <A-Up> <C-w>+
nnoremap <A-Down> <C-w>-
nnoremap <A-Left> <C-w><<C-w><
nnoremap <A-Right> <C-w>><C-w>>
xnoremap <silent> <A-Up> :move '<-2<CR>gv
xnoremap <silent> <A-Down> :move '>+1<CR>gv
inoremap <silent> <A-Up> <C-o>:<C-u>move -2<CR>
inoremap <silent> <A-Down> <C-o>:<C-u>move +1<CR>
nnoremap <M-/> :%s///<Left><Left>
vnoremap <M-/> :s///<Left><Left>
nnoremap <expr> <M-%> getline(".")[getpos(".")[2]-1] =~# '[\[\]\{\}\(\)]' ? "v\%" : ":call editfns#around_delimiters()<CR>"
if !hasmapto("\<Tab>")
  inoremap <Tab> <C-t>
  inoremap <S-Tab> <C-d>
endif
inoremap <C-g> <Esc>
inoremap <C-p> <Nop>
inoremap <C-c> <Nop>
inoremap <C-c><C-s> <C-o>:w<CR>
inoremap <C-r><C-r> <C-r>"
inoremap <C-s> <C-w>
inoremap <C-e> <Nop>
inoremap <C-e><C-l> {<Cr>}<C-o>O
inoremap <C-e><C-y> [<Cr>]<C-o>O
inoremap <C-e><C-e> (<Cr>)<C-o>O
inoremap <M-e> <Space>==<Space>
inoremap <M-E> <Space>!=<Space>
inoremap <C-t><C-u> UUID
nnoremap <A-s> za
nnoremap \ff :set fdm=manual<cr>
nnoremap \fi :set fdm=indent<cr>
nnoremap \fm :set fdm=marker<cr>
nnoremap \fs :set fdm=syntax<cr>
nnoremap \fd :set fdm=diff<cr>
nnoremap <C-j> <Esc>o
nnoremap <bs> @q
nnoremap \= gg=G``
nnoremap \S :spellgood <C-r><C-w>
nnoremap \sa yiw:e ~/.vim/rc/autocorrect.vim<CR>Goiab <C-r>0 <C-r>0
nnoremap <expr> <Space>ta ":setlocal ".(&l:spell ? "no" : "")."spell\<CR>"
nnoremap \< V`]<
nnoremap \> V`]>
nnoremap \F :Format<cr>
nnoremap \T :silent s/\<\(\w\)\(\S*\)/\u\1\L\2/g<cr>:noh<cr>
nnoremap # *NN
nnoremap Y y$
nnoremap <silent> c* *Ncgn
nnoremap <silent> c# #Ncgn
nnoremap <silent> cg* g*Ncgn
nnoremap <silent> cg# g#Ncgn
nnoremap gj ddp
nnoremap gk ddkP
xnoremap <silent> gj :move '>+1<CR>gv
xnoremap <silent> gk :move '<-2<CR>gv
nnoremap c~ ~hi<Space><C-o>h
tnoremap <silent> <C-v> <C-\><C-n>:call term_sendkeys(bufnr(), getreg(nr2char(getchar())))<CR>
tnoremap <silent> <C-s> <C-w>
if has('nvim')
  tnoremap <silent> <C-w>N <C-\><C-n>
  tnoremap <silent> <C-s> <C-w>
  tnoremap <silent> <C-w>h <C-\><C-n><C-w>h
  tnoremap <silent> <C-w>j <C-\><C-n><C-w>j
  tnoremap <silent> <C-w>k <C-\><C-n><C-w>k
  tnoremap <silent> <C-w>l <C-\><C-n><C-w>l
  tnoremap <silent> <C-w>H <C-\><C-n><C-w>H
  tnoremap <silent> <C-w>J <C-\><C-n><C-w>J
  tnoremap <silent> <C-w>K <C-\><C-n><C-w>K
  tnoremap <silent> <C-w>L <C-\><C-n><C-w>L
  tnoremap <silent> <C-w>: <C-\><C-n><C-w>:
  tnoremap <silent> <C-w>c <C-\><C-n><C-w>c
  tnoremap <silent> <C-w><C-w> <C-\><C-n><C-w><C-w>
endif
nnoremap <Space>y "+y
xnoremap <Space>y "+y
nnoremap <Space>p "+p
xnoremap <Space>p "+p
xnoremap zj <Esc>`<mz`>mx`zjm<`xm>gv
xnoremap zk <Esc>`<mz`>mx`zkm<`xm>gv
xnoremap zJ <Esc>`<mz`>mx`xjm>`zm<gv
xnoremap zK <Esc>`<mz`>mx`xkm>`zm<gv
xnoremap zh <Esc>`<mz`>mx`zkm<`xjm>gv
xnoremap zl <Esc>`<mz`>mx`zjm<`xkm>gv
xnoremap < <gv
xnoremap > >gv
xnoremap q<CR> :<C-u>call visualops#break_lines()<CR>
xnoremap \C :!column -t<CR>gv
xnoremap <CR> <Esc>`<mz`>mx`xa<CR><Esc>`zi<CR><Esc>=j
xnoremap \sl :sort<CR>
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>
vnoremap /c y/\V<C-R>=escape(@",'/\')<CR><CR>Ncgn
xnoremap $ $h
nnoremap <Right> :call DrillWindowOrTab(0)<CR>
nnoremap <Left> :call DrillWindowOrTab(1)<CR>
nnoremap <C-w>/ <C-w>v
nnoremap <C-w>_ <C-w>s
nnoremap <C-w>m :tab split<CR>
tnoremap <C-w>m <C-\><C-n>:tab split<CR>
nnoremap <Space>wl <C-w>l
nnoremap <Space>wh <C-w>h
nnoremap <Space>wj <C-w>j
nnoremap <Space>wk <C-w>k
nnoremap <Space>w_ <C-w>s
nnoremap <Space>w/ <C-w>v
nnoremap <Space>wd <C-w>c
nnoremap <Space>w= <C-w>=
nnoremap <Space>wr <C-w>r
nnoremap <Space>wm :tab split<CR>
nnoremap <Space>wt/ :vert Term<CR>
nnoremap <Space>wt_ :Term<CR>
nnoremap <silent> <A-w> :call searchpos('\<')<CR>
nnoremap <silent> <A-W> :call searchpos('\<', 'b')<CR>
nnoremap <Space>/ :Rg<CR>
nnoremap <Space>? :RgFromCurrentFile<CR>
let g:ctrl_d_jump = 10
nnoremap <expr> <silent> <C-d> g:ctrl_d_jump."j"
nnoremap <expr> <silent> <C-p> g:ctrl_d_jump."k"
xnoremap <expr> <silent> <C-d> g:ctrl_d_jump."j"
xnoremap <expr> <silent> <C-p> g:ctrl_d_jump."k"
nnoremap <C-c><C-d><C-a> :let ctrl_d_jump = 40<CR>
nnoremap <C-c><C-d><C-r> :let ctrl_d_jump = 20<CR>
nnoremap <C-c><C-d><C-s> :let ctrl_d_jump = 10<CR>
nnoremap <C-c><C-d><C-t> :let ctrl_d_jump = 5<CR>
nnoremap <Space>tcc :call ToggleCenterCursor()<CR>
nnoremap <expr> <Space>tch ":set cmdheight=".(&cmdheight == 1 ? '2' : '1')."\<CR>"
nnoremap <Space>tn :set number!<CR>
nnoremap <Space>tr :set relativenumber!<CR>
nnoremap <Space>tsL :set laststatus=0<CR>
nnoremap <Space>ttw0 :set textwidth=100<CR>
nnoremap <Space>ttw8 :set textwidth=80<CR>
nnoremap <Space>ttw9 :set textwidth=90<CR>
nnoremap <expr> <Space>tw &list ? ":set nolist\<CR>" : ":set list\<CR>"
nnoremap <expr> <Space>tsl ":set laststatus=".(1+(&laststatus)%2)."\<CR>"
nnoremap <expr> <Space>td ":setlocal ".(&l:diff ? "no" : "")."diff\<CR>"
nnoremap <silent> <Space>fw :w<CR>
nnoremap <expr>   <Space>fc ":lcd ".expand("%:p:h")."\<CR>"
nnoremap <expr>   <Space>fC ":cd ".expand("%:p:h")."\<CR>"
nnoremap <silent> <Space>e :call feedkeys(":e \<Tab>", 'tn')<CR>
nnoremap <silent> <Space>E :call feedkeys(":e ".expand("%:h")."/\<Tab>", 'tn')<CR>
nnoremap <silent> <Space>br :e<CR>
nnoremap <silent> <Space>bR :e!<CR>
nnoremap <silent> <Space>bN :bp<CR>
nnoremap <silent> <Space>bp :bp<CR>
nnoremap <silent> <Space>bn :bn<CR>
nnoremap <silent> <Space>bd :bp\|bd #<CR>
nnoremap <silent> <Space>bx :bp\|bw #<CR>
nnoremap <silent> <Space>b? :w !diff % -<CR>
nnoremap <silent> <Space>gs :!git status<CR>
nmap qb <Space>bb
nnoremap qn :bn<CR>
nnoremap qN :bp<CR>
nnoremap <S-Esc> :noh<CR>
nnoremap q<Tab> :noh<CR>
nnoremap q5 :noh<CR>
nnoremap q, A,<Esc>j
nnoremap q; A;<Esc>j
nnoremap q<CR> o<Esc>k
noremap <A-g> <Esc>
inoremap <A-g> <Esc>
tnoremap <A-g> <C-\><C-n>
nnoremap qj :cnext<CR>
nnoremap qk :cprevious<CR>
nnoremap q+ :botright cwindow<CR>
nnoremap <A-q> :cnext<CR>
nnoremap <A-Q> :cprevious<CR>
nnoremap q- :cclose<CR>
nnoremap <expr> <C-c><C-w> ":set bufhidden=".(&bufhidden == 'wipe' ? '' : 'wipe')."\<CR>"
