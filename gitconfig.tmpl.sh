#!/bin/sh
cat << EOF
[user]
  name = $USER_NAME
  email = $USER_EMAIL
  signingkey = $GIT_SIGNING_KEY
[commit]
  gpgsign = true
[github]
  user = $GITHUB_USER
[alias]
  a   = add
  aa  = add --all
  o   = checkout
  d   = diff
  dlc = diff
EOF
