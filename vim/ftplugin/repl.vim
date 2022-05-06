" ex: ft=sourceonsave.vim

function! s:SendKeysRaw(keys, newline)
    let pane_count = str2nr(trim(system('tmux list-panes | wc -l')))
    if pane_count > 1
        let clear_line_cmd = 'tmux send-keys -t+ C-u'
        call system(clear_line_cmd)
        let cmd = "tmux send-keys -t+ -l -- ".a:keys.(a:newline ? "\<C-m>" : "")
        call system(cmd)
    else
        echohl WarningMsg | echo 'No other tmux pane exists' | echohl None
    endif
endfunction

function! s:SendKeys(keys)
    return s:SendKeysRaw(a:keys, 1)
endfunction

function! s:SendInterrupt()
    call s:SendKeysRaw("\<C-c>", 0)
endfunction

function! s:SendClear()
    call s:SendKeysRaw("\<C-l>", 0)
endfunction

function! s:SendMakeCmd()
    let make_list = split(&makeprg)
    let make_cmd = map(make_list, 'expand(v:val)')
    let make_cmd = join(make_cmd, ' SPACE ')
    let keys = make_cmd . ' ENTER'
    call vim_tmux_send#send_keys(keys)
endfunction

function! s:SendLine()
    let current_line = getline('.')
    let current_line = shellescape(current_line)
    call s:SendKeys(current_line)
endfunction

function! s:SendSelectedLines()
    for l:lnum in range(getpos("'<")[1], getpos("'>")[1])
        let l:line = shellescape(getline(l:lnum))
        call s:SendKeys(l:line)
    endfor
endfunction

function! s:SendSelection()
    let current_a_register = @a
    if a:type ==# 'line'
        execute "normal! '[V']" . '"ay'
        let keys = @a
        let keys = shellescape(keys)
        call s:SendKeys(keys)
    elseif a:type ==# 'char'
        execute "normal! `[v`]" . '"ay'
        let keys = @a
        let keys = shellescape(keys) . ' ENTER'
        call s:SendKeys(keys)
    endif
    let @a = current_a_register
endfunction

command! -nargs=* TmuxSendKeys call <SID>SendKeys(<q-args>)
command! TmuxSendLine call <SID>SendLine()
command! TmuxSendSelection call <SID>SendSelection(v:operator == 'v' ? 'char' : 'line')
command! TmuxSendSelectedLines call <SID>SendSelectedLines()
command! TmuxSendInterrupt call <SID>SendInterrupt()
command! TmuxSendClear call <SID>SendClear()

nnoremap <buffer> <C-t><C-t> :TmuxSendLine<CR>
vnoremap <buffer> <C-t><C-t> :<C-u>TmuxSendSelectedLines<CR>
nnoremap <buffer> <C-t><C-c> :TmuxSendInterrupt<CR>
nnoremap <buffer> <C-t><C-l> :TmuxSendClear<CR>

" sbcl-specific, move out at some point i suppose
noremap <buffer> <C-t>3 :<C-u>TmuxSendKeys 3<CR>
noremap <buffer> <C-t>4 :<C-u>TmuxSendKeys 4<CR>
