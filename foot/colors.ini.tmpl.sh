#!/bin/sh
cat << EOF
# Generated from dotfiles/foot/colors.ini.tmpl.sh
[colors-dark]
background=${BACKGROUND#\#}
foreground=${FOREGROUND#\#}
cursor=${BACKGROUND#\#} ${FOREGROUND#\#}

# Normal/regular
regular0=${COLOR00#\#}
regular1=${COLOR01#\#}
regular2=${COLOR02#\#}
regular3=${COLOR03#\#}
regular4=${COLOR04#\#}
regular5=${COLOR05#\#}
regular6=${COLOR06#\#}
regular7=${COLOR07#\#}

# Bright
bright0=${COLOR08#\#}
bright1=${COLOR09#\#}
bright2=${COLOR10#\#}
bright3=${COLOR11#\#}
bright4=${COLOR12#\#}
bright5=${COLOR13#\#}
bright6=${COLOR14#\#}
bright7=${COLOR15#\#}
EOF
exit 0
