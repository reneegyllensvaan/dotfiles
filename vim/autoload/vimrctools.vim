let s:options = {
      \' ': '~/.vim/rc/space.vim',
      \'C': '~/.vim/rc/commands.vim',
      \'E': '~/.vim/autoload/vimrctools.vim',
      \'p': '{ftplugin}',
      \'f': '{ftplugin-any}',
      \'F': '~/.vim/autoload/fzy.vim',
      \'G': '~/.vim/rc/golden.vim',
      \'S': '~/.vim/autoload/visualops.vim',
      \'T': '~/.vim/rc/textobject.vim',
      \'a': '~/.vim/rc/autocorrect.vim',
      \'b': '~/.vim/rc/bindings.vim',
      \'c': '~/.vim/rc/coc.vim',
      \'g': '~/.vim/rc/gvimrc.vim',
      \'h': '~/.vim/autoload/highlights.vim',
      \'l': '~/.vim/rc/look_and_feel.vim',
      \'L': '~/.vim/rc/lsp.vim',
      \'o': '~/.vim/rc/options.vim',
      \'s': '~/.vim/rc/snipe.vim',
      \'t': '~/.vim/autoload/term.vim',
      \'v': '~/.vimrc'}

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
    if l:target == '{ftplugin-any}'
      call feedkeys(":e ~/.vim/ftplugin/\<Tab>", 'tn')
    elseif l:target == '{ftplugin}'
      exec a:cmd.expand("~/.vim/ftplugin/".(&filetype).".vim")
    else
      exec a:cmd.expand(l:target)
    endif
  endif
endfunction

