#!/bin/sh
cat << EOF
default-cache-ttl 600
max-cache-ttl 7200
enable-ssh-support
pinentry-program `[ "$OPERATING_SYSTEM" = 'linux' ] && which pinentry-curses 2>/dev/null || echo $GUI_GPG_PINENTRY`
extra-socket "$HOME/.gnupg/S.gpg-agent.extra"
EOF
