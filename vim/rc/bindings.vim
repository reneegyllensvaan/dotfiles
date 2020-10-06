" vim: ft=sourceonsave.vim
" Unmaps:
nnoremap <C-c> <Nop>
nnoremap <C-c><C-c> <Nop>
noremap <Space> <Nop>
noremap ZZ <Nop>
noremap ZQ <Nop>
noremap Y <Nop>
noremap q <Nop>
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
noremap <expr> Q (empty(reg_recording()) ? "q".tolower(nr2char(getchar())) : "q")

" Insert Mode:
inoremap <C-c> <Nop>
inoremap <C-c><C-s> <C-o>:w<CR>

"  Editing Commands:
nnoremap <bs> @q
nnoremap \= gg=G``
nnoremap \S :spellgood <C-r><C-w>
nnoremap \sa yiw:e ~/.vim/rc/autocorrect.vim<CR>Goiab <C-r>0 <C-r>0
nnoremap \< V`]<
nnoremap \< V`]<
nnoremap \F :Format<cr>
nnoremap \T :silent s/\<\(\w\)\(\S*\)/\u\1\L\2/g<cr>:noh<cr>
nnoremap \ff :set fdm=manual<cr>
nnoremap \fi :set fdm=indent<cr>
nnoremap \fm :set fdm=marker<cr>
nnoremap \fs :set fdm=syntax<cr>
nnoremap \fd :set fdm=diff<cr>
nnoremap # *NN
nnoremap <silent> c* *Ncgn
nnoremap <silent> c# #Ncgn
nnoremap <silent> cg* g*Ncgn
nnoremap <silent> cg# g#Ncgn
onoremap <silent> i_ :<C-u>call InsideSnake()<CR>
onoremap <silent> iA :<C-u>call InsideCapital()<CR>

" Terminal Mappings:
nnoremap <silent> <C-@> :FloatermToggle<CR>
tnoremap <silent> <C-@> <C-\><C-n>:FloatermToggle<CR>
nnoremap <silent> <C-Space> :FloatermToggle<CR>
tnoremap <silent> <C-Space> <C-\><C-n>:FloatermToggle<CR>
tnoremap <silent> <C-S> <C-W>N
tnoremap <silent> <C-b><C-n> <C-\><C-n>:FloatermNew<CR>
tnoremap <silent> <C-q> <C-\><C-n>:FloatermNew<CR>
tnoremap <silent> <C-o> <C-\><C-n>:FloatermNext<CR>
" Terminal Applications:
nnoremap <silent> <Space>as :FloatermNew! cd %:p:h<CR>
nnoremap <silent> <Space>ar :FloatermNew! cd && cd - && ranger && exit<CR>
nnoremap <silent> <Space>ag :FloatermNew! tig && exit<CR>

" Visual Mappings:
nnoremap <Space>y "+y
vnoremap <Space>y "+y
nnoremap <Space>p "+p
vnoremap <Space>p "+p
vnoremap zj <Esc>`<jm<gv
vnoremap zk <Esc>`<km<gv
vnoremap zJ <Esc>`>jm>gv
vnoremap zK <Esc>`>km>gv
vnoremap zh <Esc>`>km>`<jm<gv
vnoremap zl <Esc>`>jm>`<km<gv
vnoremap < <gv
vnoremap > >gv

" Window Mappings:
" FIXME: find something nice to do with up/down arrows
" nnoremap <Down> <C-w>j
" nnoremap <Up> <C-w>k
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
nnoremap <Space>wt/ :vert term<CR>
nnoremap <Space>wt_ :term<CR>

" Searching:
nnoremap <Space>/ :Rg<CR>
nnoremap <Space>? :FzyGrep<Space>:

