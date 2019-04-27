export PATH=$HOME/.bin:$HOME/code/go/bin:/usr/local/bin:$PATH
export PATH="/usr/local/opt/python@2/libexec/bin:$PATH"
export PATH="/usr/local/opt/mysql-client/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.notion:$PATH"
export PATH=/usr/local/opt/texinfo/bin:$PATH
[[ -d ~/Library ]] && export PATH="$PATH:$HOME/Library/Python/2.7/bin"

# Notion
[ -d "$HOME/.notion" ] && export NOTION_HOME="$HOME/.notion"
if [ $NOTION_HOME ]; then
  [ -s "$NOTION_HOME/load.sh" ] && \. "$NOTION_HOME/load.sh"
  export PATH="${NOTION_HOME}/bin:$PATH"
fi

export VISUAL="$(which vim)"
export EDITOR="$VISUAL"
export PAGER=`which bat >/dev/null && echo bat || echo less`
export GIT_EDITOR=vim
export GIT_PAGER=less
export RANGER_LOAD_DEFAULT_RC=FALSE
export GOPATH=$HOME/code/go
export VDIRSYNCER_CONFIG="$HOME/.vdirsyncerrc"

export LDFLAGS=-L/usr/local/opt/texinfo/lib
export DIR_MARK_PATH="$HOME/.dir-marks"
export DEFERRED_COMMANDS_FILE="$HOME/.deferred"

export BAT_CONFIG_PATH="$HOME/.batrc"
export LESS="-SFXR"
export CLICOLOR=1
export CLICOLOR_FORCE=1
export LSCOLORS=ExFxCxDxBxegedabagacad
export KEYTIMEOUT=1
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200'"

# configs for dotfile scripts
export OFFLINEIMAP_SYNC_INTERVAL=120 # seconds

# if we're a zsh, export fpath
if [ `ps -o command='' -p $$ | grep zsh` ]; then
  export FPATH="$HOME/.zfunctions:$FPATH"
fi

# set the clipboard variables based on available clipboard applications
# OSX
which pbcopy >/dev/null && export CLIPBOARD_COPY='pbcopy'
which pbpaste >/dev/null && export CLIPBOARD_PASTE='pbpaste'

# Linux with xsel
which xsel >/dev/null && export CLIPBOARD_COPY='xsel -b' \
                      && export CLIPBOARD_PASTE='xsel -b'

# The following vars are supposed to be used by the user/interactively
export Q=/dev/null
export C=$CLIPBOARD_COPY
export P=$CLIPBOARD_PASTE
