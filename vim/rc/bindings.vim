" Visual Mappings:
nnoremap <Space>y "+y
vnoremap <Space>y "+y
nnoremap <Space>p "+p
vnoremap <Space>p "+p

" Window Bindings:
nnoremap <Space>wl <C-w>l
nnoremap <Space>wh <C-w>h
nnoremap <Space>wj <C-w>j
nnoremap <Space>wk <C-w>k
nnoremap <Space>w- <C-w>s
nnoremap <Space>w_ <C-w>s
nnoremap <Space>w/ <C-w>v
nnoremap <Space>wd <C-w>c
nnoremap <Space>w= <C-w>=
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
nnoremap <Space>fw :w<CR>

nnoremap <Space>lj :tabnext<CR>
nnoremap <Space>lk :tabprevious<CR>
nnoremap <Space>ln :tabnew<CR>

nnoremap <silent> <Space>e :call feedkeys(":e \<Tab>", 'tn')<CR>

" WorkMode:
nnoremap <Space>o :WorkMode<CR>

nnoremap <silent> <Space>ff :call FzyCommandInBuffer("fd . --type f", ":e ", "")<CR>
nnoremap <silent> <Space>fr :call FzyScript("fr", ":e ")<CR>
nnoremap <silent> <Space>fd :call FzyScript("fd", ":lcd ")<CR>
nnoremap <silent> <Space>lcd :call FzyScript("lcd", ":lcd ~/")<CR>
nnoremap <silent> <Space>fn :call FzyScript("fn", ":e ")<CR>

" Buffers:
nnoremap <silent> <Space>bb :call FzyBuffers(":b ")<CR>
nnoremap <silent> <Space>bD :call FzyBuffers(":bd ")<CR>
nnoremap <silent> <Space>fb :Buffers<CR>
nnoremap <silent> <Space>bp :bprevious<CR>
nnoremap <silent> <Space>bn :bNext<CR>
nnoremap <silent> <Space>bd :bp\|bd #<CR>
nnoremap <silent> <Space>b? :w !diff % -<CR>

" Git:
nnoremap <silent> <Space>gs :!git status<CR>
nnoremap <silent> <Space>gc :term git commit<CR>
nnoremap <silent> <Space>gf :call FzyScript("gf", ":e ")<CR>
nnoremap <silent> <Space>ga :call FzyScript("ga", ":!git add ")<CR>
nnoremap <silent> <Space>go :call FzyScript("go", ":!git checkout ")<CR>
nnoremap <silent> <Space>gO :call FzyScript("gO", ":!git checkout-remote-branch origin ")<CR>
nnoremap <silent> <Space>gho :call FzyScript("gho", ":!hub pr checkout ")<CR>
nnoremap <silent> <Space>ghO :call FzyScript("ghO", ":!hub pr checkout ")<CR>
nnoremap <silent> <Space>ghwo :call FzyScript("ghwo", ":!hub pr show ")<CR>
nnoremap <silent> <Space>ghwO :call FzyScript("ghwO", ":!hub pr show ")<CR>

