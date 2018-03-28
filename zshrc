# If you come from bash you might have to change your $PATH.
export PATH=$HOME/.bin:$HOME/code/go/bin:$HOME/.bin:/usr/local/bin:$PATH
export EDITOR=/usr/bin/nvim
export VISUAL=/usr/bin/nvim
export RANGER_LOAD_DEFAULT_RC=FALSE
export GOPATH=$HOME/code/go

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

# key bindings
#bindkey "^[[7~" beginning-of-line
#bindkey "^[B" beginning-of-line
#bindkey "^[[8~" end-of-line
#bindkey "[[5~" beginning-of-history
#bindkey "e[6~" end-of-history
#bindkey "^[[3~" delete-char
#bindkey "^[D~" delete-word
#bindkey "^[h" backward-char
#bindkey "^[l" forward-char
#bindkey "e[2~" quoted-insert
#bindkey "^[w" forward-word
#bindkey "^[e" emacs-forward-word
#bindkey "^[b" backward-word
#bindkey "eOd" emacs-backward-word
#bindkey "ee[C" forward-word
#bindkey "ee[D" backward-word
#bindkey "^H" backward-delete-word

# enable vi mode
bindkey -v
export KEYTIMEOUT=1
