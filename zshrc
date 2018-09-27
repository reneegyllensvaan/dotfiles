#!/usr/bin/env zsh
source "$HOME/antigen.zsh"

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
# antigen bundle vi-mode
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

# also disable shared history from OMZ
setopt no_share_history
unsetopt share_history
setopt PROMPT_SUBST

source "$HOME/.profile"
source "$HOME/.alias"
#source "$HOME/.zfunctions/dir-marks.zsh"

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

if [[ $() ]] then
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
$'\n$(prepend_prompt) '"%{$fg_bold[black]%}➜%{$reset_color%}  "
# Colors and stuff
export LESS="-SFXR"
export CLICOLOR=1
export CLICOLOR_FORCE=1
export LSCOLORS=ExFxCxDxBxegedabagacad

#export GIT_EDITOR=nvim
export GIT_EDITOR=nvim

# enable legacy vi mode
bindkey -v;export KEYTIMEOUT=1
#export KEYTIMEOUT=1

# fzf.zsh integration settings
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200'"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
