;; This file is unloaded by default, until LSP support seems to work fine
;;
;;    these entries should be self-contained, and should be independent of loading in any other files


; General LSP support
(use-package company :ensure t
  :bind
  (:map
   company-active-map
   ("C-j" . 'company-select-next)
   ("C-k" . 'company-select-previous)
   ("C-w" . 'evil-delete-backward-word)
   )
  :init (add-hook 'prog-mode-hook 'company-mode)
  :config (setq company-tooltip-align-annotations t)
  (setq company-minimum-prefix-length 1)
  )

(use-package flycheck :ensure t
  :init (add-hook 'prog-mode-hook 'flycheck-mode))
;; (use-package eglot :ensure t)

;; Rust
(use-package rust-mode
  :ensure t
  :config
  (hecate-major-mode-def
    :states '(normal motion emacs)
    :keymaps 'rust-mode-map
    "g"   '(nil                      :which-key "goto")
    "gg"  '(xref-find-definitions    :which-key "goto-definition")
    )
)
(use-package cargo
  :hook (rust-mode . cargo-minor-mode)
  :config
  (hecate-major-mode-def
    :states '(normal motion emacs)
    :keymaps 'cargo-minor-mode-map
    "c"   '(nil                      :which-key "compilation")
    "cc"  '(cargo-process-build      :which-key "cargo-build")
    "ck"  '(cargo-process-check      :which-key "cargo-check")
    "cr"  '(cargo-process-run        :which-key "cargo-run")
    )
)
(use-package lsp-mode :ensure t)

(use-package lsp-ui :ensure t
  :init (add-hook 'lsp-mode-hook 'lsp-ui-mode))

(use-package company-lsp :ensure t
  :init (push 'company-lsp company-backends))

(hecate-init-load-file-relative "lsp-python.el")

;; ; Rust
;; (use-package rust-mode :ensure t)
;; (use-package flycheck-rust :ensure t
;;   :init (with-eval-after-load 'rust-mode (add-hook 'flycheck-mode-hook 'flycheck-rust-setup)))
;; (use-package lsp-rust :ensure t
;;   :config (setq lsp-rust-rls-command '("rustup" "run" "nightly" "rls"))
;;   :init (add-hook 'rust-mode-hook 'lsp-rust-enable))
