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
noremap Q q

" Insert Mode:
inoremap <C-s><C-w> <C-o>:w<CR>

"  Editing Commands:
nnoremap <bs> @Q
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
nnoremap <Space>wt- :term<CR>

" Searching:
nnoremap <Space>/ :Rg<CR>
nnoremap <Space>? :FzyGrep<Space>:

" Toggles: ( / To file )
nnoremap <Space>ttw0 :set textwidth=100<CR>
nnoremap <Space>ttw9 :set textwidth=90<CR>
nnoremap <Space>ttw8 :set textwidth=80<CR>
nnoremap <Space>tRR :call FzyScript("tR", ":e ")<CR>
nnoremap <Space>tR/ :call FzyScript("tR", ":vsp ")<CR>
nnoremap <Space>tR_ :call FzyScript("tR", ":sp ")<CR>
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
nnoremap <Space>vsf :so %<CR>
nnoremap <Space>vsv :so ~/.vimrc<CR>
nnoremap <Space>vev :e ~/.vimrc<CR>
nnoremap <silent> <Space>vee :call feedkeys(":e ~/.vim/\<Tab>", 'tn')<CR>
nnoremap <Space>vsb :so ~/.vim/rc/bindings.vim<CR>
nnoremap <Space>vsc :so ~/.vim/rc/coc.vim<CR>
nnoremap <Space>vsC :so ~/.vim/rc/commands.vim<CR>
nnoremap <Space>vsF :so ~/.vim/rc/fzy.vim<CR>
nnoremap <Space>vsG :so ~/.vim/rc/golden.vim<CR>
nnoremap <Space>vsg :so ~/.vim/rc/gvimrc.vim<CR>
nnoremap <Space>vsl :so ~/.vim/rc/look_and_feel.vim<CR>
nnoremap <Space>vss :so ~/.vim/rc/snipe.vim<CR>
nnoremap <Space>vs<Space> :so ~/.vim/rc/space.vim<CR>
nnoremap <Space>vsS :so ~/.vim/rc/surround.vim<CR>
nnoremap <Space>vsto :so ~/.vim/rc/textobject.vim<CR>
nnoremap <Space>veb :e ~/.vim/rc/bindings.vim<CR>
nnoremap <Space>vea :e ~/.vim/rc/autocorrect.vim<CR>
nnoremap <Space>vec :e ~/.vim/rc/coc.vim<CR>
nnoremap <Space>veC :e ~/.vim/rc/commands.vim<CR>
nnoremap <Space>veF :e ~/.vim/rc/fzy.vim<CR>
nnoremap <Space>veG :e ~/.vim/rc/golden.vim<CR>
nnoremap <Space>veg :e ~/.vim/rc/gvimrc.vim<CR>
nnoremap <Space>vel :e ~/.vim/rc/look_and_feel.vim<CR>
nnoremap <Space>ves :e ~/.vim/rc/snipe.vim<CR>
nnoremap <Space>ve<Space> :e ~/.vim/rc/space.vim<CR>
nnoremap <Space>veS :e ~/.vim/rc/surround.vim<CR>
nnoremap <Space>veto :e ~/.vim/rc/textobject.vim<CR>

" Bookmarks:
nnoremap <Space>;E :e ~/.vim/files/bookmarks.vim<CR>
source ~/.vim/files/bookmarks.vim

" File Actions:
nnoremap <silent> <Space>fw :w<CR>
nnoremap <silent> <C-c><C-s> :w<CR>
nnoremap <Space>fc :cd %:p:h<CR>
nnoremap <silent> <Space>ff :call FzyCommandInBuffer("fd . --type f", ":e ", "")<CR>
nnoremap <silent> <Space>f/ :call FzyCommandInBuffer("fd . --type f", ":vsp ", "")<CR>
nnoremap <silent> <Space>f_ :call FzyCommandInBuffer("fd . --type f", ":vsp ", "")<CR>
nnoremap <silent> <Space>fr :call FzyScript("fr", ":e ")<CR>
nnoremap <silent> <Space>fd :call FzyScript("fd", ":lcd ")<CR>
nnoremap <silent> <Space>lcd :call FzyScript("lcd", ":lcd ~/")<CR>
nnoremap <silent> <Space>fn :call FzyScript("fn", ":e ")<CR>

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
nnoremap <silent> <Space>gO :call FzyScript("gO", ":!git checkout-remote-branch origin ")<CR>
nnoremap <silent> <Space>ga :call FzyScript("ga", ":!git add ")<CR>
nnoremap <silent> <Space>gc :term git commit<CR>
nnoremap <silent> <Space>gf :call FzyScript("gf", ":e ")<CR>
nnoremap <silent> <Space>ghO :call FzyScript("ghO", ":!hub pr checkout ")<CR>
nnoremap <silent> <Space>gho :call FzyScript("gho", ":!hub pr checkout ")<CR>
nnoremap <silent> <Space>ghwO :call FzyScript("ghwO", ":!hub pr show ")<CR>
nnoremap <silent> <Space>ghwi :!hub browse -- issues<CR>
nnoremap <silent> <Space>ghwo :call FzyScript("ghwo", ":!hub pr show ")<CR>
nnoremap <silent> <Space>ghwp :!hub browse -- pulls<CR>
nnoremap <silent> <Space>ghwr :!hub browse<CR>
nnoremap <silent> <Space>gl :FloatermNew git log<CR>
nnoremap <silent> <Space>go :call FzyScript("go", ":!git checkout ")<CR>
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
nnoremap q, A,<Down><Esc>
nnoremap <silent> qd :CocList diagnostics<CR>
