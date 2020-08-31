function fish_mode_prompt
  switch $fish_bind_mode
    case default
      echo "N"
    case insert
      echo "I"
    case normal
      echo "N"
    case visual
      echo "V"
    case replace_one
      echo "R"
  end
end
