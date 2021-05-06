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
EOF
exit 0
