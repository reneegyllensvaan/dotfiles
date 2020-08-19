(require 'org-inlinetask)
(use-package org-bullets :ensure t)

; Export org documents without numbered headings
(setq-default org-export-with-section-numbers nil)

(defun hecate-hooks-org-mode ()
  (org-bullets-mode +1)
  (toggle-truncate-lines -1)
  (adaptive-wrap-prefix-mode +1)
  (toggle-word-wrap +1)
  )

(hecate-major-mode-def
  :states '(normal motion emacs)
  :keymaps 'org-mode-map

  ","   'org-ctrl-c-ctrl-c
  "<"   'org-promote-subtree
  ">"   'org-demote-subtree
  "c"   '(nil                      :which-key "quick-commands")
  "cc"  'org-ctrl-c-ctrl-c
  "di"  'org-display-inline-images
  "et"  'org-set-tags-command
  "f"   '(org-emphasize            :which-key "format-text")
  "s"   '(org-insert-subheading    :which-key "subheading")
  "t"   '(nil                      :which-key "todo")
  "tR"  'org-table-recalculate-buffer-tables
  "tl"  'org-toggle-link-display
  "tr"  'org-table-recalculate
  "tt"  '(org-todo                 :which-key "toggle-todo")
  "x"   '(nil                      :which-key "export")
  "xp"  'org-latex-export-to-pdf

  )

;; Rebind tab key for org mode to prevent C-i overriding it when evil is loaded
(evil-define-key 'normal evil-normal-state-map (kbd "TAB") 'org-cycle)

(setq-default org-startup-with-inline-images t)

(org-babel-do-load-languages
 'org-babel-load-languages
 '(
   (dot . t)
   (shell . t)
   ))

(add-hook 'org-mode-hook 'hecate-hooks-org-mode)
