let s:options = {
      \'f': '%',
      \'v': '~/.vimrc',
      \'b': '~/.vim/rc/bindings.vim',
      \'o': '~/.vim/rc/options.vim',
      \'c': '~/.vim/rc/coc.vim',
      \'C': '~/.vim/rc/Commands.vim',
      \'F': '~/.vim/rc/fzy.vim',
      \'g': '~/.vim/rc/gvimrc.vim',
      \'G': '~/.vim/rc/golden.vim',
      \'a': '~/.vim/rc/autocorrect.vim',
      \'l': '~/.vim/rc/look_and_feel.vim',
      \'s': '~/.vim/rc/snipe.vim',
      \'S': '~/.vim/rc/surround.vim',
      \'t': '~/.vim/rc/textobject.vim',
      \' ': '~/.vim/rc/space.vim'}

function! vimrctools#pick_runtime_file(prompt, cmd)
  let l:cmdheight = &cmdheight
  let l:items = items(s:options)
  let &cmdheight = len(l:items)+2
  echo a:prompt
  for [l:k, l:v] in l:items
    echo "   [".l:k."] : ".l:v
  endfor
  echo ""
  let l:target = get(s:options, nr2char(getchar()), '')
  let &cmdheight = l:cmdheight
  if !empty(l:target)
    exec a:cmd.expand(l:target)
  endif
endfunction

