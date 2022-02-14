" Source the current selection (yank to x, eval x, restore visual)
vnoremap <buffer> <A-:> "xy:@x<CR>gv

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
inoremap <buffer> <C-t><Left> <<space><bs>Left>
inoremap <buffer> <C-t><Right> <<space><bs>Right>
inoremap <buffer> <C-t><Up> <<space><bs>Up>
inoremap <buffer> <C-t><Down> <<space><bs>Down>
