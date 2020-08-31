function fish_prompt --description 'Simple two-line prompt'
  #Save the return status of the previous command
  set -l last_pipestatus $pipestatus

  printf '\n%s%s  %s%s \n %s %s>%s ' \
  (set_color brblue) (string replace "$HOME" '~' $PWD) \
  (set_color brgreen) (printf "%s " (fish_git_prompt)) \
  (fish_mode_prompt) (set_color brgreen) (set_color normal)
end
