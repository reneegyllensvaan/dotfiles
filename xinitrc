(~/.xsession)
#exec i3
##exec awesome
if [[ -z "${WM}" ]]; then
  exec i3
else
  exec $WM
fi
