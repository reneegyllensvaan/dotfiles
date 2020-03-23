;; Stolen with love from: https://gist.github.com/mads-hartmann/3402786
(defun toggle-maximize-buffer () "Maximize buffer" (interactive)
       (if (= 1 (length (window-list)))
           (jump-to-register '_)
         (progn
           (set-register '_ (list (current-window-configuration)))
           (delete-other-windows))))

(defun helm-emacs-d () (interactive)
  (helm-projectile-find-file
    (expand-file-name user-emacs-directory)))

(defun emacs-word-mode () (interactive)
  (modify-syntax-entry ?_ "_"))

(defun diff-hl-unstaged () (interactive)
  (setq diff-hl-reference-revision nil))

(defun diff-hl-master () (interactive)
  (setq diff-hl-reference-revision "master"))

(defun vim-word-mode () (interactive)
  (modify-syntax-entry ?_ "w"))

(bind-key "<escape>" 'isearch-cancel isearch-mode-map)
(winner-mode +1)
