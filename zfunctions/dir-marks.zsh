#  Usage:
#    
#    m x  -  mark current directory as x
#  
#    f x  -  cd to directory marked as x
#  
#  Configuration:
#  
#    DIR_MARK_PATH  -  Export this variable as the path
#                      to the file in which directory 
#                      marks should be stored. The file
#                      does not need to exist but the 
#                      directory does.
#                      ( default: /tmp/dir-marks )


f () {
  # if mark file isn't set, use /tmp
  if [ -z "$DIR_MARK_PATH" ]; then
    echo "no mark path. setting path to /tmp/dir-marks"
    export DIR_MARK_PATH="/tmp/dir-marks"
  fi

  # make file if not exists
  touch $DIR_MARK_PATH

  # if no arg, do nothing
  if [ -z $1 ]
  then
    return
  fi

  target=$(cat $DIR_MARK_PATH | sed -E -n 's|^('$1' )(.*)$|\2|p')

  if [ -z $target ]
  then
    echo "mark $1 not found"
  else
    cd $target
  fi
}

m () {
  # if mark file isn't set, use /tmp
  if [ -z "$DIR_MARK_PATH" ]; then
    echo "no mark path. setting path to /tmp/dir-marks"
    export DIR_MARK_PATH="/tmp/dir-marks"
  fi

  # make file if not exists
  touch $DIR_MARK_PATH

  # if no arg, print help
  if [ -z $1 ]
  then
    grep --color=auto -E "^\S* " $DIR_MARK_PATH
    return
  fi

  old_line=$(grep -E "^$1 " $DIR_MARK_PATH)

  if [ -z $old_line ]
  then
    echo "$1 $PWD" >> $DIR_MARK_PATH
  else
    cat $DIR_MARK_PATH | sed -E 's|^('$1' ).*$|\1'$PWD'|' > "$DIR_MARK_PATH"'.tmp'
    rm $DIR_MARK_PATH
    mv "$DIR_MARK_PATH"'.tmp' "$DIR_MARK_PATH"
  fi
}
