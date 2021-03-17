function parse_git_dirty() {
  local STATUS=''
  local -a FLAGS
  FLAGS=('--porcelain')
  STATUS=$(command git status ${FLAGS} 2> /dev/null | tail -n1)
  if [[ -n $STATUS ]]; then
    echo "*"
  else
    echo ""
  fi
}

function git_prompt_info() {
  local ref
  ref=$(command git symbolic-ref HEAD 2> /dev/null) || \
    ref=$(command git rev-parse --short HEAD 2> /dev/null) || return 0
  echo -n "%{$fg[green]%}[${ref#refs/heads/}%{$fg[red]%}$(parse_git_dirty)%{$reset_color%}%{$fg[green]%}]%{$reset_color%} "
}
