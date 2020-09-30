#!/bin/sh
cat << EOF
[core]
  excludesfile = $HOME/.gitignore_global
[user]
  name = $USER_NAME
  email = $USER_EMAIL
  `[ "$GIT_SIGNING_KEY" ] && echo "signingkey = $GIT_SIGNING_KEY"`
[commit]
  `[ "$GIT_SIGNING_KEY" ] && echo "gpgsign = true"`
[gpg]
  program = gpg2
[github]
  user = $GITHUB_USER
[alias]
  a   = add
  aa  = add --all
  b   = branch
  c   = commit
  ca  = commit --amend
  canoe = commit --amend --no-edit
  cp  = cherry-pick
  d   = diff
  l   = log
  ls-files-root = "! git ls-files"
  o   = checkout
  p   = pull
  pop = stash pop
  pr  = pull --rebase
  r   = rebase
  rc  = rebase --continue
  ri  = rebase -i
  root = "! git rev-parse --show-toplevel"
  s   = status
  z   = stash
EOF
