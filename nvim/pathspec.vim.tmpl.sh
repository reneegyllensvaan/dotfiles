#!/bin/sh
# This shell template builds a config file that fetches and sets up
# system-dependent but relatively static variables. This is to cut some time
# out of the vim init for things that'll be the same across most restarts
binary_path () {
  which $2 >/dev/null 2>&1 \
    && echo "let g:$1 = '`which $2`'" \
    || echo "\" $2 not found"
  }

rust_sysroot=`rustc --print sysroot`
if [ "$rust_sysroot" ]; then
  rust_src_dir="$rust_sysroot/lib/rustlib/src/rust/src/"
  [ -d "$rust_src_dir" ] \
    && rust_src_var="let g:deoplete#sources#rust#rust_source_path = '$rust_src_dir'" \
    || rust_src_var="\" rust-src not found"
fi

# Coalesce for available grep commands. Bottom line = highest priority
grepprg='grep\ --color=never'
which ag >/dev/null 2>&1 && grepprg='ag\ --nogroup\ --nocolor'
which rg >/dev/null 2>&1 && grepprg='rg\ --color=never'

cat << EOF
$(binary_path python_host_prog python2)
$(binary_path python3_host_prog python3)
$(binary_path racer_cmd racer)
$rust_src_var
set grepprg=$grepprg
EOF
exit 0
