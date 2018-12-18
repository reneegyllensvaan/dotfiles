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
setopt no_share_history
unsetopt share_history
setopt PROMPT_SUBST

source "$HOME/.profile"
source "$HOME/.alias"
source "$HOME/.zfunctions/dir-marks.zsh"
source "$HOME/.zfunctions/miscellaneous.zsh"

export HISTFILE="$HOME/.zhistory"
setopt inc_append_history
setopt share_history
#unsetopt nomatch
#fpath=( "$HOME/.zfunctions" $fpath )
#fpath=( "$HOME/.zsh-completions/src" $fpath)
#autoload -U compinit; compinit
#autoload -U promptinit; promptinit
#prompt pure

EMOJI=( 💅 💋 💍 🐱 👻 💄 👑 👒 🐶 🐹 🦊 🐰 🦆 🦄 🦋 🐳 🐍 🐢 ✨ 💫 🌈 💧 🍋 🍉 🍓 🥥 🥝 🥑 🥦 🌶 🥞 🍬 💎 🔮 🎁 💜 💞 ) 

if [[ ! $(echo $TERM | grep rxvt) ]] then
  function prepend_prompt {
    echo -n "$EMOJI[$RANDOM%$#EMOJI+1]"
  }

  function precmd {
    prepend_prompt
  }

else
  function prepend_prompt {
  }
fi

PROMPT=$'\n'"%{$fg[blue]%}%B%~%{$reset_color%} \$(git_prompt_info)$(bzr_prompt_info)"\
$'\n$(prepend_prompt) '"%(?.%F{green}.%F{red})${PURE_PROMPT_SYMBOL:-❯}%f "
#$'\n$(prepend_prompt) '"%{$fg_bold[black]%}❯%{$reset_color%}  "
# fzf.zsh integration settings
[ -f ~/.zfunctions/fzf.zsh ] && source ~/.zfunctions/fzf.zsh

# opam configuration
test -r /Users/renee/.opam/opam-init/init.zsh && . /Users/renee/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
