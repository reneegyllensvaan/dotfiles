let g:space_enable_caching = 0

function! s:PromptInput(n)
  let query = ""
  let q_len = 0
  while q_len < a:n
    let c = getchar()
    if c == 27
      return
    elseif c == 46  " '.' should be escaped
      let query .= "\\."
    else
      let query .= nr2char(c)
    end
    let q_len += 1
  endwhile
  return query
endfunction

" let g:space_mappings = {
"       \'/':  ':RgInteractive<CR>',
"       \'e':   ''':call feedkeys(":e \<Tab>", 'tn')<CR>''',
"       \';E':  ':e ~/.vim/files/bookmarks.vim<CR>',
"       \'b?':  ':w !diff % -<CR>',
"       \'bd':  ':bp\|bd #<CR>',
"       \'bn':  ':bNext<CR>',
"       \'bp':  ':bprevious<CR>',
"       \'fb':  ':Buffers<CR>',
"       \'fw':  ':w<CR>',
"       \'lj':  ':tabnext<CR>',
"       \'lk':  ':tabprevious<CR>',
"       \'ln':  ':tabnew<CR>',
"       \'p':   '"+p',
"       \'tA':  ':CocDisable<CR>',
"       \'tV':  ':source ~/.vimrc<CR>',
"       \'ta':  ':call LoadCoc()<CR>',
"       \'tcc': ':call ToggleCenterCursor()<CR>',
"       \'tcl': ':call ToggleCursorLine()<CR>',
"       \'tn':  ':set number!<CR>',
"       \'tr':  ':set relativenumber!<CR>',
"       \'ts':  ':call ToggleSyntax()<CR>',
"       \'tw':  ':set list!<CR>',
"       \'w-':  '<C-w>s',
"       \'w/':  '<C-w>v',
"       \'w=':  '<C-w>=',
"       \'w_':  '<C-w>s',
"       \'wd':  '<C-w>c',
"       \'wh':  '<C-w>h',
"       \'wj':  '<C-w>j',
"       \'wk':  '<C-w>k',
"       \'wl':  '<C-w>l',
"       \'wm':  ':tab split<CR>',
"       \'wt-': ':term<CR>',
"       \'wt/': ':vert term<CR>',
"       \'y':   '"+y'}

function s:RunPath(path)
  let file_contents = readfile(a:path)
  return eval('"'.substitute(file_contents[1][1:], '<', '\\<', 'g').'"')
endfunction


function! SpaceKeys()
  let sequence = []
  let partialpath = 1
  while partialpath
    let c = getchar()
    if c == 27
      return
    elseif c == 63
      call add(sequence, 'question')
    elseif c == 47
      call add(sequence, 'slash')
    else
      call add(sequence, nr2char(c))
    end

    let path = glob("~/.vim/leader/" . join(sequence, '/'))
    if !empty(path)
      if !isdirectory(glob(path))
        "echo "Found File: " . path
        "echo s:RunPath(path)
        call feedkeys(s:RunPath(path), 'n')
        "return eval(s:RunPath(path))
        "exec 'normal! '.s:RunPath(path)
      end
    else
      let partialpath = 0
    end
  endwhile
  " call feedkeys(sequence, 'n')
endfunction

nnoremap <Space> :call SpaceKeys()<CR>
