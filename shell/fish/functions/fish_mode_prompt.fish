function fish_mode_prompt
  switch $fish_bind_mode
    case default
      set_color brgreen
      echo "N"
    case insert
      set_color brwhite
      echo "I"
    case normal
      set_color brgreen
      echo "N"
    case visual
      set_color brmagenta
      echo "V"
    case replace_one
      set_color brred
      echo "R"
  end
end