" Toggles: ( / To file )
nnoremap <Space>ttw0 :set textwidth=100<CR>
nnoremap <Space>ttw9 :set textwidth=90<CR>
nnoremap <Space>ttw8 :set textwidth=80<CR>
nnoremap <Space>tf :call ToggleVExplorer()<CR>
nnoremap <Space>ta :call LoadCoc()<CR>
nnoremap <Space>ts :call ToggleSyntax()<CR>
nnoremap <Space>tA :CocDisable<CR>
nnoremap <Space>tn :set number!<CR>
nnoremap <Space>tr :set relativenumber!<CR>
nnoremap <Space>tw :set list!<CR>
nnoremap <expr> <Space>tsl ":set laststatus=".(1+(&laststatus)%2)."\<CR>"
nnoremap <Space>tsL :set laststatus=0<CR>
nnoremap <Space>tgg :call ToggleGitGutter()<CR>
nnoremap <Space>tcc :call ToggleCenterCursor()<CR>
nnoremap <Space>tcl :call ToggleCursorLine()<CR>

" Vim Actions:
nnoremap <silent> <Space>vpa :call feedkeys(":packadd \<Tab>", 'tn')<CR>
" nnoremap <silent> <Space>vee :call feedkeys(":e ~/.vim/\<Tab>", 'tn')<CR>
nnoremap <Space>ve :call vimrctools#pick_runtime_file('Edit runtime file:', ':edit ')<CR>
nnoremap <Space>vs :call vimrctools#pick_runtime_file('Source runtime file:', ':source ')<CR>
nnoremap <Space>vRR :call fzy#leader_script("vR", ":e ")<CR>
nnoremap <Space>vR/ :call fzy#leader_script("vR", ":vsp ")<CR>
nnoremap <Space>vR_ :call fzy#leader_script("vR", ":sp ")<CR>

" Bookmarks:
nnoremap <Space>;E :e ~/.vim/files/bookmarks.vim<CR>
source ~/.vim/files/bookmarks.vim

" File Actions:
nnoremap <silent> <Space>fw :w<CR>
nnoremap <silent> <C-c><C-s> :w<CR>
nnoremap <expr>   <Space>fc ":lcd ".expand("%:p:h")."\<CR>"
nnoremap <expr>   <Space>fC ":cd ".expand("%:p:h")."\<CR>"
nnoremap <silent> <Space>fy :YankFileName<CR>
nnoremap <silent> <Space>fY :YankFileName!<CR>
nnoremap <silent> <Space>ff :call fzy#in_buffer("fd . --type f", ":e ", "")<CR>
nnoremap <silent> <Space>f/ :call fzy#in_buffer("fd . --type f", ":vsp ", "")<CR>
nnoremap <silent> <Space>f_ :call fzy#in_buffer("fd . --type f", ":vsp ", "")<CR>
nnoremap <silent> <Space>fr :call fzy#leader_script("fr", ":e ")<CR>
nnoremap <silent> <Space>fd :call fzy#leader_script("fd", ":lcd ")<CR>
nnoremap <silent> <Space>lcd :call fzy#leader_script("lcd", ":lcd ~/")<CR>
nnoremap <silent> <Space>fn :call fzy#leader_script("fn", ":e ")<CR>

nnoremap <Space>lj :tabnext<CR>
nnoremap <Space>lk :tabprevious<CR>
nnoremap <Space>ln :tabnew<CR>

nnoremap <silent> <Space>e :call feedkeys(":e \<Tab>", 'tn')<CR>

" WorkMode:
nnoremap <Space>oE :e ~/workmode.vim<CR>
if !exists('g:workmode_sourced')
  nnoremap <Space>o :so ~/workmode.vim<CR>
endif


" Buffers:
nnoremap <silent> <Space>bb :call FzyBuffers(":b ")<CR>
nnoremap <silent> <Space>b/ :call FzyBuffers(":vert sb ")<CR>
nnoremap <silent> <Space>b_ :call FzyBuffers(":sb ")<CR>
nnoremap <silent> <Space>bD :call FzyBuffers(":bd ")<CR>
nnoremap <silent> <Space>fb :Buffers<CR>
nnoremap <silent> <Space>bN :bp<CR>
nnoremap <silent> <Space>bp :bp<CR>
nnoremap <silent> <Space>bn :bn<CR>
nnoremap <silent> <Space>bd :bp\|bd #<CR>
nnoremap <silent> <Space>b? :w !diff % -<CR>

