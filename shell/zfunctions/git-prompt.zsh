function count_expr() {
  local staged_changed_count=$(echo $2 | grep -E $1 | wc -l)
  echo "${staged_changed_count// /}"
}

function parse_git_dirty() {
  local STATUS=''
  local -a FLAGS
  FLAGS=('--porcelain')
  STATUS=$(command git status --porcelain 2>/dev/null | sed -E 's/^(..).*/\1/')
  if [[ ! -n $STATUS ]]; then
    return
  fi
  out=()

  local staged_modified_count=$(count_expr '^M' "$STATUS")
  if [[ "$staged_modified_count" != 0 ]]; then
    out+="%{$fg[green]%}$staged_modified_count+"
  fi

  local staged_added_count=$(count_expr '^A' "$STATUS")
  if [[ "$staged_added_count" != 0 ]]; then
    out+="%{$fg[green]%}$staged_added_count++"
  fi

  local staged_deleted_count=$(count_expr '^D' "$STATUS")
  if [[ "$staged_deleted_count" != 0 ]]; then
    out+="%{$fg[green]%}${staged_deleted_count}--"
  fi

  local unstaged_modified_count=$(count_expr '^.M' "$STATUS")
  if [[ "$unstaged_modified_count" != 0 ]]; then
    out+="%{$fg[red]%}$unstaged_modified_count+"
  fi

  # Not sure if this actually happens, I think these are just untracked?
  local unstaged_added_count=$(count_expr '^.A' "$STATUS")
  if [[ "$unstaged_added_count" != 0 ]]; then
    out+="%{$fg[red]%}$unstaged_added_count++"
  fi

  local unstaged_deleted_count=$(count_expr '^.D' "$STATUS")
  if [[ "$unstaged_deleted_count" != 0 ]]; then
    out+="%{$fg[red]%}${unstaged_deleted_count}--"
  fi

  local untracked_count=$(count_expr '^\?\?' "$STATUS")
  if [[ "$untracked_count" != 0 ]]; then
    out+="%{$fg[red]%}${untracked_count}?"
  fi

  echo " %{$reset_color%}(${out}%{$reset_color%})"
}

function git_prompt_info() {
  local ref
  ref=$(command git symbolic-ref HEAD 2> /dev/null) || \
    ref=$(command git rev-parse --short HEAD 2> /dev/null) || return 0
  echo -n "%{$fg[green]%}[${ref#refs/heads/}$(parse_git_dirty)%{$fg[green]%}]%{$reset_color%} "
}
