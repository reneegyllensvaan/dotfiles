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
    let s:fzy_out = readfile("/Users/renee/.tmp/fzy-out")
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

nnoremap <Leader>? :call FzyCommandInBuffer("fd .", ":e ", "")<CR>
nnoremap <silent> <leader>ff :call FzyCommandInBuffer("fd . --type f", ":e ", "")<cr>
nnoremap <silent> <leader>fd :call FzyCommandInBuffer("fd . --type d", ":e ", "")<cr>
nnoremap <silent> <leader>fb :call FzyBuffers()<cr>
" nnoremap <silent> <leader>s :call FzyCommand("find . -type f", ":sp")<cr>
" nnoremap <silent> <leader>/ :call FzyCommand("rg . ''", ":e")<cr>
" nnoremap <silent> <leader>v :call FzyCommand("ag . --silent -l -g ''", ":vs")<cr>
" nnoremap <silent> <leader>s :call FzyCommand("ag . --silent -l -g ''", ":sp")<cr>

