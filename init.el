(require 'package)

(add-to-list 'package-archives
	     '("melpa" . "http://melpa.milkbox.net/packages/")
	     t)

(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(load-theme 'misterioso)
(set-cursor-color "yellow")

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;;commiting to git
(use-package magit
  :ensure t
  :config
  (global-set-key (kbd "M-g") 'magit)

;; highlighting the current line
(global-hl-line-mode 1)
(set-face-background 'hl-line "#3e4446")

;; lights up the current line when switching tabs
(use-package beacon
  :ensure t
  :init
  (beacon-mode 1))

;; autosuggestion
;;(use-package company
;;  :ensure t
;;  :config
;;  (global-company-mode t)
;;  (setq company-idle-delay 0.2)
;;  (setq company-minimum-prefix-length 3))

;; autocompletion
(use-package auto-complete
  :ensure t)
(ac-config-default)
;;(define-key ac-mode-map (kbd "C-p") (function ac-previous))
;;(define-key ac-mode-map (kbd "C-n") (function ac-next))

(use-package expand-region
  :ensure t)

(global-set-key (kbd "C-q") (function er/expand-region))

;; autocompletion
(use-package yasnippet
  :ensure t
  :init
  (add-hook 'emacs-lisp-mode-hook 'yas-minor-mode)
  (use-package yasnippet-snippets
    :ensure t)
  (yas-reload-all))

;;history of stuff to paste
(use-package popup-kill-ring
  :ensure t)
(global-set-key (kbd "M-y")(function popup-kill-ring))

;;suggests commands
(use-package which-key
  :ensure t
  :init
  (which-key-mode))
;;searching for words
(use-package swiper
  :ensure t
  :config
  (global-set-key (kbd "C-s") 'swiper))

(use-package avy
  :ensure t
  :init
  (global-set-key (kbd "M-s") 'avy-goto-word-or-subword-1)
  (setq avy-background t))




;;(USE(use-package popup-kill-ring-package spaceline
;;       :ensure t
;;       :config
;;       (require 'spaceline-config)
;;       (setq powerline-default-separator (quote box))
;;       (setq ns-use-srgb-colorspace nil)
;;       (spaceline-spacemacs-theme))

(use-package smex
:ensure t
:init (smex-initialize)
:bind
("M-x" . smex ))

;; to hilight the brackets
(show-paren-mode)
(use-package rainbow-delimiters
:ensure t
:init
(rainbow-delimiters-mode 1)
(add-hook 'emacs-lisp-mode-hook #'rainbow-delimiters-mode)
(add-hook 'org-mode-hook #'rainbow-delimiters-mode)
)

;; navigation
(setq ido-enable-flex-matching nil)
(setq ido-create-new-buffer 'always)
(setq ido-everywhere t)
(ido-mode 1)

(use-package ido-vertical-mode
:ensure t
:init
(ido-vertical-mode 1))
(setq ido-vertical-define-keys 'C-n-and-C-p-only)

(global-set-key (kbd "C-x C-b") 'ido-switch-buffer)

;; kill the current buffer always
(defun kill-curr-buffer ()
  (interactive)
  (kill-buffer (current-buffer)))

(global-set-key (kbd "C-x k") 'kill-curr-buffer)

(use-package dashboard
:ensure t
:config
(dashboard-setup-startup-hook)
(setq dashboard-items '((recents . 20)))
(setq dashboard-banner-logo-title "xxxx"))

;;;;;;;;;;;;;;;;;;;;
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (avy swiper which-key popup-kill-ring expand-region auto-complete yasnippet-snippets yasnippet company beacon magit dashboard ido-vertical-mode rainbow-delimiters smex use-package spacemacs-theme spaceline))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
