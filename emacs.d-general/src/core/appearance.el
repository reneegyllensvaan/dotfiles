;; Minimal UI
(scroll-bar-mode -1)
(tool-bar-mode   -1)
(tooltip-mode    -1)
(menu-bar-mode   -1)

;; adaptive indent for wrapping lines
(use-package adaptive-wrap :ensure t)

;; line numbers
(use-package hlinum :ensure t)
(defvar linum-relative-current-symbol "")
(use-package linum-relative :ensure t :init
  ;;enable this to use the native backend, without highlighting
  ;(setq linum-relative-backend 'display-line-numbers-mode)
  )

(use-package all-the-icons :ensure t)

(use-package doom-modeline :ensure t
  :defer t
  :hook (after-init . doom-modeline-init))


;; Theme
(use-package material-theme :ensure t)
(use-package atom-one-dark-theme :ensure t)
(use-package zenburn-theme :ensure t)
(use-package dracula-theme :ensure t)
;; default theme
(load-theme 'atom-one-dark t)

;; Apply config variables
(global-hl-line-mode (symbol-value 'hecate-config-highlight-current-line))

(use-package dashboard
  :ensure t
  :init
  (setq dashboard-banner-logo-title hecate-config-welcome-message)
  (setq dashboard-startup-banner hecate-config-welcome-image)
  (setq dashboard-image-banner-max-height 1)
  :config
  (dashboard-setup-startup-hook))

(setq initial-buffer-choice (lambda () (get-buffer "*dashboard*")))
