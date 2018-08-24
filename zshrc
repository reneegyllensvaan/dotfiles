# If you come from bash you might have to change your $PATH.
export PATH=$HOME/.local/bin:$HOME/.bin:$HOME/code/go/bin:$HOME/.bin:/usr/local/bin:$PATH
export PATH=$HOME/.npm-packages/bin:$PATH
export EDITOR=/usr/bin/nvim
export VISUAL=/usr/bin/nvim
export RANGER_LOAD_DEFAULT_RC=FALSE
export GOPATH=$HOME/code/go
export NPM_PACKAGES="$HOME/.npm-packages"

unset MANPATH
export MANPATH="$NPM_PACKAGES/share/man:$(manpath)"

source "$HOME/.tiny-care-terminal"

alias grep='grep --color=auto'
alias ls='ls --color=auto'
alias rg='ranger'
alias sx='startx;exit'

#clipboard aliases
alias xc='xsel -b'
alias xs='xsel'

#editor aliases
alias vim='nvim'
alias vi='nvim'
alias v='nvim'

#git aliases
alias g='git'
alias gstat='git status'

unsetopt nomatch
fpath=( "$HOME/.zfunctions" $fpath )
autoload -U promptinit; promptinit
prompt pure

# tab completion options
setopt automenu
setopt menucomplete

# enable vi mode
bindkey -v
export KEYTIMEOUT=1
