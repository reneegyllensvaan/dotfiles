;; Disable GC during init
(setq gc-cons-threshold 64000000)
(add-hook 'after-init-hook #'(lambda ()
                               ;; restore after startup
                               (setq gc-cons-threshold 800000)))

;; Package configs
(require 'package)
(setq package-enable-at-startup nil)
(setq package-archives '(("org"   . "http://orgmode.org/elpa/")
                         ("gnu"   . "http://elpa.gnu.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")))
(package-initialize)
;(unless package--initialized (package-initialize t))

;; Bootstrap `use-package'
(unless (package-installed-p 'use-package) ; unless it is already installed
  (package-refresh-contents) ; updage packages archive
  (package-install 'use-package)) ; and install the most recent version of use-package

(require 'use-package)

;; General settings
(defalias 'yes-or-no-p 'y-or-n-p)
(add-to-list 'default-frame-alist '(height . 24))
(add-to-list 'default-frame-alist '(width . 80))
(setq-default buffer-file-coding-system 'utf-8-unix)

(defun no-junk-please-were-unixish ()
  (let ((coding-str (symbol-name buffer-file-coding-system)))
    (when (string-match "-\\(?:dos\\|mac\\)$" coding-str)
      (set-buffer-file-coding-system 'unix))))
(add-hook 'find-file-hooks 'no-junk-please-were-unixish)

;; Nice core commands
(defun hecate-base-dir (TAILPATH)
  (replace-regexp-in-string "//+" "/"
    (expand-file-name (concat
      (symbol-value 'hecate-config-base-dir)
      TAILPATH))))

(defun hecate-base-dir-src (TAILPATH)
  (replace-regexp-in-string "//+" "/"
    (concat (hecate-base-dir (concat "src/" TAILPATH) )) ))

(defun hecate-init-load-file (TAILPATH)
  (load-file (hecate-base-dir-src TAILPATH)))
(defun hecate-init-load-file-relative (TAILPATH)
  (load-file (replace-regexp-in-string "//+" "/"
    (concat (file-name-directory
       (or load-file-name (buffer-file-name)) )
       "/" TAILPATH ))))

;; Store locks/backups in /tmp
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)) )
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)) )
;;(setq-default projectile-cache-file
;;	      (hecate-base-dir "/auto-generated/projectile.cache"))
;; (setq-default projectile-cache-file
;; 	      (hecate-base-dir "/auto-generated/projectile.cache"))
