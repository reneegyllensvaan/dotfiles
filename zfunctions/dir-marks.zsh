# dir-mark settings
export DIR_MARK_PATH="$HOME/.dir-marks"
f () {
  # if mark file isn't set, use /tmp
  if [ -z "$CURT_MARK_PATH" ]; then
    echo "no mark path. setting path to /tmp/curt-marks"
    export CURT_MARK_PATH="/tmp/curt-marks"
  fi

  # make file if not exists
  touch $CURT_MARK_PATH

  # if no arg, do nothing
  if [[ ! $1 ]]
  then
    exit 0
  fi

  target=$(cat $CURT_MARK_PATH | sed -E -n 's|^('$1' )(.*)$|\2|p')

  if [ -n $target ]
  then
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
  if [[ ! $1 ]]
  then
    grep --color=auto -E "^\S* " $DIR_MARK_PATH
    return
  fi

  old_line=$(grep -E "^$1 " $DIR_MARK_PATH)

  if [[ ! $old_line ]]
  then
    echo "$1 $PWD" >> $DIR_MARK_PATH
  else
    cat $DIR_MARK_PATH | sed -E 's|^('$1' ).*$|\1'$PWD'|' > "$DIR_MARK_PATH"'.tmp'
    rm $DIR_MARK_PATH
    mv "$DIR_MARK_PATH"'.tmp' "$DIR_MARK_PATH"
  fi
}
