if !exists('s:snipe_highlights')
  let s:snipe_highlights = []
end
let s:snipe_just_moved = 0
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

function! SnipeNext(b, op)
  let t = s:snipe_t_mode
  let q = ((a:op && !t && !a:b) || (t && !a:b) ? "\\(.\\|$\\)" : "")
        \.s:snipe_query.((a:op && !t) || (t && a:b) ? "\\(.\\|$\\)" : "")
  let [w, l, c, off, vc] = getcurpos()
  let flags = "W".(a:b ? 'b' : '').((a:op && !a:b) || (t && a:b) ? "e" : "")
  call searchpos(q, flags)
  call add(s:snipe_highlights, matchadd("SnipeMatch", s:snipe_query))
  let s:snipe_just_moved = 1
  echo flags." :: snipe ".(t?"t ":"").(a:b?'<- <':'-> <').q.'>'
endfunction

hi SnipeMatch guibg=cyan guifg=black

function! Snipe(n, b, t, op)
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
  let s:snipe_t_mode = a:t
  call SnipeNext(a:b, a:op)
  exec "normal m`"
endfunction

" (number, backward, til, op)
nnoremap <silent> s :call Snipe(2, 0, 0, 0)<CR>
onoremap <silent> s :call Snipe(2, 0, 0, 1)<CR>

nnoremap <silent> S :call Snipe(2, 1, 0, 0)<CR>
onoremap <silent> S :call Snipe(2, 1, 0, 1)<CR>

nnoremap <silent> f :call Snipe(1, 0, 0, 0)<CR>
onoremap <silent> f :call Snipe(1, 0, 0, 1)<CR>

nnoremap <silent> F :call Snipe(1, 1, 0, 0)<CR>
onoremap <silent> F :call Snipe(1, 1, 0, 1)<CR>

nnoremap <silent> t :call Snipe(1, 0, 1, 0)<CR>
onoremap <silent> t :call Snipe(1, 0, 1, 1)<CR>

nnoremap <silent> T :call Snipe(1, 1, 1, 0)<CR>

nnoremap <silent> ; :call SnipeNext(0, 0)<CR>
nnoremap <silent> , :call SnipeNext(1, 0)<CR>

augroup snipe-unhighlight
  autocmd!
  autocmd CursorMoved * :call SnipeClearMatch()
  autocmd WinLeave * :call SnipeClearMatch()
augroup END
