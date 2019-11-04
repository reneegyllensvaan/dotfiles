;; Demand packages again here just to make sure they're loaded
;; (just in case we comment them out or remove them from another layer)
(use-package centered-window :ensure t)
(use-package centered-cursor-mode :ensure t)
(use-package hide-mode-line :ensure t)
(use-package focus :ensure t)

(defun dark-magic (enable)
  (progn
    (olivetti-mode enable)
    (centered-cursor-mode enable)
    (hide-mode-line-mode enable)
    (focus-mode enable)
    (toggle-maximize-buffer)
    (put 'dark-magic 'state (not enable))
    ;; (if enable
    ;;   (unless (= 1 (length (window-list)))
    ;;     (toggle-maximize-buffer) ))
    ;; (unless enable
    ;;   (toggle-maximize-buffer))
))

(defun dark-magic-on () (interactive) (dark-magic +1))
(defun dark-magic-off () (interactive) (dark-magic -1))
