(use-package js2-mode :ensure t
  :config
;  (evil-define-key 'normal 'js2-mode
;    (kbd "SPC '") 'minibuffer-git-status)
  (add-hook 'js2-mode #'evil-normalize-keymaps)
  )

;(bind-key "," nil js2-mode-map)

;(defun hecate-major-mode-key (map keys)
;  (general-define-key
;   :states '(normal motion visual)
;   :keymaps '(js2-mode-map override)
;   :prefix "SPC"
;   keys
;   )
;  )
