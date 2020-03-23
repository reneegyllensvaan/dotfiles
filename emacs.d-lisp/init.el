;; load essential elisp for setting config symbol values
(load-file (expand-file-name "./essential.el" user-emacs-directory))

(setq-default hecate-config-base-dir (expand-file-name "~/.emacs.d/"))
(setq-default hecate-config-prefix "SPC")
(setq-default hecate-config-use-editorconfig +1)
(setq-default hecate-config-non-normal-prefix "M-SPC")
(setq-default hecate-config-grep-command "rg --no-heading")
(setq-default hecate-config-highlight-current-line +1)
(setq-default hecate-config-default-font "Source Code Pro-13")
(setq-default hecate-config-welcome-message "my teensy lisp ide")
(setq-default hecate-config-welcome-image nil)
(setq-default hecate-config-welcome-message nil)
(setq-default whitespace-line-column 90)
;(load-file (expand-file-name "~/.emacs-secrets.el"))
(set-face-attribute 'default nil :font (symbol-value 'hecate-config-default-font) )
(set-frame-font (symbol-value 'hecate-config-default-font) nil t)

(hecate-init-load-file "core/main.el")
(vim-word-mode);; default to vim word mode (_ as word character)
(hecate-init-load-file "lang/main.el")

;(use-package yasnippet :ensure t)
;(setq-default yas-snippet-dirs '("/Users/renee/.emacs.d/src/yasnippet"))
;(yas-reload-all)
;(yas-global-mode)

;; Looking for Customize settings? Look over there:
(setq custom-file "~/.emacs.d/custom.el")
;; It's unloaded by default, because I don't like the concept and don't use it
;(load custom-file 'noerror)
