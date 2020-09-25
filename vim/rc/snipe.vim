" My personal implementation of bigram search, like evil-snipe for emacs.
" This also augments/changes some behaviors of built-in Find mappings:
"   - `t` and `f` are now allowed to wrap lines (but still not files)
"   - Find mappings now highlight all matching positions until you move the
"     cursor again
"   - `t` no longer accepts the current position as a match, it will find the
"     next match instead
"   - `fc` doesn't find inclusively in operator modes if the match for `c` is
"     at the end of the current line. This one isn't an intentional decision,
"     there just seems to be some weirdness with how the `e` flag for
"     `searchpos()` works
"   - `s` doesn't escape backslashes. This is maybe a bit opinionated but I
"     very rarely find any bigrams with backslashes, but more often I do want to
"     find the next alpha-symbol with `s\<`, so I don't handle escapes.

let g:snipe_min_highlight_length = 1

if !exists('s:snipe_highlights')
  let s:snipe_highlights = []
end
let s:snipe_just_moved = 0
let s:snipe_op = ""
let s:snipe_ops = {}
let s:snipe_query = ""
let s:count_pump = 0

function! SnipeClearMatch()
  if !s:snipe_just_moved
    for match_ix in s:snipe_highlights
      call matchdelete(match_ix)
    endfor
    let s:snipe_highlights = []
  end
  let s:snipe_just_moved = 0
endfunction

function! SnipeNext(b)
  let q = (stridx("tn", s:snipe_op)+1 ? "." : "")
        \.s:snipe_query
        \.(stridx("foTn", s:snipe_op)+1 ? "\\(.\\|$\\)" : "")
  let [w, l, c, off, vc] = getcurpos()
  let flags = "W"
        \.((stridx("SnFnTnSoToFo", s:snipe_op)>-1)-a:b ? 'b' : '')
        \.(stridx("foTn", s:snipe_op)>-1 ? "e" : "")
  call searchpos(q, flags)
  if len(s:snipe_query) >= g:snipe_min_highlight_length
    call add(s:snipe_highlights, matchadd("SnipeMatch", s:snipe_query))
  end
  let s:snipe_just_moved = 1
endfunction

function! s:PromptInput(n)
  let query = ""
  let q_len = 0
  while q_len < a:n
    let c = getchar()
    if c == 27
      return
    elseif c == 46  " '.' should be escaped
      let query .= "\\."
    else
      let query .= nr2char(c)
    end
    let q_len += 1
  endwhile
  return query
endfunction

function! Snipe(n, op)
  echo "(snipe with) "
        \."v:operator = ".v:operator
        \.", s:count_pump = ".s:count_pump
        \.", v:count = ".v:count
        \.", v:count1 = ".v:count1
  if !g:is_repeating && s:count_pump <= 0
    let query = s:PromptInput(a:n)
    if empty(query)
      return
    end
    " Remember last query on a per-operation basis
    let s:snipe_ops[v:operator."\|".a:op."\|".a:n] = query
    let s:snipe_query = query
  else
    let s:snipe_query = s:snipe_ops[v:operator."\|".a:op."\|".a:n]
    if s:count_pump > 0
      let s:count_pump -= 1
    end
  endif

  if v:count
    let s:count_pump = v:count - 1
  end

  let s:snipe_op = a:op
  call SnipeNext(0)
  if !g:is_repeating
    exec "normal! m`"
  end
endfunction

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
onoremap <silent> ; :call SnipeNext(0)<CR>
nnoremap <silent> , :call SnipeNext(1)<CR>
onoremap <silent> , :call SnipeNext(1)<CR>

augroup snipe-unhighlight
  autocmd!
  autocmd CursorMoved * :call SnipeClearMatch()
  autocmd WinLeave * :call SnipeClearMatch()
augroup END
