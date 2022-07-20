" vim: ft=sourceonsave.vim fdm=marker foldlevel=0
" Idiosyncracies: {{{1
" This section contains all the weird and/or non-standard vim stuff I use. It
" should be
"
" I use C-p/C-d for longer vertical navigation, it's a more natural position
" with Mod-DH and GACS home row mods
nnoremap <C-u> <Nop>

" I've never used these two actively ('wq<C-m> is quicker anyway), would
" rather free them up for bindings
noremap ZZ <Nop>
noremap ZQ <Nop>

" The modified miryoku I use has the apostrophe in the P position; this way
" commands are on the base layer. Regular ' is moved to the Delete key, as
" it's duplicated by x. Alt also adds an external command bang.
noremap ' :
noremap <A-'> :!
noremap <Delete> '

" yy is a duplicate of Y anyway, so unbind it to make room for other
" operations
noremap Y <Nop>

" Swap `v` and `V`. This 'breaks' some stuff, or at least exposes that some
" functions expect you to use inline visual mode by default.
nnoremap v V
nnoremap V v
xnoremap v v
" 1}}}
" Unmaps: {{{1
nnoremap <C-s> <Nop>
nnoremap <C-t> <Nop>
nnoremap <C-c> <Nop>
nnoremap <C-c><C-c> <Nop>
noremap <Space> <Nop>
noremap q <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
noremap <expr> Q (empty(reg_recording()) ? "q".tolower(nr2char(getchar())) : "q")
" 1}}}
" Alt Mappings: {{{1
nnoremap <A-Up> <C-w>+
nnoremap <A-Down> <C-w>-
nnoremap <A-Left> <C-w><<C-w><
nnoremap <A-Right> <C-w>><C-w>>

xnoremap <silent> <A-Up> :move '<-2<CR>gv
xnoremap <silent> <A-Down> :move '>+1<CR>gv
inoremap <silent> <A-Up> <C-o>:<C-u>move -2<CR>
inoremap <silent> <A-Down> <C-o>:<C-u>move +1<CR>

nnoremap <M-C-d> :tabnext<CR>
nnoremap <M-C-c> :tabprevious<CR>
nnoremap <M-/> :%s///<Left><Left>
vnoremap <M-/> :s///<Left><Left>
nnoremap <expr> <M-%> getline(".")[getpos(".")[2]-1] =~# '[\[\]\{\}\(\)]' ? "v\%" : ":call editfns#around_delimiters()<CR>"
" 1}}}
" Insert Mode: {{{1
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
" 1}}}
" Microsnippets: {{{1
inoremap <C-e> <Nop>
inoremap <C-e><C-l> {<Cr>}<C-o>O
inoremap <C-e><C-y> [<Cr>]<C-o>O
inoremap <C-e><C-e> (<Cr>)<C-o>O
" inoremap <C-e><C-b> <C-o>:Macrosnippet<CR>
inoremap <M-C-e> <Space>==<Space>
inoremap <M-E> <Space>!=<Space>

inoremap <C-t><C-u> UUID

inoremap <expr> <C-c><C-i><C-u> system('insert-fake uuid')[:-2]
inoremap <expr> <C-c><C-i><C-n> system('insert-fake name')[:-3]
inoremap <expr> <C-c><C-i><C-g> system('insert-fake country')[:-3]
inoremap <expr> <C-c><C-i><C-d> system("date '+%F %H:%M'")[:-2]
inoremap <expr> <C-c><C-i>d system("date '+%F'")[:-2]
inoremap <expr> <C-c><C-i><C-t> system("date '+%s'")[:-2]
inoremap <C-c><C-i><C-b> <C-v>u2022

