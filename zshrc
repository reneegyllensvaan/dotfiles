# If you come from bash you might have to change your $PATH.
export PATH=$HOME/.bin:$HOME/code/go/bin:$HOME/.bin:/usr/local/bin:$PATH
export PATH="/usr/local/opt/python@2/libexec/bin:$PATH"
export PATH="/usr/local/opt/mysql-client/bin:$PATH"
export VISUAL="/usr/local/bin/nvim"
export EDITOR="$VISUAL"
export RANGER_LOAD_DEFAULT_RC=FALSE
export GOPATH=$HOME/code/go

#alias grep='grep --color=auto'
#alias ls='ls --color=auto'
alias rg='ranger'
alias sx='startx;exit'

#clipboard aliases
#alias xc='xsel -b'
#alias xs='xsel'
alias xc='pbcopy'
alias xp='pbpaste'

#editor aliases
#alias vim='nvim'
alias vim='nvim'
alias vi='nvim'
alias v='nvim'

#git settings
alias g='git'
alias push='git push'
alias pull='git pull'
alias commit='git commit'
alias add='git add'
alias gstat='git status'
export GIT_EDITOR=nvim

unsetopt nomatch
fpath=( "$HOME/.zfunctions" $fpath )
fpath=( "$HOME/.zsh-completions/src" $fpath)
autoload -U compinit; compinit
autoload -U promptinit; promptinit
prompt pure
export HISTFILE=~/.zhistory

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
bindkey -v;export KEYTIMEOUT=1
