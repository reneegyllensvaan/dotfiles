;(setq-default
; mu4e-mu-binary
; (replace-regexp-in-string
;  "\n" ""
;  (shell-command-to-string "which mu") ))
;
;(require 'mu4e)
;(hecate-major-mode-def
;  :states '(normal motion emacs)
;  :keymaps 'mu4e-compose-mode-map
;  "o"   '(nil                             :which-key "org")
;  "oo"  'mu4e-org-mode
;  "oh"  'org-mime-htmlize
;  "s"   '(nil                             :which-key "crypto")
;  "ss"  '(nil                             :which-key "sign")
;  "ssp" '(mml-secure-message-sign-pgpmime :which-key "sign-pgpmime")
;  :keymaps 'mu4e-org-mode-map
;  "4"   'org-mime-htmlize
;  )
;(use-package org-mime :ensure t)
