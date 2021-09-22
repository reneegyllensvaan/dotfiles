#!/bin/sh
for dir in {start,opt}/*; do echo "Updating $dir" && (cd $dir && git pull) ; done
