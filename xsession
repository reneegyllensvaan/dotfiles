(cd ~/.xres && ./init)


disable bell beep
xset b off
albert &
urxvtd &
lxqt-notificationd &
~/.screenlayout/mirror-screen-zoom1.sh &
clipmenud &
#solaar &
#guake &
#~/.fehbg
hsetroot &
compton --config ~/.config/compton.conf &

#keyboard config
setxkbmap -layout "us,se" -option "grp:caps_switch"


