;(use-package magithub :ensure t
;  :config (magithub-feature-autoinject t)
;  ;; (hecate-major-mode-def
;  ;;   :states '(normal motion emacs)
;  ;;   :keymaps 'git-commit-mode-map
;  ;;   ;; "g"   '(nil                      :which-key "goto")
;  ;;   ","  'with-editor-finish
;  ;;   )
;  )
;(require 'magithub)
;(use-package magit :ensure t)
;(use-package gist :ensure t)
;(use-package diff-hl :ensure t)
;
;(defun minibuffer-git-status () (interactive)
;       (message (shell-command-to-string "git status"))
;       )
