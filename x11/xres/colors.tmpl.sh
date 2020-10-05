#!/bin/sh
cat << EOF
*.foreground:   $FOREGROUND
*.background:   $BACKGROUND
*.cursorColor:  $CURSOR_COLOR

! Gray
*.color0:       $COLOR00
*.color8:       $COLOR08

! Red
*.color1:       $COLOR01
*.color9:       $COLOR09

! Green
*.color2:       $COLOR02
*.color10:      $COLOR10

! Yellow
*.color3:       $COLOR03
*.color11:      $COLOR11

! Blue
*.color4:       $COLOR04
*.color12:      $COLOR12

! Magenta
*.color5:       $COLOR05
*.color13:      $COLOR13

! Cyan
*.color6:       $COLOR06
*.color14:      $COLOR14

! White
*.color7:       $COLOR07
*.color15:      $COLOR15
EOF
exit 0