" Box Drawing Characters:
" Corners
inoremap <C-c><C-b><C-x> <C-v>u2517
inoremap <C-c><C-b><C-d> <C-v>u251b
inoremap <C-c><C-b><C-w> <C-v>u250f
inoremap <C-c><C-b><C-p> <C-v>u2513
" Walls
inoremap <C-c><C-b><C-f> <C-v>u2501
inoremap <C-c><C-b><C-c> <C-v>u2501
inoremap <C-c><C-b><C-r> <C-v>u2503
inoremap <C-c><C-b><C-t> <C-v>u2503
" Walls with inward line
inoremap <C-c><C-b><C-f><C-s> <C-v>u2533
inoremap <C-c><C-b><C-r><C-s> <C-v>u2523
inoremap <C-c><C-b><C-t><C-s> <C-v>u252b
inoremap <C-c><C-b><C-c><C-s> <C-v>u253b
inoremap <C-c><C-b><C-s> <C-v>u254b
"           0	1	2	3	4	5	6	7	8	9	A	B	C	D	E	F
" U+250x	─	━	│	┃	┄	┅	┆	┇	┈	┉	┊	┋	┌	┍	┎	┏
" U+251x	┐	┑	┒	┓	└	┕	┖	┗	┘	┙	┚	┛	├	┝	┞	┟
" U+252x	┠	┡	┢	┣	┤	┥	┦	┧	┨	┩	┪	┫	┬	┭	┮	┯
" U+253x	┰	┱	┲	┳	┴	┵	┶	┷	┸	┹	┺	┻	┼	┽	┾	┿
" U+254x	╀	╁	╂	╃	╄	╅	╆	╇	╈	╉	╊	╋	╌	╍	╎	╏
" U+255x	═	║	╒	╓	╔	╕	╖	╗	╘	╙	╚	╛	╜	╝	╞	╟
" U+256x	╠	╡	╢	╣	╤	╥	╦	╧	╨	╩	╪	╫	╬	╭	╮	╯

" 1}}}
"  Folding: {{{1

nnoremap <A-s> za

" Set foldmethod
nnoremap \ff :set fdm=manual<cr>
nnoremap \fi :set fdm=indent<cr>
nnoremap \fm :set fdm=marker<cr>
nnoremap \fs :set fdm=syntax<cr>
nnoremap \fd :set fdm=diff<cr>

" 1}}}
"  Editing Commands: {{{1
" Line break
nnoremap <C-j> <Esc>o
" nnoremap <C-r> "
" xnoremap <C-r> "

" Quick-fire macro
nnoremap <bs> @q

" Indentfunc whole buffer
nnoremap \= gg=G``

" Spellcheck
nnoremap \sg :spellgood <C-r><C-w>
nnoremap \sa yiw:e ~/.vim/rc/autocorrect.vim<CR>Goiab <C-r>0 <C-r>0
nnoremap <expr> <Space>ta ":setlocal ".(&l:spell ? "no" : "")."spell\<CR>"

" Keep visual selection on indent
nnoremap \< V`]<
nnoremap \> V`]>

" Format buffer (usually shells out to CoC)
nnoremap \F :Format<cr>
nnoremap \T :silent s/\<\(\w\)\(\S*\)/\u\1\L\2/g<cr>:noh<cr>

" Make `n` after `#` always search downward
nnoremap # *NN

" Y yanks rest of line; like D
nnoremap Y y$
" typing 'yi' is awkward on colemak
nnoremap <C-y> yi

" Replace word and put into search register
nnoremap <silent> c* *Ncgn
nnoremap <silent> c# #Ncgn
nnoremap <silent> cg* g*Ncgn
nnoremap <silent> cg# g#Ncgn

" Move lines. Overrides some defaults that don't matter because scrolloff=999
nnoremap gj ddp
nnoremap gk ddkP
xnoremap <silent> gj :move '>+1<CR>gv
xnoremap <silent> gk :move '<-2<CR>gv

" Toggle identifier case
nnoremap <expr> crk "ciw".editfns#to_kebab(expand("<cword>"))."\<Esc>"
nnoremap <expr> crc "ciw".editfns#to_camel(expand("<cword>"))."\<Esc>"
nnoremap <expr> crp "ciw".editfns#to_pascal(expand("<cword>"))."\<Esc>"
nnoremap <expr> crs "ciw".editfns#to_snake(expand("<cword>"))."\<Esc>"
nnoremap <expr> crS "ciw".editfns#to_upper_snake(expand("<cword>"))."\<Esc>"

nnoremap dC :call editfns#delete_function_call()<CR>

nnoremap c~ ~hi<Space><C-o>h

" TODO: Try out these approaches to make case conversion repeatable
" onoremap rc
" onoremap rp
" onoremap rs
" onoremap rS

