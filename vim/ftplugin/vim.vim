" Write and source file -- good for trying stuff out!
nnoremap <buffer> <C-c><C-s> :w \| so %<CR>

" Input a shorthand for a ctrl-key
inoremap <buffer> <expr> <C-t> "<C-".nr2char(getchar()).">"

inoremap <buffer> <C-t><CR> <<space><bs>CR>
inoremap <buffer> <C-t><BS> <<space><bs>BS>
inoremap <buffer> <C-t><Space> <<space><bs>Space>
inoremap <buffer> <C-t><Esc> <<space><bs>Esc>
for c in range(char2nr('a'), char2nr('z'))
  exec "inoremap <buffer> <C-t>".c." \\<C-".c.">"
endfor
