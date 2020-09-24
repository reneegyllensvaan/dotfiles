" in-progress vimscript solution
" function! SurroundSelection()
"   let [startbufnum, startlnum, startcol, startoff] = getpos("'<")
"   let [endbufnum, endlnum, endcol, endoff] = getpos("'>")
"   call setline(startlnum, getline(startlnum)[0:startcol-2] . '[' . getline(startlnum)[startcol-1:endcol-1] . ']' . getline(startlnum)[endcol:1000])
" endfunction
" vnoremap <Leader>S :call SurroundSelection()<CR>

" Hacky Vmap Solution Below:
" FIXME: there's an off-by-one bug in multiline that breaks repetition
vmap S( A)<Esc>lm>`<i(<Esc>m<gv
vmap s( A)<Esc>m>`<i(<Esc>lm<gv

vmap S[ A]<Esc>lm>`<i[<Esc>m<gv
vmap s[ A]<Esc>m>`<i[<Esc>lm<gv

vmap S{ A}<Esc>lm>`<i{<Esc>m<gv
vmap s{ A}<Esc>m>`<i{<Esc>lm<gv

vmap S{ A}<Esc>lm>`<i{<Esc>m<gv
vmap s{ A}<Esc>m>`<i{<Esc>lm<gv

vmap S' A'<Esc>lm>`<i'<Esc>m<gv
vmap s' A'<Esc>m>`<i'<Esc>lm<gv
vmap S" A"<Esc>lm>`<i"<Esc>m<gv
vmap s" A"<Esc>m>`<i"<Esc>lm<gv

" Markdown:
vmap S_ A_<Esc>lm>`<i_<Esc>m<gv
vmap s_ A_<Esc>m>`<i_<Esc>lm<gv
vmap S* A*<Esc>lm>`<i*<Esc>m<gv
vmap s* A*<Esc>m>`<i*<Esc>lm<gv

" Surround Function:
vmap sf A)<Esc>`<i(<Left>

