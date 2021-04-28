let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/sunday/c
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +13 ii_colorize.c
badd +47 ~/.vim/rc/bindings.vim
badd +0 /bin/zsh\ -c\ \'/bin/zsh\'-0
badd +0 ii_irc_example.log
badd +81 /Library/Developer/CommandLineTools/SDKs/MacOSX10.15.sdk/usr/include/strings.h
badd +82 /Library/Developer/CommandLineTools/SDKs/MacOSX10.15.sdk/usr/include/string.h
badd +106 /Library/Developer/CommandLineTools/SDKs/MacOSX10.15.sdk/usr/include/time.h
badd +31 /Library/Developer/CommandLineTools/SDKs/MacOSX10.15.sdk/usr/include/sys/_types/_time_t.h
argglobal
%argdel
$argadd ii_colorize.c
edit ii_colorize.c
let s:save_splitbelow = &splitbelow
let s:save_splitright = &splitright
set splitbelow splitright
wincmd _ | wincmd |
split
1wincmd k
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd w
wincmd w
let &splitbelow = s:save_splitbelow
let &splitright = s:save_splitright
wincmd t
let s:save_winminheight = &winminheight
let s:save_winminwidth = &winminwidth
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
exe '1resize ' . ((&lines * 40 + 41) / 83)
exe 'vert 1resize ' . ((&columns * 110 + 111) / 222)
exe '2resize ' . ((&lines * 40 + 41) / 83)
exe 'vert 2resize ' . ((&columns * 111 + 111) / 222)
exe '3resize ' . ((&lines * 39 + 41) / 83)
argglobal
balt /Library/Developer/CommandLineTools/SDKs/MacOSX10.15.sdk/usr/include/sys/_types/_time_t.h
setlocal fdm=syntax
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=99
setlocal fml=1
setlocal fdn=20
setlocal fen
10
normal! zo
34
normal! zo
35
normal! zo
let s:l = 13 - ((12 * winheight(0) + 20) / 40)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 13
normal! 010|
wincmd w
argglobal
if bufexists("/bin/zsh\ -c\ \'/bin/zsh\'-0") | buffer /bin/zsh\ -c\ \'/bin/zsh\'-0 | else | edit /bin/zsh\ -c\ \'/bin/zsh\'-0 | endif
if &buftype ==# 'terminal'
  silent file /bin/zsh\ -c\ \'/bin/zsh\'-0
endif
setlocal fdm=syntax
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=99
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 10040 - ((39 * winheight(0) + 20) / 40)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 10040
normal! 023|
wincmd w
argglobal
if bufexists("ii_irc_example.log") | buffer ii_irc_example.log | else | edit ii_irc_example.log | endif
if &buftype ==# 'terminal'
  silent file ii_irc_example.log
endif
balt ~/.vim/rc/bindings.vim
setlocal fdm=syntax
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=99
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 1 - ((0 * winheight(0) + 19) / 39)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 1
normal! 011|
wincmd w
exe '1resize ' . ((&lines * 40 + 41) / 83)
exe 'vert 1resize ' . ((&columns * 110 + 111) / 222)
exe '2resize ' . ((&lines * 40 + 41) / 83)
exe 'vert 2resize ' . ((&columns * 111 + 111) / 222)
exe '3resize ' . ((&lines * 39 + 41) / 83)
tabnext 1
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0&& getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 shortmess=Ac
let &winminheight = s:save_winminheight
let &winminwidth = s:save_winminwidth
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
nohlsearch
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
