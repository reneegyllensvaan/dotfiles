#!/bin/sh
cat << EOF
[core]
  excludesfile = $HOME/.gitignore_global

[status]
	relativePaths = true

[user]
  name = $USER_NAME
  email = $USER_EMAIL
  `[ "$GIT_SIGNING_KEY" ] && echo "signingkey = $GIT_SIGNING_KEY"`

[commit]
  `[ "$GIT_SIGNING_KEY" ] && echo "gpgsign = true"`

[gpg]
  program = gpg

[github]
  user = $GITHUB_USER

[hub]
  protocol = ssh

[init]
  defaultBranch = main

[maintenance]
	strategy = incremental
	auto = true
[maintenance "gc"]
	enable = true
[maintenance "commit-graph"]
	enable = true
[maintenance "prefetch"]
	enable = true
[maintenance "loose-objects"]
	enable = true
[maintenance "incremental-repack"]
	enable = true

[alias]
  a   = add
  aa  = add --all
  b   = branch
  c   = commit
  ca  = commit --amend
  canoe = commit --amend --no-edit
  canoera = commit --amend --no-edit --reset-author
  cp  = cherry-pick
  d   = diff
  ds  = diff --staged
  l   = log
  lo  = log --pretty=oneline
  ls-files-root = "! git ls-files"
  o   = checkout
  pop = stash pop
  pm  = pull --rebase=false
  pr  = pull --rebase
  pf  = pull --ff-only
  pushu = "! git push -u origin \`git branch --show-current\`"
  r   = rebase
  rc  = rebase --continue
  ri  = rebase -i
  root = "! git rev-parse --show-toplevel"
  s   = status

  w   = worktree
  wl  = worktree list

  z   = stash
  za  = stash apply
  zl  = stash list
  zs  = stash show

[tig "color"]
	cursor		= default	0 underline
	title-blur	= white	blue
	title-focus	= white	blue	bold
[tig "color.tree"]
	date		= cyan	default	bold

[core]
    pager = delta

[interactive]
    diffFilter = delta --color-only

[delta]
    features = side-by-side line-numbers decorations
    whitespace-error-style = 22 reverse
[delta "decorations"]
    commit-decoration-style = bold yellow box ul
    file-style = bold yellow ul
    file-decoration-style = none
EOF
exit 0
