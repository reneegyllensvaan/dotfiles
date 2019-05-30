#!/bin/sh
cat << EOF
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
  l   = log
  s   = status
  c   = commit
  aa  = add --all
  o   = checkout
  d   = diff
  P   = push
  p   = pull
  pop = stash pop
  pr  = pull --rebase
  z   = stash
  ls-files-root = "! git ls-files"
EOF
