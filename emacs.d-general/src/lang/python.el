;; Python
;; (use-package elpy :ensure t
;;   :config (elpy-enable))

(use-package ein :ensure t
  :config
  (hecate-major-mode-def
    :states '(normal motion emacs)
    :keymaps 'ein:notebook-multilang-mode-map

    "C"    '(nil                                       :which-key "Cell")
    "Cj"   '(ein:worksheet-insert-cell-below           :which-key "insert-cell-below")
    "Ck"   '(ein:worksheet-insert-cell-above           :which-key "insert-cell-above")
    "Cx"   '(ein:worksheet-delete-cell                 :which-key "delete-cell")
    "c"    '(nil                                       :which-key "compilation/running")
    "cc"   '(ein:worksheet-execute-cell                :which-key "execute-cell")
    ","    '(ein:worksheet-execute-cell                :which-key "execute-cell")
    "."    '(ein:worksheet-clear-output                :which-key "clear-output")
    "fw"   '(ein:notebook-save-notebook-command        :which-key "save-notebook")
    "rr"   '(ein:notebook-restart-session-command      :which-key "restart-session")

    )
  )