" Extra textobjects for sub-words
onoremap <silent> i_ :<C-u>call editfns#inside_snake()<CR>
onoremap <silent> iA :<C-u>call editfns#inside_capital()<CR>
onoremap <silent> in :<C-u>call editfns#inside_name()<CR>
vnoremap <silent> in :<C-u>call editfns#inside_name()<CR>
" 1}}}
" Terminal Mode Mappings: {{{1
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
" 1}}}
" Terminal Applications: {{{1
nnoremap <silent> <Space>am :tab SingletonTerm neomutt<CR>
nnoremap <Space>ag :tab SingletonTerm tig<CR>
nnoremap <Space>af :SingletonTerm fish<CR>
nnoremap <Space>aF :vert SingletonTerm! fish<CR>
nnoremap <Space>ar :exec "SingletonTerm! ranger ".expand('%:h')<CR>
nnoremap <Space>aR :exec "vert SingletonTerm! ranger ".expand('%:h')<CR>

nnoremap <C-Space> :tab SingletonShell<CR>
nnoremap <C-@> :tab SingletonShell<CR>
nnoremap <Space>at :Term $SHELL<CR>
nnoremap <Space>aT :vert Term $SHELL<CR>
nnoremap <Space>ap :Term python<CR>
nnoremap <Space>aP :vert Term python<CR>
nnoremap <Space>a<C-t> :tab $SHELL<CR>
" 1}}}
" Visual Mappings: {{{1
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
" sort lines
xnoremap \sl :sort<CR>
" search for current selection
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>
" cgn current selection
vnoremap /c y/\V<C-R>=escape(@",'/\')<CR><CR>Ncgn
" Don't include trailing line ending on $ in visual mode
xnoremap $ $h
" 1}}}
" Window Mappings: {{{1
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
" 1}}}
" Searching And Navigation: {{{1
nnoremap <silent> <A-w> :call searchpos('\<')<CR>
nnoremap <silent> <A-W> :call searchpos('\<', 'b')<CR>
nnoremap <Space>/ :Rg<CR>
nnoremap <Space>? :RgFromCurrentFile<CR>
nnoremap <Leader>/ :call editfns#toggle_case_sensitive()<CR>
nnoremap <Leader>? :call editfns#toggle_search_direction()<CR>

let g:ctrl_d_jump = 10
nnoremap <expr> <silent> <C-d> g:ctrl_d_jump."j"
nnoremap <expr> <silent> <C-p> g:ctrl_d_jump."k"
xnoremap <expr> <silent> <C-d> g:ctrl_d_jump."j"
xnoremap <expr> <silent> <C-p> g:ctrl_d_jump."k"
nnoremap <C-c><C-d><C-a> :let ctrl_d_jump = 40<CR>
nnoremap <C-c><C-d><C-r> :let ctrl_d_jump = 20<CR>
nnoremap <C-c><C-d><C-s> :let ctrl_d_jump = 10<CR>
nnoremap <C-c><C-d><C-t> :let ctrl_d_jump = 5<CR>
" 1}}}
" Toggles: {{{1
nnoremap <Space>tcc :call ToggleCenterCursor()<CR>
nnoremap <expr> <Space>tch ":set cmdheight=".(&cmdheight == 1 ? '2' : '1')."\<CR>"
nnoremap <Space>tcl :call ToggleCursorLine()<CR>
nnoremap <Space>tf :call ToggleVExplorer()<CR>
nnoremap <Space>tgg :call ToggleGitGutter()<CR>
nnoremap <Space>tn :set number!<CR>
nnoremap <Space>tr :set relativenumber!<CR>
nnoremap <Space>tsL :set laststatus=0<CR>
nnoremap <Space>tss :call editfns#toggle_syntax()<CR>
nnoremap <Space>ttw0 :set textwidth=100<CR>
nnoremap <Space>ttw8 :set textwidth=80<CR>
nnoremap <Space>ttw9 :set textwidth=90<CR>
nnoremap <expr> <Space>tw &list ? ":set nolist\<CR>" : ":set list\<CR>"
nnoremap <expr> <Space>tsl ":set laststatus=".(1+(&laststatus)%2)."\<CR>"
nnoremap <expr> <Space>td ":setlocal ".(&l:diff ? "no" : "")."diff\<CR>"
" 1}}}
" Vim Actions: {{{1
nnoremap <silent> <Space>vh :exec "hi ".synIDattr(synID(line("."),col("."),1),"name")<CR>
nnoremap <Space>vH :TSHighlightCapturesUnderCursor<CR>
nnoremap <silent> <Space>vpa :call feedkeys(":packadd \<Tab>", 'tn')<CR>
" nnoremap <silent> <Space>vee :call feedkeys(":e ~/.vim/\<Tab>", 'tn')<CR>
nnoremap <Space>v<C-e> :call vimrctools#pick_runtime_file('Edit runtime file (vert split):', ':tabe ')<CR>
nnoremap <Space>vE :call vimrctools#pick_runtime_file('Edit runtime file (vert split):', ':vsp ')<CR>
nnoremap <Space>ve :call vimrctools#pick_runtime_file('Edit runtime file:', ':edit ')<CR>
nnoremap <Space>vs :call vimrctools#pick_runtime_file('Source runtime file:', ':source ')<CR>
nnoremap <Space>vRR :call fzy#leader_script("vR", ":e ")<CR>
nnoremap <Space>vR/ :call fzy#leader_script("vR", ":vsp ")<CR>
nnoremap <Space>vR_ :call fzy#leader_script("vR", ":sp ")<CR>
" 1}}}
" File Actions: {{{1
nnoremap <silent> <Space>fw :w<CR>
nnoremap <expr>   <Space>fc ":lcd ".expand("%:p:h")."\<CR>"
nnoremap <expr>   <Space>fC ":cd ".expand("%:p:h")."\<CR>"
nnoremap          <Space>fy :YankFileName<CR>
nnoremap          <Space>fY :YankFileName!<CR>
nnoremap          <Space>ff :FzyFindFile<CR>
nnoremap <silent> <Space>f/ :vert FzyFindFileWindow<CR>
nnoremap <silent> <Space>f_ :FzyFindFileWindow<CR>
nnoremap <silent> <Space>fr :call fzy#leader_script("fr", ":e ")<CR>
nnoremap <silent> <Space>fd :call fzy#leader_script("fd", ":lcd ")<CR>
nnoremap <silent> <Space>lcd :call fzy#leader_script("lcd", ":lcd ~/")<CR>
nnoremap <silent> <Space>fn :call fzy#leader_script("fn", ":e ")<CR>
nnoremap <silent> <Space>e :call feedkeys(":e \<Tab>", 'tn')<CR>
nnoremap <silent> <Space>E :call feedkeys(":e ".expand("%:h")."/\<Tab>", 'tn')<CR>
" 1}}}
" Module Files: {{{1
" WorkMode
nnoremap <Space>oE :e ~/.workmode.vim<CR>
nnoremap <Space>oo :so ~/.workmode.vim<CR>
nnoremap <Space>o  :so ~/.workmode.vim<CR>

" Coc
nnoremap <Space>s- :CocDisable<CR>
nnoremap <Space>s+ :call editfns#start_coc()<CR>
nnoremap <Space>S+ :source ~/.vim/rc/lsp.vim<CR>

" Bookmarks
nnoremap <Space>'E :e ~/.vim/files/bookmarks.vim<CR>
source ~/.vim/files/bookmarks.vim
" 1}}}
" Buffers: {{{1
nnoremap <silent> <Space>bb :call fzy#buffer_cmd(":b ", 0, 0)<CR>
nnoremap <silent> <Space>bB :call fzy#buffer_cmd(":b ", 1, 0)<CR>
nnoremap <silent> <Space>b/ :call fzy#buffer_cmd(":vert sb ", 0, 0)<CR>
nnoremap <silent> <Space>b_ :call fzy#buffer_cmd(":sb ", 0, 0)<CR>
nnoremap <silent> <Space>bD :call fzy#buffer_cmd(":bd ", 0, 0)<CR>
nnoremap <silent> <Space>bW :call fzy#buffer_cmd(":bwipe ",1, 0)<CR>
nnoremap <silent> <Space>br :e<CR>
nnoremap <silent> <Space>bR :e!<CR>
nnoremap <silent> <Space>fb :Buffers<CR>
nnoremap <silent> <Space>bN :bp<CR>
nnoremap <silent> <Space>bp :bp<CR>
nnoremap <silent> <Space>bn :bn<CR>
nnoremap <silent> <Space>bd :bp\|bd #<CR>
nnoremap <silent> <Space>bx :bp\|bw #<CR>
nnoremap <silent> <Space>b? :w !diff % -<CR>
" 1}}}
" Git: {{{1
nnoremap <silent> <Space>gO :call fzy#leader_script("g_o", ":!git checkout-remote-branch origin ")<CR>
nnoremap <silent> <Space>ga :call fzy#leader_script("ga", ":!git add ")<CR>
nnoremap <silent> <Space>gf :call fzy#leader_script("gf", ":e ")<CR>
nnoremap <silent> <Space>gDD :call fzy#leader_script("gf", ":!git checkout -- ")<CR>
nnoremap <silent> <Space>gz :call fzy#leader_script("gf", ":!git checkout -- ")<CR>
nnoremap <silent> <Space>ghO :call fzy#leader_script("gh_o", ":!hub pr checkout ")<CR>
nnoremap <silent> <Space>gho :call fzy#leader_script("gho", ":!hub pr checkout ")<CR>
nnoremap <silent> <Space>ghwO :call fzy#leader_script("ghw_o", ":!hub pr show ")<CR>
nnoremap <silent> <Space>ghwi :!hub browse -- issues<CR>
nnoremap <silent> <Space>ghwo :call fzy#leader_script("ghwo", ":!hub pr show ")<CR>
nnoremap <silent> <Space>ghwp :!hub browse -- pulls<CR>
nnoremap <silent> <Space>ghwr :!hub browse<CR>
nnoremap <silent> <Space>gd/ :GitDiff<CR>
nnoremap <silent> <Space>go :call fzy#leader_script("go", ":!git checkout ")<CR>
nnoremap <silent> <Space>gs :!git status<CR>
nnoremap <silent> <Space>gb :echo GitBlameLine()<CR>
nnoremap <silent> <Space>gc :Term! git commit<CR>
nnoremap <Space>g<C-l> :tab SingletonTerm git log<CR>
nnoremap <Space>gL :vert SingletonTerm git log<CR>
nnoremap <Space>gl :SingletonTerm git log<CR>
nnoremap <silent> <Space>gB :call term#singleton_run('tab', 'tig blame '.expand('%:t'), expand('%:p:h'), '')<CR>
" 1}}}
" Snipe Mappings: {{{1
nnoremap <silent> , :<C-u>call SnipeNext(1,"")<CR>
nnoremap <silent> ; :<C-u>call SnipeNext(0,"")<CR>
nnoremap <silent> F :<C-u>call Snipe(1, "Fn")<CR>
nnoremap <silent> S :<C-u>call Snipe(2, "Sn")<CR>
nnoremap <silent> T :<C-u>call Snipe(1, "Tn")<CR>
nnoremap <silent> f :<C-u>call Snipe(1, "fn")<CR>
nnoremap <silent> s :<C-u>call Snipe(2, "sn")<CR>
nnoremap <silent> t :<C-u>call Snipe(1, "tn")<CR>
xnoremap <silent> , :<C-u>call SnipeNext(1,"")<CR>
xnoremap <silent> ; :<C-u>call SnipeNext(0,"")<CR>
xnoremap <silent> F :<C-u>call Snipe(1, "Fv")<CR>
xnoremap <silent> S :<C-u>call Snipe(2, "Sv")<CR>
xnoremap <silent> T :<C-u>call Snipe(1, "Tv")<CR>
xnoremap <silent> f :<C-u>call Snipe(1, "fv")<CR>
xnoremap <silent> s :<C-u>call Snipe(2, "sv")<CR>
xnoremap <silent> t :<C-u>call Snipe(1, "tv")<CR>
onoremap <silent> , :<C-u>call SnipeNext(1,"")<CR>
onoremap <silent> ; :<C-u>call SnipeNext(0,"")<CR>
onoremap <silent> F :<C-u>call Snipe(1, "Fo")<CR>
onoremap <silent> S :<C-u>call Snipe(2, "So")<CR>
onoremap <silent> T :<C-u>call Snipe(1, "To")<CR>
onoremap <silent> f :<C-u>call Snipe(1, "fo")<CR>
onoremap <silent> s :<C-u>call Snipe(2, "so")<CR>
onoremap <silent> t :<C-u>call Snipe(1, "to")<CR>
" Snipe Mappings 1}}}
" Surround Mappings: {{{1
nnoremap cr( :call visualops#surround('()')<CR>g@iw
nnoremap cr[ :call visualops#surround('[]')<CR>g@iw
nnoremap cr{ :call visualops#surround('{}')<CR>g@iw
nnoremap cr< :call visualops#surround('<>')<CR>g@iw
nnoremap cr' :call visualops#surround("''")<CR>g@iw
nnoremap cr" :call visualops#surround('""')<CR>g@iw
nnoremap cr` :call visualops#surround('``')<CR>g@iw
nnoremap cr_ :call visualops#surround('__')<CR>g@iw
nnoremap cr* :call visualops#surround('**')<CR>g@iw
nnoremap cr<Space> :call visualops#surround('  ')<CR>g@iw
nnoremap crf viw:<C-u>call visualops#surround_selection('()', 0)<CR><Esc>`<hi
nnoremap <silent> crg viwA<><C-o>h

nnoremap cR( :call visualops#surround('()')<CR>g@iW
nnoremap cR[ :call visualops#surround('[]')<CR>g@iW
nnoremap cR{ :call visualops#surround('{}')<CR>g@iW
nnoremap cR< :call visualops#surround('<>')<CR>g@iW
nnoremap cR' :call visualops#surround("''")<CR>g@iW
nnoremap cR" :call visualops#surround('""')<CR>g@iW
nnoremap cR` :call visualops#surround('``')<CR>g@iW
nnoremap cR_ :call visualops#surround('__')<CR>g@iW
nnoremap cR* :call visualops#surround('**')<CR>g@iW
nnoremap cRf viW:<C-u>call visualops#surround_selection('()', 0)<CR><Esc>`<hi
nnoremap <silent> cRg viWA<><C-o>h

nnoremap zs( :call visualops#surround('()')<CR>g@
nnoremap zs[ :call visualops#surround('[]')<CR>g@
nnoremap zs{ :call visualops#surround('{}')<CR>g@
nnoremap zs< :call visualops#surround('<>')<CR>g@
nnoremap zs' :call visualops#surround("''")<CR>g@
nnoremap zs" :call visualops#surround('""')<CR>g@
nnoremap zs` :call visualops#surround('``')<CR>g@
nnoremap zs_ :call visualops#surround('__')<CR>g@
nnoremap zs* :call visualops#surround('**')<CR>g@
nnoremap zs<Space> :call visualops#surround('  ')<CR>g@

xnoremap s( :<C-u>call visualops#surround_selection('()', 0)<CR>
xnoremap S( :<C-u>call visualops#surround_selection('()', 1)<CR>
xnoremap s[ :<C-u>call visualops#surround_selection('[]', 0)<CR>
xnoremap S[ :<C-u>call visualops#surround_selection('[]', 1)<CR>
xnoremap s{ :<C-u>call visualops#surround_selection('{}', 0)<CR>
xnoremap S{ :<C-u>call visualops#surround_selection('{}', 1)<CR>
xnoremap s< :<C-u>call visualops#surround_selection('<>', 0)<CR>
xnoremap S< :<C-u>call visualops#surround_selection('<>', 1)<CR>
xnoremap s' :<C-u>call visualops#surround_selection("''", 0)<CR>
xnoremap S' :<C-u>call visualops#surround_selection("''", 1)<CR>
xnoremap s" :<C-u>call visualops#surround_selection('""', 0)<CR>
xnoremap S" :<C-u>call visualops#surround_selection('""', 1)<CR>
xnoremap s` :<C-u>call visualops#surround_selection('``', 0)<CR>
xnoremap S` :<C-u>call visualops#surround_selection('``', 1)<CR>
xnoremap s_ :<C-u>call visualops#surround_selection('__', 0)<CR>
xnoremap S_ :<C-u>call visualops#surround_selection('__', 1)<CR>
xnoremap s* :<C-u>call visualops#surround_selection('**', 0)<CR>
xnoremap S* :<C-u>call visualops#surround_selection('**', 1)<CR>
xnoremap s<Space> :<C-u>call visualops#surround_selection('  ', 0)<CR>
xnoremap S<Space> :<C-u>call visualops#surround_selection('  ', 1)<CR>
xnoremap sf :<C-u>call visualops#surround_selection('()', 0)<CR><Esc>`<hi
xnoremap sr( <Esc>`<r(`>r)gv
xnoremap sr[ <Esc>`<r[`>r]gv
xnoremap sr{ <Esc>`<r{`>r}gv
xnoremap sr' <Esc>`<r'`>r'gv
xnoremap sr" <Esc>`<r"`>r"gv
xnoremap sr` <Esc>`<r``>r`gv
xnoremap sr_ <Esc>`<r_`>r_gv
xnoremap sr* <Esc>`<r*`>r*gv
xnoremap sr<Space> <Esc>`<r<Space>`>r<Space>gv
xnoremap srf <Esc>`>r)`<r(i
xnoremap sr<BS> <Esc>`>x`<x<Esc>`>hm>gv
vmap srx sr<BS>
" 1}}}
" Quick Commands: (aliases) {{{1
nnoremap qf :FzyFindFile<CR>
nnoremap <M-t> :FzyFindFile<CR>
nnoremap <M-T> :vert FzyFindFileWindow<CR>
nnoremap qb :call fzy#buffer_cmd(":b ", 0, 1)<CR>
nnoremap qB :call fzy#buffer_cmd(":b ", 0, 0)<CR>
nnoremap qn :bn<CR>
nnoremap qN :bp<CR>
nnoremap <S-Esc> :noh<CR>
nnoremap q<Tab> :noh<CR>
nnoremap qd :<C-u>CocList diagnostics
nnoremap q5 :noh<CR>
nnoremap q* :exec "FzyGrep ".expand("<cword>")<CR>
nnoremap q, A,<Esc>j
nnoremap q; A;<Esc>j
nnoremap q<CR> o<Esc>k
nnoremap <silent> qd :CocList diagnostics<CR>

" Global Escape:
noremap <A-g> <Esc>
inoremap <A-g> <Esc>
tnoremap <A-g> <C-\><C-n>
" Quick Commands 1}}}
" QuickFix: (and LocList) {{{1
nnoremap qj :cnext<CR>
nnoremap qk :cprevious<CR>
nnoremap q+ :botright cwindow<CR>
nnoremap qq :ToggleQuickfix<CR>
nnoremap <A-q> :cnext<CR>
nnoremap <A-Q> :cprevious<CR>
nnoremap q- :cclose<CR>

nnoremap <Space>lj :botright lnext<CR>
nnoremap <Space>lk :botright lprevious<CR>
nnoremap <Space>ll :botright lwindow<CR>

nnoremap <A-o> :lnext<CR>
nnoremap <A-i> :lprevious<CR>

" 1}}}


" Miscellaneous Ctrl Mappings:
function! ContextAction() " {{{1
  let l:cword = expand('<cword>')
  let l:cchar = matchstr(getline('.'), '\%' . col('.') . 'c.')

  " const/let swap
      if l:cword ==# 'const'  | return "ciwlet\<Esc>"
  elseif l:cword ==# 'let' | return "ciwconst\<Esc>"
  endif

  " boolean swap
      if l:cword ==# 'True'  | return "ciwFalse\<Esc>"
  elseif l:cword ==# 'False' | return "ciwTrue\<Esc>"
  elseif l:cword ==# 'true'  | return "ciwfalse\<Esc>"
  elseif l:cword ==# 'false' | return "ciwtrue\<Esc>"
  endif

  " Cycle between box-drawing character styles
  let l:cycle_table = [
        \['┏', '╭', '╔'],
        \['┓', '╮', '╗'],
        \['┗', '╰', '╚'],
        \['┛', '╯', '╝'],
        \['┃', '┇', '║'],
        \['━', '┅', '═'],
        \]
  for l:charset in l:cycle_table
    for l:ix in range(len(l:charset))
      if l:cchar ==# l:charset[l:ix]
        return "cl".l:charset[(l:ix+1) % len(l:charset)]."\<Esc>"
      endif
    endfor
  endfor

  return "\<C-a>"
endfunction
" 1}}}
nnoremap <expr> <C-a> ContextAction()

function! TransformWord(cword)
  if a:cword =~ '^\d\{10\}$'
    !gdate -d@<cword>
  endif
endfunction
nnoremap <A-C-a> :call TransformWord("<cword>")<CR>
" idk, maybe structural editing commands? splitting/joining on expressions etc

nnoremap qt :Tags<CR>

nnoremap <C-n> <Nop>

" Ftplugin trunk:
nnoremap <C-t> <Nop>

" Calling out to external tools
nnoremap <C-c> <Nop>
nnoremap <silent> <C-c><C-c> :w<CR>:Make<CR>
nnoremap <expr> <C-c><C-r> ":Rename ".expand("%:t")
nnoremap <C-c><C-b> :echo GitBlameLine()<CR>
nnoremap <C-c>b :echo GitBlameLineFull()<CR>
nnoremap <expr> <C-c><C-w> ":set bufhidden=".(&bufhidden == 'wipe' ? '' : 'wipe')."\<CR>"

" Actions
nnoremap <C-s> <Nop>
nnoremap <silent> <C-s><C-t> :w<CR>
nnoremap <silent> <C-s><C-f> :Format<CR>
