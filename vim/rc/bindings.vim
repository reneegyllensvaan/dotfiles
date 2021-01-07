" vim: ft=sourceonsave.vim fdm=marker foldlevel=0
" Unmaps: {{{
nnoremap <C-c> <Nop>
nnoremap <C-u> <Nop>
nnoremap <C-c><C-c> <Nop>
nnoremap <C-a> <Nop>
noremap <Space> <Nop>
noremap ZZ <Nop>
noremap ZQ <Nop>
noremap Y <Nop>
noremap q <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
noremap <expr> Q (empty(reg_recording()) ? "q".tolower(nr2char(getchar())) : "q")
nnoremap <C-a><C-a> <C-a>
" Unmaps }}}

" Alt Mappings: {{{
nnoremap <A-Up> <C-w>+
nnoremap <A-Down> <C-w>-
nnoremap <A-Left> <C-w><<C-w><
nnoremap <A-Right> <C-w>><C-w>>

vnoremap <silent> <A-Up> :move '<-2<CR>gv
vnoremap <silent> <A-Down> :move '>+1<CR>gv
inoremap <silent> <A-Up> <C-o>:<C-u>move -2<CR>
inoremap <silent> <A-Down> <C-o>:<C-u>move +1<CR>
" Alt Mappings }}}

" Insert Mode: {{{
inoremap <C-p> <Nop>

inoremap <C-c> <Nop>
inoremap <C-c><C-s> <C-o>:w<CR>
inoremap <expr> <C-c><C-i><C-u> system('insert-fake uuid')[:-2]
inoremap <expr> <C-c><C-i><C-n> system('insert-fake name')[:-3]
inoremap <expr> <C-c><C-i><C-g> system('insert-fake country')[:-3]
" Insert Mode }}}

" Microsnippets: {{{
inoremap <C-n> <Nop>
inoremap <C-n><C-u> {<Cr>}<C-o>O
inoremap <C-n><C-e> [<Cr>]<C-o>O
inoremap <C-n><C-y> (<Cr>)<C-o>O

"
imap <buffer> <C-t><C-a> <Space>=><Space>
imap <buffer> <C-t><C-m> ()<Space>=><Space>
" Microsnippets }}}


"  G Command Overrides:
" Note: many of these are useful for moving the window's view of the buffer. I
" always keep my cursor centered using a high scrolloff, so I'm overriding
" many of these because I don't use the default mapping anyway


"  Editing Commands: {{{
" Line break
nnoremap <C-j> <CR>

" Quick-fire macro
nnoremap <bs> @q

" Indentfunc whole buffer
nnoremap \= gg=G``

" Spellcheck
nnoremap \S :spellgood <C-r><C-w>
nnoremap \sa yiw:e ~/.vim/rc/autocorrect.vim<CR>Goiab <C-r>0 <C-r>0
nnoremap <expr> <Space>ta ":setlocal ".(&l:spell ? "no" : "")."spell\<CR>"

" Keep visual selection on indent
nnoremap \< V`]<
nnoremap \> V`]>

" Format buffer (usually shells out to CoC)
nnoremap \F :Format<cr>
nnoremap \T :silent s/\<\(\w\)\(\S*\)/\u\1\L\2/g<cr>:noh<cr>

" Foldmethod
nnoremap \ff :set fdm=manual<cr>
nnoremap \fi :set fdm=indent<cr>
nnoremap \fm :set fdm=marker<cr>
nnoremap \fs :set fdm=syntax<cr>
nnoremap \fd :set fdm=diff<cr>

" Make `n` after `#` always search downward
nnoremap # *NN

" Replace word and put into search register
nnoremap <silent> c* *Ncgn
nnoremap <silent> c# #Ncgn
nnoremap <silent> cg* g*Ncgn
nnoremap <silent> cg# g#Ncgn

" Move lines. Overrides some defaults that don't matter because scrolloff=999
nnoremap gj ddp
nnoremap gk ddkP

