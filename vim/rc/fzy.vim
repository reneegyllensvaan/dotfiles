function! FzyCommand(choice_command, vim_command)
  try
    let output = system(a:choice_command . " | fzy ")
  catch /Vim:Interrupt/
    " Swallow errors from ^C, allow redraw! below
  endtry
  redraw!
  if v:shell_error == 0 && !empty(output)
    exec a:vim_command . ' ' . output
  endif
endfunction

function! FzyCommandInBuffer(choice_command, vim_command, post_command)
  let s:choice_command = a:choice_command
  let s:vim_command = a:vim_command
  let s:post_command = a:post_command
  let s:returnwindow = winnr()
  function! s:CleanBuffer(pid, code)
    if exists('s:fzybuffer')
      " When command finishes, don't keep the terminal around
      exec 'bd! ' s:fzybuffer
    end
    if exists('s:returnwindow')
      " Switch back to the window we started from so we change the right one
      exec s:returnwindow . 'wincmd w'
    end
    let s:fzy_out = readfile(glob("~/.tmp/fzy-out"))
    if len(s:fzy_out) > 0
      exec s:vim_command . (s:fzy_out[0])
    end
  endfunction
  exec 'botright 20new'
  let s:fzybuffer = term_start(['sh', '-c', s:choice_command.' | fzy -l 20 '.s:post_command.' > ~/.tmp/fzy-out'], {'curwin': 1, 'exit_cb': function('s:CleanBuffer')})
  setlocal nospell bufhidden=wipe nobuflisted nonumber
  setf fzy
  startinsert
endfunction


function! DumpBuffers()
  redir! > ~/.tmp/vim-buffers
  :ls
  redir END
endfunction

function! FzyBuffers()
  call DumpBuffers()
  call FzyCommandInBuffer("cat ~/.tmp/vim-buffers", ":b ", "\| awk '{print $1}'")
endfunction

" Find File:
nnoremap <silent> <leader>ff :call FzyCommandInBuffer("fd . --type f", ":e ", "")<cr>
" Find Directory:
nnoremap <silent> <leader>fd :call FzyCommandInBuffer("fd . --type d", ":e ", "")<cr>
" Fuzzy Home Lcd:
nnoremap <silent> <leader>lcd :call FzyCommandInBuffer("fd . --type d --base-directory ~", ":lcd ~/", "")<cr>
" Find Git Status Edit:
nnoremap <silent> <leader>fg :call FzyCommandInBuffer("git status --porcelain", ":e ", "\| awk '{print $2}'")<cr>
" Find Vimwiki File:
nnoremap <silent> <leader>fv :call FzyCommandInBuffer("fd . ~/org/vimwiki \| sd '".$HOME."' '~'", ":e ", "")<cr>
" Fuzzy Buffers:
nnoremap <silent> <leader>bb :call FzyBuffers()<cr>

