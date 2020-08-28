" Use Terminal Controls In Gui Mod
set guioptions=
echo "HASGUI"
colorscheme onedark

set guifont=Source\ Code\ Pro\ 10

hi User1 guibg=#22252b
hi User2 guibg=#98C379 guifg=black
hi User3 guibg=#22252b

let s:pattern = '^\(.* \)\([1-9][0-9]*\)$'
let s:minfontsize = 6
let s:maxfontsize = 16
function! AdjustFontSize(amount)
  if has("gui_running")
    let fontname = substitute(&guifont, s:pattern, '\1', '')
    let cursize = substitute(&guifont, s:pattern, '\2', '')
    let newsize = cursize + a:amount
    if (newsize >= s:minfontsize) && (newsize <= s:maxfontsize)
      let newfont = fontname . newsize
      let &guifont = newfont
    endif
  endif
endfunction

function! LargerFont()
  call AdjustFontSize(1)
endfunction
command! LargerFont call LargerFont()

function! SmallerFont()
  call AdjustFontSize(-1)
endfunction
command! SmallerFont call SmallerFont()

nnoremap <silent> <C-=> :call LargerFont()<CR>
nnoremap <silent> <C--> :call SmallerFont()<CR>