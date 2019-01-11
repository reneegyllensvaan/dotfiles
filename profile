export PATH=$HOME/.bin:$HOME/code/go/bin:/usr/local/bin:$PATH
export PATH="/usr/local/opt/python@2/libexec/bin:$PATH"
export PATH="/usr/local/opt/mysql-client/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH=/usr/local/opt/texinfo/bin:$PATH
[[ -d ~/Library ]] && export PATH="$PATH:$HOME/Library/Python/2.7/bin"

export VISUAL="$(which vim)"
export EDITOR="$VISUAL"
export RANGER_LOAD_DEFAULT_RC=FALSE
export GOPATH=$HOME/code/go
export GPG_TTY="$(tty)"

export LDFLAGS=-L/usr/local/opt/texinfo/lib
export DIR_MARK_PATH="$HOME/.dir-marks"

export BAT_CONFIG_PATH="$HOME/.batrc"
export LESS="-SFXR"
export CLICOLOR=1
export CLICOLOR_FORCE=1
export LSCOLORS=ExFxCxDxBxegedabagacad
export GIT_EDITOR=vim
export KEYTIMEOUT=1
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200'"
if [ -e /Users/renee/.nix-profile/etc/profile.d/nix.sh ]; then . /Users/renee/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

# the following vars are supposed to be used by the user/interactively
export Q=/dev/null

# set the clipboard variables based on available clipboard applications
# OSX
which pbcopy >/dev/null && export CLIPBOARD_COPY='pbcopy'
which pbpaste >/dev/null && export CLIPBOARD_PASTE='pbpaste'

# Linux with xsel
which xsel >/dev/null && export CLIPBOARD_COPY='xsel -b' \
                      && export CLIPBOARD_PASTE='xsel -b'
