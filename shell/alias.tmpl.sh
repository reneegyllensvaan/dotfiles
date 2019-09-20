#!/bin/sh
# Don't believe the warning below: this is the file you want to edit
cat << EOF
# Do not edit this file, it's generated from a template. Instead, edit
# the .tmpl.sh file in dotfiles/shell

alias f='pop-mark'
alias m='mark-dir'

alias rr='ranger'
alias sx='startx;exit'
alias up='cd ..'
alias lass='ls --color=always -lAh | less -R'
alias ncdu="ncdu --color dark -rr -x --exclude .git --exclude node_modules"

# editor aliases
alias fim='f=\`fzf\` && vim \$f' # use fzf to select a file but only open on return 1
alias eme='emacsclient -nw --socket-name=default'
#alias vim='nvim'
alias v='nvim'

# shortcut commands
alias fab='comfortable-fab'
alias g='git'
alias ypwd='echo \$PWD | \$CLIPBOARD_COPY'
alias gz='gzip'
alias gzd='gzip -d'
alias xz='fxz'
alias la='ls -lAh'
alias v='vagrant'
alias splines="tr ' ' '\\n'"
#alias skim='sk -i -c 'rg --column --line-number --color=always --smart-case "{}" . --ansi --color

# unglob some commands
alias fd='noglob fd'
alias fdi='noglob fd -I'
alias rg='noglob rg'
alias w3m='noglob w3m'
alias jq='noglob jq'
#alias rg='noglob   --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn}'

# command replacements
`which >/dev/null 2>/dev/null gsed && echo "alias sed='gsed'"`
`which >/dev/null 2>/dev/null ggrep && echo "alias grep='ggrep'"`
`which >/dev/null 2>/dev/null bat && echo "alias cat='bat'"`
