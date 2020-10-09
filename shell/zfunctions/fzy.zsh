__fzy-expand-file () {
  # TODO IDEA: some type of grammar engine here for fuzzy completion of commands. Via completion?
  LBUFFER="$LBUFFER`fd . | head -n 10000 | fzy --prompt="${LBUFFER}"`"
  local ret=$?
  zle reset-prompt
  return $ret
}

__fzy-git-files () {
  LBUFFER="$LBUFFER`git status -s | fzy | awk '{print $2}'`"
  local ret=$?
  zle reset-prompt
  return $ret
}

__fzy-command-history () {
  # Fzy or the shell hate really long lines, so limit the length of inputs here
  LBUFFER="`fc -rl 1 | cut -c -200 | fzy | cut -s -d ' ' -f 3-`"
  local ret=$?
  zle reset-prompt
  return $ret
}

__git-short-status () {
  echo ''
  git status -s
  echo ''
  echo ''
  zle reset-prompt
}

#git status --porcelain | fzy | awk {print $2}

# Register functions as zle widgets
zle -N __fzy-expand-file
zle -N __fzy-command-history
zle -N __fzy-git-files
zle -N __git-short-status

# Bind widgets to keys
bindkey '^T' __fzy-expand-file
# bindkey '^R' __fzy-command-history
bindkey '^G' __fzy-git-files

bindkey '^O' __git-short-status
