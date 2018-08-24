(cd ~/.xres && ./init)


disable bell beep
xset b off
albert &
urxvtd &
#lxqt-notificationd &
dunst &
~/.screenlayout/mirror-screen-zoom1.sh &
clipmenud &
#solaar &
#guake &
#~/.fehbg
hsetroot -solid #1d262a &
compton --config ~/.config/compton.conf &

#keyboard config
#setxkbmap -layout "us,se" -option "grp:caps_switch"
setxkbmap -layout "us" -option "caps:escape"

