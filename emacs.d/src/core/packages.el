;; Get environment files
(use-package exec-path-from-shell :ensure t
  :config
  ;; This should maybe be cached, but tbh startup time isn't that crucial to me
  (exec-path-from-shell-initialize)
  ;; set env for binaries that need explicit paths
  )


(use-package which-key
  :ensure t
  :init
  (setq which-key-separator " ")
  (setq which-key-prefix-prefix "+")
  :config
  (which-key-mode 1))

(use-package projectile
  :ensure t
  :init
  (setq projectile-require-project-root nil)
  :config
  (projectile-mode 1))

(use-package olivetti :ensure t
  :init (setq-default olivetti-minimum-body-width whitespace-line-column))
(use-package perspective :ensure t
  :config (persp-mode +1))
(use-package origami :ensure t
  :config (global-origami-mode +1))
(use-package imenu-list :ensure t
  :config
  (setq-default imenu-list-auto-resize nil)
  (setq-default  imenu-list-size 35)
  )

(use-package editorconfig :ensure t
  :config (editorconfig-mode
	   (symbol-value 'hecate-config-use-editorconfig)))
(use-package winum :ensure t :config (winum-mode +1))
(use-package auto-highlight-symbol :ensure t
  :config (setq ahs-idle-interval 0.5))

;; Bracket stuff
(use-package rainbow-delimiters :ensure t
  :config (rainbow-delimiters-mode +1))
(use-package autopair :ensure t
  :config (autopair-global-mode +1))
(use-package highlight-parentheses :ensure t
  :config (global-highlight-parentheses-mode +1))

;; Random stuff after this line
(use-package spotify :ensure t)
(use-package helm-spotify-plus :ensure t)
(use-package hide-lines :ensure t)
(use-package aggressive-indent :ensure t)
(use-package highlight-indentation :ensure t)
(use-package golden-ratio :ensure t)
(use-package no-littering :ensure t)
(require 'no-littering)
