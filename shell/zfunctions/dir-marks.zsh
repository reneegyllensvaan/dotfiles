pop-mark () {
  # if mark file isn't set, use /tmp
  if [ -z "$DIR_MARK_PATH" ]; then
    echo "no mark path. setting path to /tmp/dir-marks"
    echo "please add 'export DIR_MARK_PATH=<path to file>' to your .profile"
    export DIR_MARK_PATH="/tmp/dir-marks"
  fi

  # make file if not exists
  touch $DIR_MARK_PATH

  # if no arg, do nothing
  if [ -z $1 ]
  then
    echo '#  Usage:'
    echo '#'
    echo '#    mark-dir x  -  mark current directory as x'
    echo '#'
    echo '#    pop-mark x  -  cd to directory marked as x'
    echo '#'
    echo '#  Configuration:'
    echo '#'
    echo '#    DIR_MARK_PATH  -  Export this variable as the path'
    echo '#                      to the file in which directory'
    echo '#                      marks should be stored. The file'
    echo '#                      does not need to exist but the'
    echo '#                      directory does.'
    echo '#                      ( default: /tmp/dir-marks )'
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

mark-dir () {
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
    grep --color=always -E "^\S* " $DIR_MARK_PATH | column -t
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
