# Base packages
brew install  \
  bash          \
  fzf           \
  gawk          \
  git           \
  gnupg         \
  gpg           \
  htop          \
  iftop         \
  monkeysphere  \
  moreutils     \
  mutt          \
  ncdu          \
  neovim        \
  node          \
  offlineimap   \
  perl          \
  pinentry      \
  pngpaste      \
  python        \
  python@2      \
  ranger        \
  ruby          \
  sqlite        \
  tmux          \
  tree

# Some nice GUI applications
brew install --cask \
  gpg-suite               \
  1password               \
  font-source-code-pro    \
  font-iosevka-nerd-font  \
  google-chrome           \
  gpg-suite               \
  karabiner-elements      \
  keybase                 \
  kitty                   \
  qutebrowser             \
  rambox                  \
  spotify                 \
  vagrant                 \
  virtualbox              \
  zoom                    \
  xquartz


# Data wrangling tools:
# jq: general json tool
brew install jq
# gron: converter between json and assignment-formatted json
brew install gron
# xj: xml/html to json converter
brew install chicken
chicken-install xj
