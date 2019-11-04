(use-package js2-mode :ensure t
  :config
  (add-hook 'js2-mode #'evil-normalize-keymaps)
  )

(use-package skewer-mode :ensure t
  ;; :config
  ;; (add-hook 'js2-mode #'evil-normalize-keymaps)
  )

;(defun hecate-major-mode-key (map keys)
;  (general-define-key
;   :states '(normal motion visual)
;   :keymaps '(js2-mode-map override)
;   :prefix "SPC"
;   keys
;   )
;  )

