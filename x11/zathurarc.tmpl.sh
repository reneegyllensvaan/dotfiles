#!/bin/sh
cat << EOF
set font "Iosevka Fixed 13"
set notification-error-bg       "$BACKGROUND" # base01  # seem not work
set notification-error-fg       "$COLOR09" # red
set notification-warning-bg     "$BACKGROUND" # base01
set notification-warning-fg     "$COLOR09" # red
set notification-bg             "$BACKGROUND" # base01
set notification-fg             "$COLOR11" # yellow

set completion-group-bg         "$COLOR03" # base03
set completion-group-fg         "$COLOR00" # base0
set completion-bg               "$COLOR00" # base02
set completion-fg               "$COLOR15" # base1
set completion-highlight-bg     "$BACKGROUND" # base01
set completion-highlight-fg     "$COLOR04" # base2

set index-bg                    "$FOREGROUND" # base02
set index-fg                    "$BACKGROUND" # base1
set index-active-bg             "$BACKGROUND" # base01
set index-active-fg             "$FOREGROUND" # base2

set inputbar-bg                 "$BACKGROUND" # base01
set inputbar-fg                 "$FOREGROUND" # base2

set statusbar-bg                "$BACKGROUND" # base02
set statusbar-fg                "$COLOR07" # base1

set highlight-color             "$COLOR00" # base00
set highlight-active-color      "$COLOR12" # blue

set default-bg                  "$BACKGROUND" # base02
set default-fg                  "$FOREGROUND" # base1
set render-loading              true
set render-loading-fg           "$FOREGROUND" # base02
set render-loading-bg           "$FOREGROUND" # base02

# Recolor book content's color
set recolor                     true
set recolor-lightcolor          "$BACKGROUND" # base02
set recolor-darkcolor           "$FOREGROUND" # base1
EOF
exit 0
