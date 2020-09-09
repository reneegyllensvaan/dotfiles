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
    if len(s:fzy_out) > 0
    end
  endfunction
  exec 'botright 20new'
  let s:fzybuffer = term_start(['sh', '-c', s:choice_command.' | fzy -l 20 '.s:post_command.' > ~/.tmp/fzy-out'], {'curwin': 1, 'exit_cb': function('s:CleanBuffer')})
  setlocal nospell bufhidden=wipe nobuflisted nonumber
  setlocal statusline=fzy
  setf fzy
  startinsert
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

" Find File:
nnoremap <silent> <Space>ff :call FzyCommandInBuffer("fd . --type f", ":e ", "")<CR>
" Find Recent:
nnoremap <silent> <Space>fr :call FzyCommandInBuffer("digest-recentf.sh", ":e ", "")<CR>
" Find Directory:
nnoremap <silent> <Space>fd :call FzyCommandInBuffer("fd . --type d", ":e ", "")<CR>
" Fuzzy Home Lcd:
nnoremap <silent> <Space>lcd :call FzyCommandInBuffer("fd . --type d --base-directory ~", ":lcd ~/", "")<CR>
" Find Vimwiki File:
nnoremap <silent> <Space>fv :call FzyCommandInBuffer("fd . ~/org/vimwiki \| sd '".$HOME."' '~'", ":e ", "")<CR>
" Fuzzy Buffers:
nnoremap <silent> <Space>bb :call FzyBuffers(":b ")<CR>
" Fuzzy Buffer Delete:
nnoremap <silent> <Space>bD :call FzyBuffers(":bd ")<CR>

" Git Status:
nnoremap <silent> <Space>gs :!git status<CR>
" Find Git Status Edit:
nnoremap <silent> <Space>gf :call FzyCommandInBuffer("git status --porcelain", ":e ", "\| awk '{print $2}'")<CR>
" Find Git Status Edit:
nnoremap <silent> <Space>ga :call FzyCommandInBuffer("git status --porcelain", ":!git add ", "\| awk '{print $2}'")<CR>
