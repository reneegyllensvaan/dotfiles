" vim:fdm=marker
packloadall  " This has to go before filetype conf for vim-polyglot
packadd vinegar

filetype plugin indent on         " Load plugins according to detected filetype.

" Plugin Config: {{{
let g:skim_history_dir = '~/.local/share/skim-history'
let g:floaterm_autoclose = 2
" Plugin Config }}}

" This is a special hack because some functions need to know if they're part
" of a repeated command. An example is the `snipe` functions, which use it to
" determine whether they should prompt for new text, or re-use the same input
" from the last command.
let g:is_repeating = 0
function! DoRepeat()
  let g:is_repeating = 1
  exec 'normal! .'
  let g:is_repeating = 0
endfunction
nnoremap <silent> . :call DoRepeat()<CR>

source ~/.vim/rc/options.vim
if !has('gui_running')
  source ~/.vim/rc/highlights.vim
endif
source ~/.vim/rc/commands.vim
source ~/.vim/rc/fzy.vim
source ~/.vim/rc/look_and_feel.vim
source ~/.vim/rc/surround.vim
source ~/.vim/rc/snipe.vim
source ~/.vim/rc/textobject.vim
source ~/.vim/rc/autocorrect.vim

if exists('$SPACELAB')
  source ~/.vim/rc/space.vim
else
  source ~/.vim/rc/bindings.vim
end

