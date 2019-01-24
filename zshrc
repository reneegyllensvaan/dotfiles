#!/usr/bin/env zsh
source "$HOME/antigen.zsh"

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle vi-mode
antigen bundle fabric
antigen bundle pip
antigen bundle docker
antigen bundle command-not-found

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

# Load the theme.
antigen theme frisk
#antigen theme https://github.com/denysdovhan/spaceship-prompt spaceship

# Tell Antigen that you're done.
antigen apply

# oh-my-zsh aliases git to g, but that should be curt-git
unalias g
unalias gb

# also disable shared history from OMZ
export HISTFILE="$HOME/.zhistory"
export HISTSIZE=1000000
setopt inc_append_history
setopt no_share_history
setopt hist_ignore_dups
unsetopt share_history
setopt PROMPT_SUBST

source "$HOME/.profile"
source "$HOME/.alias"
source "$HOME/.zfunctions/dir-marks.zsh"
source "$HOME/.zfunctions/miscellaneous.zsh"

#unsetopt nomatch
#autoload -U compinit; compinit
#autoload -U promptinit; promptinit
#prompt pure
compdef _keybase keybase

EMOJI=( 💅 💋 💍 🐱 👻 💄 👑 👒 🐶 🐹 🦊 🐰 🦆 🦄 🦋 🐳 🐍 🐢 ✨ 💫 🌈 💧 🍋 🍉 🍓 🥥 🥝 🥑 🥦 🌶 🥞 🍬 💎 🔮 🎁 💜 💞 )

if [ -z $(echo $TERM | grep rxvt) ]; then
  function prepend_prompt () {
    echo -n "$EMOJI[$RANDOM%$#EMOJI+1]"
  };

  function precmd () {
    prepend_prompt;
  };

else
  function prepend_prompt () {
  };
fi

PROMPT=$'\n'"%{$fg[blue]%}%B%~%{$reset_color%} \$(git_prompt_info)$(bzr_prompt_info)"\
$'\n$(prepend_prompt) '"%(?.%F{green}.%F{red})${PURE_PROMPT_SYMBOL:-❯}%f "
#$'\n$(prepend_prompt) '"%{$fg_bold[black]%}❯%{$reset_color%}  "

# fzf.zsh integration settings
[ -f ~/.zfunctions/fzf.zsh ] && source ~/.zfunctions/fzf.zsh

# opam configuration
test -r /Users/renee/.opam/opam-init/init.zsh && . /Users/renee/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# GnuPG settings
if which gpgconf >/dev/null; then
  export GPG_TTY="$(tty)"
  export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
  # if gpg-agent is not running, start it and load env
  pgrep gpg-agent >/dev/null || eval $(gpg-agent --options $HOME/.gnupg/gpg-agent.conf --daemon ) 
fi
