#!/bin/sh
cat << EOF
[user]
  name = $USER_NAME
  email = $USER_EMAIL
  `[ $GIT_SIGNING_KEY ] && 'signingkey = $GIT_SIGNING_KEY'`
[commit]
  `[ $GIT_SIGNING_KEY ] && 'gpgsign = true'`
[github]
  user = $GITHUB_USER
[alias]
  a   = add
  aa  = add --all
  o   = checkout
  d   = diff
  dlc = diff
EOF
