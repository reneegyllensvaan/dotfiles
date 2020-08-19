; Python
; not using lsp-python, in favor of eglot
;; (use-package lsp-python :ensure t
;;   :config
  (hecate-major-mode-def
    :states '(normal motion emacs)
    :keymaps 'python-mode-map
    "g"   '(nil                      :which-key "goto")
    "gg"  '(xref-find-definitions    :which-key "goto-definition")
    )
  ;; )
