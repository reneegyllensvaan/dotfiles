" vim:fdm=marker
if has('nvim')
  set packpath^=~/.vim
  set rtp^=~/.vim
end

if exists('g:started_by_firenvim')
  source ~/.vim/rc/firenvim.vim
  finish
endif

" Disable Netrw
let g:loaded_netrw = 1
packloadall

if !exists('$NVIM_USE_TREESITTER') || ($NVIM_USE_TREESITTER != '1')
  packadd polyglot-small
  filetype plugin indent on
  syntax on
endif

" To use full vim-polyglot distribution:
" packadd polyglot-large

" Project Ideas: {{{
"   - <Leader>/ to toggle case-sensitivity for search (setreg, '/C|/c')
" Project Ideas }}}

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

source ~/.local.vim

source ~/.vim/rc/options.vim
if !has('gui_running')
  source ~/.vim/rc/highlights.vim
endif
source ~/.vim/rc/commands.vim
source ~/.vim/rc/look_and_feel.vim
source ~/.vim/rc/snipe.vim
source ~/.vim/rc/textobject.vim
source ~/.vim/rc/autocorrect.vim

function! UseTreesitter()
  " source ~/.vim/rc/lsp.vim
  syntax off
  packadd nvim-treesitter
  command! TSHighlightCapturesUnderCursor :lua require'treesitter-get-highlight'.show_hl_captures()<CR>
  luafile ~/.vim/rc/treesitter.lua
endfunction

function! UsePolyglot()
  filetype off
  syntax off
  packadd polyglot-small
  filetype plugin indent on
  syntax on
endfunction

if exists('$NVIM_USE_TREESITTER') && $NVIM_USE_TREESITTER == '1'
  call UseTreesitter()
endif

if exists('$SPACELAB')
  source ~/.vim/rc/space.vim
else
  source ~/.vim/rc/bindings.vim
end

