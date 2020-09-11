let g:snipe_min_highlight_length = 1

if !exists('s:snipe_highlights')
  let s:snipe_highlights = []
end
let s:snipe_just_moved = 0
let s:snipe_op = ""
let s:snipe_query = ""
let s:snipe_t_mode = 0

function! SnipeClearMatch()
  if !s:snipe_just_moved
    for match_ix in s:snipe_highlights
      call matchdelete(match_ix)
    endfor
    let s:snipe_highlights = []
  end
  let s:snipe_just_moved = 0
endfunction

" Changes this makes:
"   - `t` never matches current position
"   - `t` and `f` match across lines
function! SnipeNext(b)
  let q = (stridx("tn", s:snipe_op)+1 ? "." : "")
        \.s:snipe_query
        \.(stridx("fo", s:snipe_op)>-1 ? "\\(.\\|$\\)" : "")
  let [w, l, c, off, vc] = getcurpos()
  let flags = "W"
        \.((stridx("SnFnTnSoToFo", s:snipe_op)>-1)-a:b ? 'b' : '')
        \.(stridx("fo", s:snipe_op)>-1 ? "e" : "")
  call searchpos(q, flags)
  if len(s:snipe_query) >= g:snipe_min_highlight_length
    call add(s:snipe_highlights, matchadd("SnipeMatch", s:snipe_query))
  end
  let s:snipe_just_moved = 1
  echo flags." :: snipe ".(s:snipe_op).(flags=~"b"?' <- <':' -> <').q.'>'
endfunction

hi SnipeMatch guibg=cyan guifg=black

function! Snipe(n, op)
  let query = ""
  while len(query) < a:n
    let c = getchar()
    if c == 27
      return
    elseif c == 46  " '.' should be escaped
      let query .= "\\."
    else
      let query .= nr2char(c)
    end
  endwhile

  let s:snipe_query = query
  let s:snipe_op = a:op
  call SnipeNext(0)
  exec "normal m`"
endfunctio

" (number, backward, til, op)

nnoremap <silent> s :call Snipe(2, "sn")<CR>
nnoremap <silent> S :call Snipe(2, "Sn")<CR>
nnoremap <silent> f :call Snipe(1, "fn")<CR>
nnoremap <silent> F :call Snipe(1, "Fn")<CR>
nnoremap <silent> t :call Snipe(1, "tn")<CR>
nnoremap <silent> T :call Snipe(1, "Tn")<CR>

onoremap <silent> s :call Snipe(2, "so")<CR>
onoremap <silent> S :call Snipe(2, "So")<CR>
onoremap <silent> f :call Snipe(1, "fo")<CR>
onoremap <silent> F :call Snipe(1, "Fo")<CR>
onoremap <silent> t :call Snipe(1, "to")<CR>
onoremap <silent> T :call Snipe(1, "To")<CR>

nnoremap <silent> ; :call SnipeNext(0)<CR>
nnoremap <silent> , :call SnipeNext(1)<CR>

augroup snipe-unhighlight
  autocmd!
  autocmd CursorMoved * :call SnipeClearMatch()
  autocmd WinLeave * :call SnipeClearMatch()
augroup END
