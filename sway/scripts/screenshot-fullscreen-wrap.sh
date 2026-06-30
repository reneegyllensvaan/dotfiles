#!/bin/bash
# Wrapper: re-fullscreens the game window after screenshot closes.
# Wayland version — uses swaymsg instead of i3-msg.
# For grim+slurp or flameshot on Wayland.

was_fullscreen=$(swaymsg -t get_tree 2>/dev/null | \
  jq -r 'recurse(.nodes[]?) | select(.focused==true) | .fullscreen_mode' 2>/dev/null)

flameshot gui "$@"

[ "$was_fullscreen" = "1" ] && swaymsg fullscreen enable >/dev/null 2>&1
