" ex: ft=sourceonsave.vim

let g:remote_session = 'remote'

function! s:SendKeysRaw(keys, newline)
    let clear_line_cmd = 'tmux send-keys -t '.g:remote_session.' C-u'
    call system(clear_line_cmd)
    let cmd = "tmux send-keys -t ".g:remote_session." -l -- ".a:keys
    call system(cmd)
    if a:newline
        let cmd = "tmux send-keys -t ".g:remote_session." 'C-m'"
        call system(cmd)
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

function! s:SendBuffer()
    for l:lnum in range(getpos("^")[1], getpos("$")[1])
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

command! -nargs=* RemoteSendKeys call <SID>SendKeys(<q-args>)
command! RemoteSendLine call <SID>SendLine()
command! RemoteSendSelection call <SID>SendSelection(v:operator == 'v' ? 'char' : 'line')
command! RemoteSendSelectedLines call <SID>SendSelectedLines()
command! RemoteSendBuffer call <SID>SendBuffer()
command! RemoteSendInterrupt call <SID>SendInterrupt()
command! RemoteSendClear call <SID>SendClear()

nnoremap <C-t><C-t> :RemoteSendLine<CR>
vnoremap <C-t><C-t> :<C-u>RemoteSendSelectedLines<CR>
vnoremap <C-t><C-a> :<C-u>RemoteSendBuffer<CR>
nnoremap <C-t><C-c> :RemoteSendInterrupt<CR>
nnoremap <C-t><C-l> :RemoteSendClear<CR>
nnoremap <C-t>q :call <SID>SendKeys('q')<CR>

" sbcl-specific, move out at some point i suppose
noremap <C-t>3 :<C-u>RemoteSendKeys 3<CR>
noremap <C-t>4 :<C-u>RemoteSendKeys 4<CR>
