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

let g:snipe_min_highlight_length = 2

let s:snipe_just_moved = 0
let s:snipe_op = ""
let s:snipe_ops = {}
let s:snipe_query = ""
let s:count_pump = 0

function! SnipeClearMatch()
  if !exists('w:snipe_highlights')
    let w:snipe_highlights = []
  end
  if !s:snipe_just_moved
    for match_ix in w:snipe_highlights
      call matchdelete(match_ix)
    endfor
    let w:snipe_highlights = []
  end
  let s:snipe_just_moved = 0
endfunction

function! SnipeNext(b,flags)
  let ignorecase_previous = &ignorecase
  set noignorecase
  let q = (stridx("tntv", s:snipe_op)+1 ? "." : "")
        \.s:snipe_query
        \.(stridx("foTn", s:snipe_op)+1 ? "\\(.\\|$\\)" : "")
  let flags = "W"
        \.((stridx("SnFnTnSoToFoSvFvTv", s:snipe_op)>-1)-a:b ? 'b' : '')
        \.(stridx("foTn", s:snipe_op)>-1 ? "e" : "")
  if (stridx(s:snipe_op, "v")>-1) | exec "normal! gv" | endif
  call search(q, flags)
  if len(s:snipe_query) >= g:snipe_min_highlight_length
    if !exists('w:snipe_highlights')
      let w:snipe_highlights = []
    end
    call add(w:snipe_highlights, matchadd("SnipeMatch", s:snipe_query))
  end
  let s:snipe_just_moved = 1
  let &ignorecase = ignorecase_previous
endfunction

function! s:PromptInput(n)
  let query = ""
  let q_len = 0
  while q_len < a:n
    let c = nr2char(getchar())
    if c == 27 | return | end
    let query .= (stridx(".$", c)+1 ? "\\" : "").c
    let q_len += 1
  endwhile
  return query
endfunction

function! Snipe(n, op) abort
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
  normal! m'
  call SnipeNext(0, g:is_repeating?'':'s')
endfunction

augroup snipe-unhighlight
  autocmd!
  autocmd CursorMoved * :call SnipeClearMatch()
  autocmd CursorMovedI * :call SnipeClearMatch()
  autocmd WinLeave * :call SnipeClearMatch()
augroup END
