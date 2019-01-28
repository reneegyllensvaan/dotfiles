#!/bin/sh
cat << EOF
auto-key-retrieve
no-emit-version
use-agent
#no-tty
default-key $DOT_DEFAULT_GPG_KEY
EOF
