#!/bin/sh
cat << EOF
[user]
  name = $DOT_USER_NAME
  email = $DOT_USER_EMAIL
  signingkey = $DOT_GIT_SIGNING_KEY
[commit]
  gpgsign = true
[github]
  user = reneegyllensvaan
[alias]
  a   = add
  aa  = add --all
  o   = checkout
  d   = diff
  dlc = diff
EOF
