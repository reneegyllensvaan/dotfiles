
;; Leader key bindings
(use-package general
  :ensure t
  :bind
  ("C-k" . nil)
  ("M-1" . winum-select-window-1)
  ("M-2" . winum-select-window-2)
  ("M-3" . winum-select-window-3)
  ("M-4" . winum-select-window-4)
  ("M-5" . winum-select-window-5)
  ("M-6" . winum-select-window-6)
  ("M-7" . winum-select-window-7)
  ("M-8" . winum-select-window-8)
  ("M-9" . winum-select-window-9)
  ;; zoom
  ("M-=" . text-scale-increase)
  ("M--" . text-scale-decrease)
  ("M-0" . text-scale-set)

  ;; M-Shift-_ bindings for global non-editing commands
  ("M-B" . helm-mini)
  ("M-C" . centered-cursor-mode)

  ; unbind save-quit
  ("C-x C-c" . nil)
  ;; Do all SPC unbinding here
  (:map evil-normal-state-map
	("," . nil)
	("zu" . vimish-fold-delete)
	)
  (:map evil-motion-state-map
    ("SPC" . nil)
    ("RET" . nil)
    ("," . nil) )
  (:map help-mode-map
    ("SPC" . nil))
  (:map magit-mode-map
    ("SPC" . nil))
  (:map magit-diff-mode-map
    ("SPC" . nil))
  (:map compilation-mode-map
    ("SPC" . nil))
  (:map mu4e-view-mode-map
    ("SPC" . nil))
  (:map mu4e-main-mode-map
    ("SPC" . nil))
  :config
  (general-def :states '(normal motion emacs) "SPC" nil)
  (general-create-definer
    hecate-major-mode-def
    :global-prefix "SPC m"
    :prefix ","
    )
  (general-define-key
   :states '(
     normal
     visual
     motion
     emacs
   )
   :keymaps '(
     normal
     visual
     motion
     global
   )
   ;; override)
   :prefix "SPC"

   ;; Quick commands
   "TAB"  '(evil-switch-to-windows-last-buffer :which-key "last-buffer")
   "SPC"  '(helm-M-x                        :which-key "M-x")
   "/"    'helm-projectile-ag
   "|"    'shell-command-on-region
   "C-/"  '(helm-do-ag-this-file            :which-key "helm-this-file-ag")
   "M-/"  '(projectile-ag                   :which-key "project-ag")
   ";"    '(evilnc-comment-operator         :which-key "evilnc-comment-operator")
   "u"    '(universal-argument              :which-key "universal-argument")

   ;;;; Applications
   "a"    '(nil                             :which-key "applications")
   "aM"   'mu4e
   "aC"   'helm-mu-contacts
   "am"   '(nil                             :which-key "music")
   "ams"  '(nil                             :which-key "spotify")
   "amsN" 'spotify-previous
   "amsg" '(helm-spotify-plus               :which-key "helm-spotify")
   "amsn" 'spotify-next
   "amsp" 'spotify-playpause
   "at"   'ansi-term

   ;;;; Buffers
   "b"    '(nil                             :which-key "buffer")
   "b/"   'helm-do-ag-buffers
   "bI"   'ibuffer
   "bb"   'helm-mini
   "bd"   'kill-this-buffer
   "bi"   'imenu-list-smart-toggle
   "bn"   'next-buffer
   "bN"   '(previous-buffer                 :which-key "prev-buffer")
   "bp"   '(previous-buffer                 :which-key "prev-buffer")

   ;;;; Frame
   "F"    '(nil                             :which-key "files")
   "Fo"   'other-frame

   ;;;; Emacs
   "E"    '(nil                             :which-key "Emacs")
   "Eb"   'eval-buffer
   "Ef"   '(helm-emacs-d                    :which-key "helm-emacs.d")
   "Er"   'eval-region

   ;;;; Emacs
   "e"    '(nil                             :which-key "errors/flycheck")
   "el"   'list-flycheck-errors

   ;;;; Files
   "f"    '(nil                             :which-key "files")
   "fW"   '(write-file                      :which-key "save-buffer-as")
   "ff"   'helm-find-files
   "fw"   'save-buffer

   ;;;; Git/magit
   "g"    '(nil                             :which-key "git")
   "gG"   'magit-status
   "gb"   'magit-blame
   "gd"   'magit-diff-buffer-file
   "gf"   '(helm-ls-git-ls                  :which-key "helm-ls-git")
   "gg"   '(nil                             :which-key "github-gist")
   "ggB"  'gist-buffer-private
   "ggR"  'gist-region-private
   "ggb"  'gist-buffer
   "ggr"  'gist-region
   "gr"   'magit-refresh
   "gs"   '(minibuffer-git-status           :which-key "git-status")

   ;;;; Help
   "h"    '(nil                             :which-key "help")
   "hK"   'which-key-show-top-level
   "hkk"  'which-key-show-keymap

   ;;;; Layout/perspective
   "l"    '(nil                             :which-key "layout/persp")
   "lK"   'persp-kill
   "la"   'persp-add-buffer
   "li"   'persp-import
   "lj"   'persp-next
   "lk"   'persp-prev
   "ll"   'persp-switch
   "lr"   'persp-rename
   "lx"   'persp-remove-buffer

   ;;;; Kill ring
   "k"    '(nil                             :which-key "kill-ring")
   "kk"   'helm-show-kill-ring

   ;; major mode
   "m"    '(nil                             :which-key "major-mode")

   ;; text Operations
   "o"    '(nil                             :which-key "projectile")
   "ol"   'sort-lines

   ;; Projects (projectile)
   "p"    '(nil                             :which-key "projectile")
   "pf"   'helm-projectile-find-file
   "pp"   'helm-projectile-switch-project

   ;;;; Toggles
   "t"    '(nil                             :which-key "toggles")
   "tE"   'emacs-word-mode
   "tF"   'focus-mode
   "tR"   'ruler-mode
   "tV"   'vim-word-mode
   "tW"   '(toggle-word-wrap                :which-key "word-wrap")
   "taw"  '(adaptive-wrap-prefix-mode       :which-key "adaptive-wrap")
   "tcC"  '(global-centered-cursor-mode     :which-key "global-centered-cursor")
   "tcb"  '(olivetti-mode                   :which-key "centered-buffer")
   "tcc"  '(centered-cursor-mode            :which-key "centered-cursor")
   "tdM"  'dark-magic-on
   "tdm"  'dark-magic-off
   "tg"   '(nil                             :which-key "VCS")
   "tgd"  'diff-hl-mode
   "tgmd" 'diff-hl-master
   "tgud" 'diff-hl-unstaged
   "thA"  '(global-auto-highlight-symbol-mode :which-key "global-auto-highlight-symbol")
   "tha"  '(auto-highlight-symbol-mode      :which-key "auto-highlight-symbol")
   "thi"  '(highlight-indentation-mode      :which-key "highlight-indentation")
   "thl"  '(nil                             :which-key "hide-lines")
   "thla" '(hide-lines-show-all             :which-key "hl-show-all")
   "thlm" '(hide-lines-matching             :which-key "hl-matching")
   "thln" '(hide-lines-not-matching         :which-key "hl-not-matching")
   "tiA"  '(global-aggressive-indent-mode   :which-key "aggressive-indent-global")
   "tia"  '(aggressive-indent-mode          :which-key "aggressive-indent")
   "tl"   '(toggle-truncate-lines           :which-key "truncate-lines")
   "tn"   'linum-mode
   "tpF"  '(nil                             :which-key "pin-focus")
   "tpF"  'focus-pin
   "tpf"  'focus-unpin
   "tpr"  '(rainbow-delimiters-mode         :which-key "rainbow-delimiters")
   "tr"   '(linum-relative-mode             :which-key "linum-relative")
   "tsb"  'scroll-bar-mode
   "tw"   'whitespace-mode

   ;;;; Theming/appearance
   "T"    '(nil                             :which-key "theming/appearance")
   "Ts"   'helm-themes
   "TM"   'hide-mode-line-mode

   ;;;; Windows
   "1"    '(winum-select-window-1           :which-key "winum-select-win-1")
   "2"    '(winum-select-window-2           :which-key "winum-select-win-2")
   "3"    '(winum-select-window-3           :which-key "winum-select-win-3")
   "4"    '(winum-select-window-4           :which-key "winum-select-win-4")
   "5"    '(winum-select-window-5           :which-key "winum-select-win-5")
   "6"    '(winum-select-window-6           :which-key "winum-select-win-6")
   "7"    '(winum-select-window-7           :which-key "winum-select-win-7")
   "8"    '(winum-select-window-8           :which-key "winum-select-win-8")
   "9"    '(winum-select-window-9           :which-key "winum-select-win-9")
   "w"    '(nil                             :which-key "window")
   ;;window nav
   "wH"   '(evil-window-move-far-left       :which-key "win-move-left")
   "wJ"   '(evil-window-move-very-bottom    :which-key "win-move-bottom")
   "wK"   '(evil-window-move-very-top       :which-key "win-move-up")
   "wL"   '(evil-window-move-far-right      :which-key "win-move-right")
   "wh"   '(windmove-left                   :which-key "win-move-left")
   "wj"   '(windmove-down                   :which-key "win-move-bottom")
   "wk"   '(windmove-up                     :which-key "win-move-up")
   "wl"   '(windmove-right                  :which-key "win-move-right")
   ;;window splitting
   "w-"   '(split-window-below              :which-key "split-bottom")
   "w/"   '(split-window-right              :which-key "split-right")
   ;;other window commands
   "w C-=" 'balance-windows-area
   "w<"   '(evil-window-decrease-width      :which-key "win-decrease-width")
   "w="   'balance-windows
   "w>"   '(evil-window-increase-width      :which-key "win-increase-width")
   "wF"   'make-frame
   "wG"   'golden-ratio
   "wU"   'winner-redo
   "wd"   'delete-window
   "wm"   'toggle-maximize-buffer
   "wu"   'winner-undo

   ;; Handy macros / Binaries
   "q"    '(nil                             :which-key "exec-bin")
   "qsl"  '(comma-line-split                :which-key "comma-line-split")
   )
  ;;;;;;;;; Rename which-key keybindings
  ;;;;;;;;; (Stolen with love from spacemacs)
  ;; Rename the entry for M-1 in the SPC h k Top-level bindings,
  ;; and for 1 in the SPC- Spacemacs root, to 1..9
  (push '(("\\(.*\\)1" . "winum-select-window-1") .
	  ("\\11..9" . "winum-select-window1..9"))
	which-key-replacement-alist)

  ;; Hide the entries for M-[2-9] in the SPC h k Top-level bindings,
  ;; and for [2-9] in the SPC- Spacemacs root
  (push '((nil . "winum-select-window-[2-9]") . t)
       which-key-replacement-alist)

  (push '(("\\(.*\\)1" . "eyebrowse-switch-to-window-config-1") .
	  ("\\11..9" . "eyebrowse-switch-1..9"))
	which-key-replacement-alist)

  ;; Hide the entries for M-[2-9] in the SPC h k Top-level bindings,
  ;; and for [2-9] in the SPC- Spacemacs root
  (push '((nil . "eyebrowse-switch-to-window-config-[2-9]") . t)
       which-key-replacement-alist)
  )
