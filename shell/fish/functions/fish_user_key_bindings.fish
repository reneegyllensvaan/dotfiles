function fish_user_key_bindings
  # fzf_key_bindings
  if test -r /usr/local/opt/mcfly/mcfly.fish
    source /usr/local/opt/mcfly/mcfly.fish
    mcfly_key_bindings
  end
end
