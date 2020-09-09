#!/bin/sh
cat << EOF
[core]
  excludesfile = $HOME/.gitignore
[user]
  name = $USER_NAME
  email = $USER_EMAIL
  `[ "$GIT_SIGNING_KEY" ] && echo "signingkey = $GIT_SIGNING_KEY"`
[commit]
  `[ "$GIT_SIGNING_KEY" ] && echo "gpgsign = true"`
[github]
  user = $GITHUB_USER
[alias]
  a   = add
  b   = branch
  c   = commit
  d   = diff
  l   = log
  o   = checkout
  p   = pull
  s   = status
  z   = stash
  aa  = add --all
  pr  = pull --rebase
  pop = stash pop
  root = "! git rev-parse --show-toplevel"
  canoe = commit --amend --no-edit
  ls-files-root = "! git ls-files"
EOF