" Git:
nnoremap <silent> <Space>gO :call fzy#leader_script("gO", ":!git checkout-remote-branch origin ")<CR>
nnoremap <silent> <Space>ga :call fzy#leader_script("ga", ":!git add ")<CR>
nnoremap <silent> <Space>gc :term git commit<CR>
nnoremap <silent> <Space>gf :call fzy#leader_script("gf", ":e ")<CR>
nnoremap <silent> <Space>ghO :call fzy#leader_script("ghO", ":!hub pr checkout ")<CR>
nnoremap <silent> <Space>gho :call fzy#leader_script("gho", ":!hub pr checkout ")<CR>
nnoremap <silent> <Space>ghwO :call fzy#leader_script("ghwO", ":!hub pr show ")<CR>
nnoremap <silent> <Space>ghwi :!hub browse -- issues<CR>
nnoremap <silent> <Space>ghwo :call fzy#leader_script("ghwo", ":!hub pr show ")<CR>
nnoremap <silent> <Space>ghwp :!hub browse -- pulls<CR>
nnoremap <silent> <Space>ghwr :!hub browse<CR>
nnoremap <silent> <Space>gl :FloatermNew git log<CR>
nnoremap <silent> <Space>go :call fzy#leader_script("go", ":!git checkout ")<CR>
nnoremap <silent> <Space>gs :!git status<CR>
nnoremap <silent> <Space>gb :call GitBlameLine()<CR>
nnoremap <silent> <C-c><C-b> :call GitBlameLine()<CR>
nnoremap <silent> <Space>gB :FloatermNew! cd %:p:h && tig blame %:t && exit<CR>

" Snipe Mappings:
nnoremap <silent> , :<C-u>call SnipeNext(1,"")<CR>
nnoremap <silent> ; :<C-u>call SnipeNext(0,"")<CR>
nnoremap <silent> F :<C-u>call Snipe(1, "Fn")<CR>
nnoremap <silent> S :<C-u>call Snipe(2, "Sn")<CR>
nnoremap <silent> T :<C-u>call Snipe(1, "Tn")<CR>
nnoremap <silent> f :<C-u>call Snipe(1, "fn")<CR>
nnoremap <silent> s :<C-u>call Snipe(2, "sn")<CR>
nnoremap <silent> t :<C-u>call Snipe(1, "tn")<CR>
vnoremap <silent> , :<C-u>call SnipeNext(1,"")<CR>
vnoremap <silent> ; :<C-u>call SnipeNext(0,"")<CR>
vnoremap <silent> F :<C-u>call Snipe(1, "Fnv")<CR>
vnoremap <silent> S :<C-u>call Snipe(2, "Snv")<CR>
vnoremap <silent> T :<C-u>call Snipe(1, "Tnv")<CR>
vnoremap <silent> f :<C-u>call Snipe(1, "fnv")<CR>
vnoremap <silent> s :<C-u>call Snipe(2, "snv")<CR>
vnoremap <silent> t :<C-u>call Snipe(1, "tnv")<CR>
onoremap <silent> , :<C-u>call SnipeNext(1,"")<CR>
onoremap <silent> ; :<C-u>call SnipeNext(0,"")<CR>
onoremap <silent> F :<C-u>call Snipe(1, "Fo")<CR>
onoremap <silent> S :<C-u>call Snipe(2, "So")<CR>
onoremap <silent> T :<C-u>call Snipe(1, "To")<CR>
onoremap <silent> f :<C-u>call Snipe(1, "fo")<CR>
onoremap <silent> s :<C-u>call Snipe(2, "so")<CR>
onoremap <silent> t :<C-u>call Snipe(1, "to")<CR>

" Quick Commands: (aliases)
nmap qf <Space>ff
nmap qb <Space>bb
nmap qb/ <Space>b/
nmap qb- <Space>b_
nnoremap <S-Esc> :noh<CR>
nnoremap qd :<C-u>CocList diagnostics
nnoremap q5 :noh<CR>
nnoremap q* :exec "FzyGrep ".expand("<cword>")<CR>
nnoremap q, A,<Esc>j
nnoremap <silent> qd :CocList diagnostics<CR>