" Toggle identifier case
nnoremap <expr> crc "ciw".myfns#to_camel(expand("<cword>"))."\<Esc>"
nnoremap <expr> crp "ciw".myfns#to_pascal(expand("<cword>"))."\<Esc>"
nnoremap <expr> crs "ciw".myfns#to_snake(expand("<cword>"))."\<Esc>"
nnoremap <expr> crS "ciw".myfns#to_upper_snake(expand("<cword>"))."\<Esc>"

" TODO: Try out these approaches to make case conversion repeatable
" onoremap rc
" onoremap rp
" onoremap rs
" onoremap rS

" Extra textobjects for sub-words
onoremap <silent> i_ :<C-u>call myfns#inside_snake()<CR>
onoremap <silent> iA :<C-u>call myfns#inside_capital()<CR>
" Editing Commands }}}

" Terminal Mode Mappings: {{{
tnoremap <silent> <C-v> <C-\><C-n>:call term_sendkeys(bufnr(), getreg(nr2char(getchar())))<CR>
tnoremap <silent> <C-s> <C-W>N
if has('nvim')
  tnoremap <silent> <C-w>N <C-\><C-n>
  tnoremap <silent> <C-s> <C-\><C-n>
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
" Terminal Mode Mappings }}}

" Terminal Applications: {{{
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
nnoremap <Space>a<C-t> :tab $SHELL<CR>
" Terminal Applications }}}

" Visual Mappings: {{{
nnoremap <Space>y "+y
vnoremap <Space>y "+y
nnoremap <Space>p "+p
vnoremap <Space>p "+p
vnoremap zj <Esc>`<mz`>mx`zjm<`xm>gv
vnoremap zk <Esc>`<mz`>mx`zkm<`xm>gv
vnoremap zJ <Esc>`<mz`>mx`xjm>`zm<gv
vnoremap zK <Esc>`<mz`>mx`xkm>`zm<gv
vnoremap zh <Esc>`<mz`>mx`zkm<`xjm>gv
vnoremap zl <Esc>`<mz`>mx`zjm<`xkm>gv
vnoremap < <gv
vnoremap > >gv
vnoremap q<CR> :<C-u>call visualops#break_lines()<CR>
vnoremap \C :!column -t<cr>
vnoremap <CR> <Esc>`>a<CR><Esc>m>`<i<CR><Esc>==
vnoremap \sl :sort<CR>
" Visual Mappings }}}

" Window Mappings: {{{
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
" Window Mappings }}}

" Searching And Navigation: {{{
nnoremap <Space>/ :Rg<CR>
nnoremap <Space>? :RgFromCurrentFile<CR>
nnoremap <Leader>/ :call myfns#toggle_case_sensitive()<CR>
nnoremap <Leader>? :call myfns#toggle_search_direction()<CR>

let g:ctrl_d_jump = 10
nnoremap <expr> <silent> <C-d> g:ctrl_d_jump."j"
nnoremap <expr> <silent> <C-p> g:ctrl_d_jump."k"
vnoremap <expr> <silent> <C-d> g:ctrl_d_jump."j"
vnoremap <expr> <silent> <C-p> g:ctrl_d_jump."k"
nnoremap <C-c><C-d><C-a> :let ctrl_d_jump = 40<CR>
nnoremap <C-c><C-d><C-r> :let ctrl_d_jump = 20<CR>
nnoremap <C-c><C-d><C-s> :let ctrl_d_jump = 10<CR>
nnoremap <C-c><C-d><C-t> :let ctrl_d_jump = 5<CR>
" Searching And Navigation }}}

