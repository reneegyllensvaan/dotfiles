#!/bin/sh
cat << EOF
let g:python_host_prog = `which python`
let g:python3_host_prog = `which python3`
EOF
