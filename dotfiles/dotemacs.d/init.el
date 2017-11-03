;;; Package --- Summary

;;; Commentary:
;;    All the settings are here.
;;    First is the required settings for package management,
;;    which also contains packages.
;;    Then there is custom settings for better customization.

;;; Code:


;; Required settings for package management.

(require 'package) ;; You might already have this line
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (url (concat (if no-ssl "http" "https") "://melpa.org/packages/")))
  (add-to-list 'package-archives (cons "melpa" url) t))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize) ;; You might already have this line
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("ff7625ad8aa2615eae96d6b4469fcc7d3d20b2e1ebc63b761a349bebbb9d23cb" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "4e63466756c7dbd78b49ce86f5f0954b92bf70b30c01c494b37c586639fa3f6f" default)))
 '(package-selected-packages
   (quote
    (cargo flycheck-rust rust-mode dracula-theme solarized-theme yasnippet company company-ycmd eldoc-eval exec-path-from-shell flycheck flycheck-ycmd tangotango-theme ycmd))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


;; Custom settings.

;; Set theme.
(load-theme 'dracula)

;; Set default style for C/C++ language.
(setq-default c-default-style "bsd")

;; Set settings for editing.
(global-linum-mode t)
(setq-default c-basic-offset 8
	      tab-width 8
	      indent-tabs-mode t)

;; Settings to disable tool bar and scroll bar from
;; window for a clear and clean view.
(tool-bar-mode -1)
(toggle-scroll-bar -1)

;; Disable Auto Backup feature. No more freaking '~' files!!
(setq auto-save-default nil)
(setq make-backup-files nil)

;; Set the backup and autosave file location to /tmp
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;; Set PATH variable for emacs.
(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

;; Use either toggle-frame-fullscreen or toggle-frame-maximized as required.
(toggle-frame-maximized)

;; Rust setup for rust-mode.
(setq rust-format-on-save t)

;; YCMD + Company + Yasnippet + FlyCheck setup.

;; Snippets
(use-package yasnippet
  :ensure t
  :diminish yas-minor-mode
  :init (yas-global-mode t))

;; Autocomplete
(use-package company
  :defer 10
  :diminish company-mode
  :bind (:map company-active-map
              ("M-j" . company-select-next)
              ("M-k" . company-select-previous))
  :preface
  ;; enable yasnippet everywhere
  (defvar company-mode/enable-yas t
    "Enable yasnippet for all backends.")
  (defun company-mode/backend-with-yas (backend)
    (if (or
         (not company-mode/enable-yas)
         (and (listp backend) (member 'company-yasnippet backend)))
        backend
      (append (if (consp backend) backend (list backend))
              '(:with company-yasnippet))))

  :init (global-company-mode t)
  :config
  ;; no delay no autocomplete
  (setq-default
   company-idle-delay 0
   company-minimum-prefix-length 2
   company-tooltip-limit 20)

  (setq-default company-backends
                 (mapcar #'company-mode/backend-with-yas company-backends)))

;;; On-the-fly syntax checking
(use-package flycheck
  :ensure t
  :diminish flycheck-mode
  :init (global-flycheck-mode t))

;; Show argument list in echo area
(use-package eldoc
  :diminish eldoc-mode
  :init (add-hook 'ycmd-mode-hook 'ycmd-eldoc-setup))

; Code-comprehension server
(use-package ycmd
  :ensure t
  :init (add-hook 'after-init-hook #'global-ycmd-mode)
  :config
  (set-variable 'ycmd-server-command '("python3" "/Users/electrux/GitHub/ycmd/ycmd/"))
  (set-variable 'ycmd-global-config (expand-file-name "~/GitHub/Linux-Stuff/dotfiles/.ycm_extra_conf.py"))

  (set-variable 'ycmd-extra-conf-whitelist '("~/Programming/*" "~/GitHub/*"))

  (use-package flycheck-ycmd
    :commands (flycheck-ycmd-setup)
    :init (add-hook 'ycmd-mode-hook 'flycheck-ycmd-setup))

  (use-package company-ycmd
    :ensure t
    :init (company-ycmd-setup)
    :config (add-to-list 'company-backends (company-mode/backend-with-yas 'company-ycmd))))

(provide 'init)
;;; init.el ends here