" Toggles: ( / To file ) {{{
nnoremap <Space>tcc :call ToggleCenterCursor()<CR>
nnoremap <Space>tcl :call ToggleCursorLine()<CR>
nnoremap <Space>tf :call ToggleVExplorer()<CR>
nnoremap <Space>tgg :call ToggleGitGutter()<CR>
nnoremap <Space>tn :set number!<CR>
nnoremap <Space>tr :set relativenumber!<CR>
nnoremap <Space>tsL :set laststatus=0<CR>
nnoremap <Space>tss :call myfns#toggle_syntax()<CR>
nnoremap <Space>ttw0 :set textwidth=100<CR>
nnoremap <Space>ttw8 :set textwidth=80<CR>
nnoremap <Space>ttw9 :set textwidth=90<CR>
nnoremap <Space>tw :set list!<CR>
nnoremap <expr> <Space>tsl ":set laststatus=".(1+(&laststatus)%2)."\<CR>"
nnoremap <expr> <Space>td ":setlocal ".(&l:diff ? "no" : "")."diff\<CR>"
" Toggles }}}

" Vim Actions: {{{
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
" Vim Actions }}}

" File Actions: {{{
nnoremap <silent> <Space>fw :w<CR>
nnoremap <silent> <C-c><C-s> :w<CR>
nnoremap <expr>   <Space>fc ":lcd ".expand("%:p:h")."\<CR>"
nnoremap <expr>   <Space>fC ":cd ".expand("%:p:h")."\<CR>"
nnoremap <silent> <Space>fy :YankFileName<CR>
nnoremap <silent> <Space>fY :YankFileName!<CR>
nnoremap <Space>ff :call fzy#in_buffer("fd . --type f", ":e ", "")<CR>
nnoremap <silent> <Space>f/ :call fzy#in_buffer("fd . --type f", ":vsp ", "")<CR>
nnoremap <silent> <Space>f_ :call fzy#in_buffer("fd . --type f", ":vsp ", "")<CR>
nnoremap <silent> <Space>fr :call fzy#leader_script("fr", ":e ")<CR>
nnoremap <silent> <Space>fd :call fzy#leader_script("fd", ":lcd ")<CR>
nnoremap <silent> <Space>lcd :call fzy#leader_script("lcd", ":lcd ~/")<CR>
nnoremap <silent> <Space>fn :call fzy#leader_script("fn", ":e ")<CR>

nnoremap <silent> <Space>e :call feedkeys(":e \<Tab>", 'tn')<CR>
nnoremap <silent> <Space>E :call feedkeys(":e %:h\<Tab>", 'tn')<CR>
" File Actions }}}

" Hooks For External Files: {{{
" WorkMode
nnoremap <Space>oE :e ~/workmode.vim<CR>
nnoremap <Space>oo :so ~/workmode.vim<CR>
nnoremap <Space>o  :so ~/workmode.vim<CR>

" Coc
nnoremap <Space>s- :CocDisable<CR>
nnoremap <Space>s+ :call myfns#start_coc()<CR>

" Bookmarks
nnoremap <Space>;E :e ~/.vim/files/bookmarks.vim<CR>
source ~/.vim/files/bookmarks.vim
" Hooks For External Files }}}

" Buffers:
nnoremap <silent> <Space>bb :call fzy#buffer_cmd(":b ", 0)<CR>
nnoremap <silent> <Space>bB :call fzy#buffer_cmd(":b ", 1)<CR>
nnoremap <silent> <Space>b/ :call fzy#buffer_cmd(":vert sb ",0)<CR>
nnoremap <silent> <Space>b_ :call fzy#buffer_cmd(":sb ",0)<CR>
nnoremap <silent> <Space>bD :call fzy#buffer_cmd(":bd ",0)<CR>
nnoremap <silent> <Space>bW :call fzy#buffer_cmd(":bwipe ",1)<CR>
nnoremap <silent> <Space>br :e<CR>
nnoremap <silent> <Space>bR :e!<CR>
nnoremap <silent> <Space>fb :Buffers<CR>
nnoremap <silent> <Space>bN :bp<CR>
nnoremap <silent> <Space>bp :bp<CR>
nnoremap <silent> <Space>bn :bn<CR>
nnoremap <silent> <Space>bd :bp\|bd #<CR>
nnoremap <silent> <Space>bx :bp\|bw #<CR>
nnoremap <silent> <Space>b? :w !diff % -<CR>

