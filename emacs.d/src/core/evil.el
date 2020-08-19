;; Evil (vim) mode
(use-package evil
  :ensure t
  :bind
  (:map evil-insert-state-map
	("C-l" . 'helm-show-kill-ring)
	)
  (:map evil-visual-state-map
	("s" .   'evil-surround-region)
	("i i" . 'evil-indent-plus-i-indent)
	("a i" . 'evil-indent-plus-a-indent)
	)
  :init
  (setq evil-want-C-u-scroll t)
  :config
  (setq evil-motion-state-modes
	(append evil-emacs-state-modes evil-motion-state-modes))
  (setq evil-emacs-state-modes nil)
  ;; set all evil initial state modes here
  (evil-set-initial-state 'mu4e-view-mode    'motion)
  (evil-set-initial-state 'mu4e-main-mode    'emacs)
  (evil-set-initial-state 'mu4e-headers-mode 'emacs)
  (evil-set-initial-state 'magit-popup-mode  'emacs)
  (evil-mode 1))

(setq scroll-step 1
      scroll-conservatively  10000)

;; Evil-ify other packages
(use-package evil-magit :ensure t
  :bind
   (:map magit-popup-mode-map
   ("<escape>" . 'kill-this-buffer))
)

(use-package vimish-fold :ensure t
  :bind
  (:map evil-normal-state-map
	("zf" . 'vimish-fold))
  :config (vimish-fold-global-mode +1))
(use-package evil-mu4e :ensure t
  :bind
  (:map mu4e-headers-mode-map
   ("k" . mu4e-headers-prev)
   ("j" . mu4e-headers-next)
   )
  (:map mu4e-view-mode-map
   ("C-k" . mu4e-view-headers-prev)
   ("C-j" . mu4e-view-headers-next)
   )
  :init
   (setq-default mu4e-completing-read-function 'completing-read)
 )

(use-package evil-org :ensure t)
(use-package evil-nerd-commenter :ensure t)
(use-package anzu :ensure t)
(use-package evil-anzu :ensure t)
(use-package evil-indent-plus :ensure t)
(use-package evil-surround :ensure t
  :config (evil-surround-mode +1))
(use-package evil-lion :ensure t
  :config (evil-lion-mode +1))
(use-package evil-matchit :ensure t
  :config (evil-matchit-mode +1))
