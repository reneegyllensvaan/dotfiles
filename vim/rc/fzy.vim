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

function! FzyCommandInBuffer(choice_command, vim_command, post_command) abort
  let s:choice_command = a:choice_command
  let s:vim_command = a:vim_command
  let s:post_command = a:post_command
  let s:returnwindow = winnr()
  function! s:CleanBuffer(pid, code)
    if exists('s:fzybuffer')
      " When command finishes, don't keep the terminal around
      silent exec 'bd! ' s:fzybuffer
    end
    if exists('s:returnwindow')
      " Switch back to the window we started from so we change the right one
      exec s:returnwindow . 'wincmd w'
    end
    let s:fzy_out = readfile(glob("~/.tmp/fzy-out"))
    if !(a:code)
      for line in s:fzy_out
        exec s:vim_command . line
      endfor
    end
  endfunction
  exec 'botright 20new'
  let s:fzybuffer = term_start(['sh', '-c', s:choice_command.' | fzy -l 20 '.s:post_command.' > ~/.tmp/fzy-out'], {'curwin': 1, 'exit_cb': function('s:CleanBuffer')})
  setlocal nospell bufhidden=wipe nobuflisted nonumber
  setlocal statusline=fzy
  setf fzy
  startinsert
endfunction

function! FzyScript(key_sequence, run) abort
  call FzyCommandInBuffer(glob("~/.vim/leader-scripts/".a:key_sequence)." pre", a:run, "\| ".glob("~/.vim/leader-scripts/".a:key_sequence)." post")
endfunction

let g:fzy_actions = ['Files', 'Buffers']

function! DumpBuffers()
  redir! > ~/.tmp/vim-buffers
  :ls
  redir END
endfunction

function! FzyBuffers(cmd)
  call DumpBuffers()
  call FzyCommandInBuffer("cat ~/.tmp/vim-buffers", a:cmd, "\| awk '{print $1}'")
endfunction

function! GitCommand()
  let resp = confirm("git ...", "&status\n&commit\ncheck&out\n&add")
  echo "git " . resp
endfunction
