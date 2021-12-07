countup () {
  if [ ! $1 ]; then
    echo "Usage:"
    echo "  countup to_from_zero"
    echo "  countup from to"
    return
  fi
  from_n=0
  to_n=$1
  if [ $2 ]; then
    from_n=$1
    to_n=$2
  fi

  i=$from_n
  while [ $i -lt $to_n ]; do
    echo "$i"
    i=$(($i+1))
  done
}

countdown () {
  if [ ! $1 ]; then
    echo "Usage:"
    echo "  countdown to_from_zero"
    echo "  countdown from to"
    return
  fi
  from_n=0
  to_n=$1
  if [ $2 ]; then
    from_n=$1
    to_n=$2
  fi

  i=$from_n
  while [ $i -lt $to_n ]; do
    echo "$i"
    i=$(($i-1))
  done
}