" Git:
nnoremap <silent> <Space>gO :call fzy#leader_script("gO", ":!git checkout-remote-branch origin ")<CR>
nnoremap <silent> <Space>ga :call fzy#leader_script("ga", ":!git add ")<CR>
nnoremap <silent> <Space>gf :call fzy#leader_script("gf", ":e ")<CR>
nnoremap <silent> <Space>gDD :call fzy#leader_script("gf", ":!git checkout -- ")<CR>
nnoremap <silent> <Space>gz :call fzy#leader_script("gf", ":!git checkout -- ")<CR>
nnoremap <silent> <Space>ghO :call fzy#leader_script("ghO", ":!hub pr checkout ")<CR>
nnoremap <silent> <Space>gho :call fzy#leader_script("gho", ":!hub pr checkout ")<CR>
nnoremap <silent> <Space>ghwO :call fzy#leader_script("ghwO", ":!hub pr show ")<CR>
nnoremap <silent> <Space>ghwi :!hub browse -- issues<CR>
nnoremap <silent> <Space>ghwo :call fzy#leader_script("ghwo", ":!hub pr show ")<CR>
nnoremap <silent> <Space>ghwp :!hub browse -- pulls<CR>
nnoremap <silent> <Space>ghwr :!hub browse<CR>
nnoremap <silent> <Space>go :call fzy#leader_script("go", ":!git checkout ")<CR>
nnoremap <silent> <Space>gs :!git status<CR>
nnoremap <silent> <Space>gb :call GitBlameLine()<CR>
nnoremap <silent> <Space>gc :Term! git commit<CR>
nnoremap <Space>g<C-l> :tab SingletonTerm git log<CR>
nnoremap <Space>gL :vert SingletonTerm git log<CR>
nnoremap <Space>gl :SingletonTerm git log<CR>
nnoremap <silent> <C-c><C-b> :call GitBlameLine()<CR>
nnoremap <silent> <Space>gB :call term#singleton_run('tab', 'tig blame '.expand('%:t'), expand('%:p:h'), '')<CR>

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
vnoremap <silent> F :<C-u>call Snipe(1, "Fv")<CR>
vnoremap <silent> S :<C-u>call Snipe(2, "Sv")<CR>
vnoremap <silent> T :<C-u>call Snipe(1, "Tv")<CR>
vnoremap <silent> f :<C-u>call Snipe(1, "fv")<CR>
vnoremap <silent> s :<C-u>call Snipe(2, "sv")<CR>
vnoremap <silent> t :<C-u>call Snipe(1, "tv")<CR>
onoremap <silent> , :<C-u>call SnipeNext(1,"")<CR>
onoremap <silent> ; :<C-u>call SnipeNext(0,"")<CR>
onoremap <silent> F :<C-u>call Snipe(1, "Fo")<CR>
onoremap <silent> S :<C-u>call Snipe(2, "So")<CR>
onoremap <silent> T :<C-u>call Snipe(1, "To")<CR>
onoremap <silent> f :<C-u>call Snipe(1, "fo")<CR>
onoremap <silent> s :<C-u>call Snipe(2, "so")<CR>
onoremap <silent> t :<C-u>call Snipe(1, "to")<CR>

