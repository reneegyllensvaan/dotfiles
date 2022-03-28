#!/bin/sh
cat << EOF
# vim: fileencoding=utf-8:ft=conf:foldmethod=marker

# Generated colors
foreground   $FOREGROUND
background   $BACKGROUND
cursorColor  $CURSOR_COLOR
color0       $COLOR00
color1       $COLOR01
color2       $COLOR02
color3       $COLOR03
color4       $COLOR04
color5       $COLOR05
color6       $COLOR06
color7       $COLOR07
color8       $COLOR08
color9       $COLOR09
color10      $COLOR10
color11      $COLOR11
color12      $COLOR12
color13      $COLOR13
color14      $COLOR14
color15      $COLOR15

EOF
exit 0
