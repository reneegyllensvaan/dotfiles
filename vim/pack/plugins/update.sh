#!/bin/sh

for dir in {start,opt}/*; do
  ((echo "starting" && cd $dir && git pull) | sed -E "s~^~$(printf '%-30s | ' $dir)~") &
done
wait
