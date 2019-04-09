#source "$HOME/antigen.zsh"

export HISTFILE="$HOME/.zhistory"
export HISTSIZE=100
export SAVEHIST=1000000
setopt SHARE_HISTORY
setopt APPEND_HISTORY

setopt PROMPT_SUBST
# Set vi mode with no timeout
export KEYTIMEOUT=1; bindkey -v
# Set completion to be case-insensitive in unambiguous cases
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'

source "$HOME/.profile"
source "$HOME/.user-profile"
source "$HOME/.alias"
source "$HOME/.zfunctions/dir-marks.zsh"
source "$HOME/.zfunctions/miscellaneous.zsh"
source "$HOME/.zfunctions/colors.zsh"
source "$HOME/.zfunctions/git-prompt.zsh"
source "$HOME/.zfunctions/fzf.zsh"
[ -f "$HOME/.zfunctions/zsh-syntax-highlighting.zsh" ] \
  && source "$HOME/.zfunctions/zsh-syntax-highlighting.zsh"

#unsetopt nomatch
autoload -U compinit; compinit
#autoload -U promptinit; promptinit
#prompt pure

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

# Set up the prompt template
PROMPT=$'\n'"%{$fg[blue]%}%B%~%{$reset_color%} \$(git_prompt_info)"
[ $SSH_CLIENT ] && PROMPT="$PROMPT [%n@%m]" # only append prompt with host over ssh
PROMPT="$PROMPT"$'\n$(prepend_prompt) '"%(?.%F{green}.%F{red})❯%f "


# opam configuration
test -r /Users/renee/.opam/opam-init/init.zsh && . /Users/renee/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# GnuPG settings
if [ $GPG_FINGERPRINT ]; then
  export GPG_TTY="$(tty)"
  export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
  # if gpg-agent is not running, start it and load env
  pgrep gpg-agent >/dev/null || eval $(gpg-agent --options $HOME/.gnupg/gpg-agent.conf --daemon ) 
fi

which npm >/dev/null && export PATH="`npm bin -g`:$PATH"
