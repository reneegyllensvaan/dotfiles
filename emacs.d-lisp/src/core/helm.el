;; Helm
(use-package helm
             :ensure t
             :bind
             (:map helm-map
                   ("C-j" . 'helm-next-line)
                   ("C-k" . 'helm-previous-line)
                   ("C-l" . 'helm-execute-persistent-action)
                   ("C-w" . 'evil-delete-backward-word)
                   ("<escape>" . 'helm-keyboard-quit)
                   ("C-z" . 'helm-select-action)
                   ("TAB" . 'helm-execute-persistent-action)
                   )
             (:map helm-find-files-map
                   ("C-h" . 'helm-find-files-up-one-level)
                   )
             :init
             (setq helm-M-x-fuzzy-match t
                   helm-mode-fuzzy-match t
                   helm-buffers-fuzzy-matching t
                   helm-recentf-fuzzy-match t
                   helm-locate-fuzzy-match t
                   helm-semantic-fuzzy-match t
                   helm-imenu-fuzzy-match t
                   helm-completion-in-region-fuzzy-match t
                   helm-candidate-number-list 150
                   helm-split-window-in-side-p t
                   helm-move-to-line-cycle-in-source t
                   helm-echo-input-in-header-line t
                   helm-autoresize-max-height 0
                   helm-autoresize-min-height 20)
             ;; loop over to other sources on overflow
             (setq helm-move-to-line-cycle-in-source nil)
             (add-to-list 'display-buffer-alist
                          `(,(rx bos "*helm" (* not-newline) "*" eos)
                             (display-buffer-in-side-window)
                             (inhibit-same-window . t)
                             (window-height . 0.4)))
             :config
             (helm-mode 1))

(use-package helm-projectile :ensure t)
(use-package helm-ls-git :ensure t)
(use-package helm-rg :ensure t )
(use-package helm-themes :ensure t)
(defalias 'execute-extended-command 'helm-M-x)
;; (custom-set-variables
;;  '(helm-ag-base-command (symbol-value 'hecate-config-grep-command))
;;)