" Surround Mappings:
nnoremap cr( :call visualops#surround('()')<CR>g@iw
nnoremap cr[ :call visualops#surround('[]')<CR>g@iw
nnoremap cr{ :call visualops#surround('{}')<CR>g@iw
nnoremap cr< :call visualops#surround('<>')<CR>g@iw
nnoremap cr' :call visualops#surround("''")<CR>g@iw
nnoremap cr" :call visualops#surround('""')<CR>g@iw
nnoremap cr` :call visualops#surround('``')<CR>g@iw
nnoremap cr_ :call visualops#surround('__')<CR>g@iw
nnoremap cr* :call visualops#surround('**')<CR>g@iw
nnoremap crf viw:<C-u>call visualops#surround_selection('()', 0)<CR><Esc>`<hi
nnoremap <silent> crg viwA<><C-o>h

nnoremap zs( :call visualops#surround('()')<CR>g@
nnoremap zs[ :call visualops#surround('[]')<CR>g@
nnoremap zs{ :call visualops#surround('{}')<CR>g@
nnoremap zs< :call visualops#surround('<>')<CR>g@
nnoremap zs' :call visualops#surround("''")<CR>g@
nnoremap zs" :call visualops#surround('""')<CR>g@
nnoremap zs` :call visualops#surround('``')<CR>g@
nnoremap zs_ :call visualops#surround('__')<CR>g@
nnoremap zs* :call visualops#surround('**')<CR>g@

vnoremap s( :<C-u>call visualops#surround_selection('()', 0)<CR>
vnoremap S( :<C-u>call visualops#surround_selection('()', 1)<CR>
vnoremap s[ :<C-u>call visualops#surround_selection('[]', 0)<CR>
vnoremap S[ :<C-u>call visualops#surround_selection('[]', 1)<CR>
vnoremap s{ :<C-u>call visualops#surround_selection('{}', 0)<CR>
vnoremap S{ :<C-u>call visualops#surround_selection('{}', 1)<CR>
vnoremap s< :<C-u>call visualops#surround_selection('<>', 0)<CR>
vnoremap S< :<C-u>call visualops#surround_selection('<>', 1)<CR>
vnoremap s' :<C-u>call visualops#surround_selection("''", 0)<CR>
vnoremap S' :<C-u>call visualops#surround_selection("''", 1)<CR>
vnoremap s" :<C-u>call visualops#surround_selection('""', 0)<CR>
vnoremap S" :<C-u>call visualops#surround_selection('""', 1)<CR>
vnoremap s` :<C-u>call visualops#surround_selection('``', 0)<CR>
vnoremap S` :<C-u>call visualops#surround_selection('``', 1)<CR>
vnoremap s_ :<C-u>call visualops#surround_selection('__', 0)<CR>
vnoremap S_ :<C-u>call visualops#surround_selection('__', 1)<CR>
vnoremap s* :<C-u>call visualops#surround_selection('**', 0)<CR>
vnoremap S* :<C-u>call visualops#surround_selection('**', 1)<CR>
vnoremap sf :<C-u>call visualops#surround_selection('()', 0)<CR><Esc>`<hi
vnoremap sr( <Esc>`<r(`>r)gv
vnoremap sr[ <Esc>`<r[`>r]gv
vnoremap sr{ <Esc>`<r{`>r}gv
vnoremap sr' <Esc>`<r'`>r'gv
vnoremap sr" <Esc>`<r"`>r"gv
vnoremap sr` <Esc>`<r``>r`gv
vnoremap sr_ <Esc>`<r_`>r_gv
vnoremap sr* <Esc>`<r*`>r*gv
vnoremap srf <Esc>`>r)`<r(i
vnoremap sr<BS> <Esc>`>x`<x<Esc>`>hm>gv
vmap srx sr<BS>


" Quick Commands: (aliases)
nmap qf <Space>ff
nmap qb <Space>bb
nnoremap qn :bn<CR>
nnoremap qN :bp<CR>
nnoremap <S-Esc> :noh<CR>
nnoremap q<Tab> :noh<CR>
nnoremap qd :<C-u>CocList diagnostics
nnoremap q5 :noh<CR>
nnoremap q* :exec "FzyGrep ".expand("<cword>")<CR>
nnoremap q, A,<Esc>j
nnoremap q; A;<Esc>j
nnoremap <silent> qd :CocList diagnostics<CR>

" QuickFix:
nnoremap qj :botright cnext<CR>
nnoremap qk :botright cprevious<CR>
nnoremap q+ :botright cwindow<CR>

" Arborist Mappings:
nnoremap <C-s> <Nop>
nnoremap <C-t> <Nop>
nnoremap <C-s><C-t> :w<CR>

