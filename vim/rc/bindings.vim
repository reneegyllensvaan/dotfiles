" Unmaps:
nnoremap <C-c> <Nop>
nnoremap <C-c><C-c> <Nop>
noremap <Space> <Nop>
noremap ZZ <Nop>
noremap ZQ <Nop>
noremap Y <Nop>
noremap q <Nop>
noremap Q q

" Insert Mode:
inoremap <C-s><C-w> <C-o>:w<CR>

"  Editing Commands:
nnoremap <bs> @Q
nnoremap \= gg=G``
nnoremap \< V`]<
nnoremap \< V`]<
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

" Window Mappings:
nnoremap <Left> <C-w>h
nnoremap <Down> <C-w>j
nnoremap <Up> <C-w>k
nnoremap <Right> <C-w>l
nnoremap <C-w>/ <C-w>v
nnoremap <C-w>_ <C-w>s
nnoremap <C-w>m :tab split<CR>
tnoremap <C-w>m <C-\><C-n>:tab split<CR>
nnoremap <Space>wl <C-w>l
nnoremap <Space>wh <C-w>h
nnoremap <Space>wj <C-w>j
nnoremap <Space>wk <C-w>k
nnoremap <Space>w- <C-w>s
nnoremap <Space>w_ <C-w>s
nnoremap <Space>w/ <C-w>v
nnoremap <Space>wd <C-w>c
nnoremap <Space>w= <C-w>=
nnoremap <Space>wr <C-w>r
nnoremap <Space>wm :tab split<CR>
nnoremap <Space>wt/ :vert term<CR>
nnoremap <Space>wt- :term<CR>

" Searching:
nnoremap <Space>/ :RgInteractive<CR>

" Toggles: ( / To file )
nnoremap <Space>tB :e ~/.vim/rc/bindings.vim<CR>
nnoremap <Space>tV :e ~/.vim/rc/vimrc_coc.vim<CR>
nnoremap <Space>tR :call FzyScript("tR", ":e ")<CR>
nnoremap <Space>tf :call ToggleVExplorer()<CR>
nnoremap <Space>ta :call LoadCoc()<CR>
nnoremap <Space>ts :call ToggleSyntax()<CR>
nnoremap <Space>tA :CocDisable<CR>
nnoremap <Space>tn :set number!<CR>
nnoremap <Space>tr :set relativenumber!<CR>
nnoremap <Space>tw :set list!<CR>
nnoremap <Space>tcc :call ToggleCenterCursor()<CR>
nnoremap <Space>tcl :call ToggleCursorLine()<CR>

" Bookmarks:
nnoremap <Space>;E :e ~/.vim/files/bookmarks.vim<CR>
source ~/.vim/files/bookmarks.vim

" File Actions:
nnoremap <silent> <Space>fw :w<CR>
nnoremap <Space>fc :cd %:p:h<CR>
nnoremap <silent> <Space>ff :call FzyCommandInBuffer("fd . --type f", ":e ", "")<CR>
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
nnoremap <silent> <Space>b- :call FzyBuffers(":sb ")<CR>
nnoremap <silent> <Space>bD :call FzyBuffers(":bd ")<CR>
nnoremap <silent> <Space>fb :Buffers<CR>
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
nnoremap <silent> <Space>ghwo :call FzyScript("ghwo", ":!hub pr show ")<CR>
nnoremap <silent> <Space>gl :FloatermNew git log<CR>
nnoremap <silent> <Space>go :call FzyScript("go", ":!git checkout ")<CR>
nnoremap <silent> <Space>gs :!git status<CR>

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
nmap qc <Space>b/
nnoremap qd :<C-u>CocList diagnostics
nnoremap q5 :noh<CR>
nnoremap q* :call feedkeys("\<Space>/ ".expand("<cword>"), 't')<CR>
nnoremap q, A,<Down><Esc>
