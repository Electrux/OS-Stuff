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
    ("4e63466756c7dbd78b49ce86f5f0954b92bf70b30c01c494b37c586639fa3f6f" default)))
 '(package-selected-packages (quote (exec-path-from-shell tangotango-theme))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )



;; Custom settings.

;; Set theme.
(load-theme 'tangotango)

;; Set default style for C/C++ language.
(setq-default c-default-style "linux")

;; Set settings for editing.
(global-linum-mode t)
(setq-default c-basic-offset 8
	      tab-width 8
	      indent-tabs-mode t)

;; Settings to disable tool bar and scroll bar from
;; window for a clear and clean view.
(tool-bar-mode -1)
(toggle-scroll-bar -1)


;; Set PATH variable for emacs.
(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

;; Use either toggle-frame-fullscreen or toggle-frame-maximized as required.
(toggle-frame-maximized)

