;; load essential elisp for setting config symbol values
(load-file (expand-file-name "./essential.el" user-emacs-directory))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Base directory for hecate files
;; DEFAULT: "~/.emacs.d/"
(setq-default hecate-config-base-dir (expand-file-name "~/.emacs.d/"))

;; The prefix key to use for leader commands
;; DEFAULT: "SPC"
(setq-default hecate-config-prefix "SPC")

;; Use .editorconfig files
;; DEFAULT: +1 (enabled)
(setq-default hecate-config-use-editorconfig +1)

;; The prefix key to use for leader commands in non-normal mode
;; DEFAULT: "M-SPC"
(setq-default hecate-config-non-normal-prefix "M-SPC")

;; Which command to use for grepping
;; DEFAULT: "Source Code Pro-13"
(setq-default hecate-config-grep-command "rg --no-heading")

;; Highlight current cursor line
;; DEFAULT: +1
(setq-default hecate-config-highlight-current-line +1)

;; Font to use
;; DEFAULT: "Source Code Pro-13"
(setq-default hecate-config-default-font "Source Code Pro-13")

;; Welcome message for the dashboard
;; DEFAULT: "Welcome to Hecate Emacs"
(setq-default hecate-config-welcome-message "welcome to my myspace page!!!111")
(setq-default hecate-config-welcome-image nil)

;; Welcome image for the dashboard
;; DEFAULT: nil
(setq-default hecate-config-welcome-message nil)

;; Image for the dashboard
;; DEFAULT: "$CONFIG_DIR/splash.png"
;(setq-default hecate-config-welcome-image (hecate-base-dir "splash.png"))

;; add mu4e directory to load path and require it
;; TODO generalize this
;(add-to-list 'load-path "/usr/share/emacs/site-lisp/mu4e")
;(add-to-list 'load-path "/usr/local/Cellar/mu/1.2.0_1/share/emacs/site-lisp/mu/mu4e")
;(require 'mu4e)

;; The default maximum number of recommended characters per line
;; Default is 80, I've got it at 90 bc that's what we have at my job
(setq-default whitespace-line-column 90)

(load-file (expand-file-name "~/.emacs-secrets.el"))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(set-face-attribute 'default nil :font (symbol-value 'hecate-config-default-font) )
(set-frame-font (symbol-value 'hecate-config-default-font) nil t)

(hecate-init-load-file "core/main.el")
(vim-word-mode);; default to vim word mode (_ as word character)
(hecate-init-load-file "lang/main.el")

(use-package yasnippet :ensure t)
(setq-default yas-snippet-dirs '("/Users/renee/.emacs.d/src/yasnippet"))
(yas-reload-all)
(yas-global-mode)

;; Looking for Customize settings? Look over there:
(setq custom-file "~/.emacs.d/custom.el")
;; It's unloaded by default, because I don't like the concept and don't use it
;(load custom-file 'noerror)
