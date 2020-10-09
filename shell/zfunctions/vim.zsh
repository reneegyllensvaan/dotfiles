[ "$VIM_SERVERNAME" ] || return

:e () {
  [ "$1" ] || return
  vim --servername $VIM_SERVERNAME --remote-send "<C-w>:e! $PWD/$1<CR>"
}

# Post-cd hook in zsh, makes the containing vim terminal window cd when we cd in zsh
chpwd() {
  vim --servername $VIM_SERVERNAME --remote-send "<C-w>:lcd $PWD<cr>"
}

# Open files in the host vim session
export EDITOR="host-vim"
export VISUAL="$EDITOR"

# Use blocking mode for git, so it can wait for editing to finish
export GIT_EDITOR="host-vim-wait"

# Escape to term normal mode
__vim_space () {
  vim --servername $VIM_SERVERNAME --remote-send '<C-\><C-n>:call feedkeys("\<Space>", '')<cr>'
}
zle -N __vim_space
bindkey -a '\ ' __vim_space

# Make the colon key switch the host vim session to command mode instead
__vim_colon () {
  vim --servername $VIM_SERVERNAME --remote-send '<C-w>:'
}
zle -N __vim_colon
bindkey -a ':' __vim_colon
