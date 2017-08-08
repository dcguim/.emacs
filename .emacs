(setq inhibit-startup-message t)

;; Make org-mode work with files ending in .org
 (add-to-list 'auto-mode-alist '("\\.org$" . org-mode))

;; Makes the cursor red
(add-to-list 'default-frame-alist '(cursor-color . "red"))

;; A hook for c programming identation
(add-hook 'c-mode-common-hook '(lambda ()
				 (local-set-key (kbd "RET") 'newline-and-indent)))

;; A hook for haskell programming identation
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(fill-column 74)
 '(haskell-mode-hook (quote (turn-on-haskell-indentation)))
 '(package-archives
   (quote
    (("gnu" . "http://elpa.gnu.org/packages/")
     ("org" . "http://orgmode.org/elpa/")
     ("melpa-stable" . "http://stable.melpa.org/packages/"))))
 '(package-selected-packages
   (quote
    (multi-web-mode iy-go-to-char vline web-mode cider queue pkg-info multiple-cursors haskell-mode dash clojure-mode))))

;; setup load-path and autoloads
(add-to-list 'load-path "~/Applications/slime")
(require 'slime-autoloads)

;; Set your lisp system and, optionally, some contribs
(setq inferior-lisp-program "/usr/local/bin/sbcl")
(setq slime-contribs '(slime-fancy))

;; R configs
;;(add-to-list 'load-path "/Applications/ess-13.09-1/lisp/")
;;(load "ess-site")


;;Packages
(require 'package)
;;  elpa
(add-to-list 'package-archives              
	      '("elpa" . "http://tromey.com/elpa/"))

	     
;;  marmalade
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))

(setq org-todo-keywords
      '((sequence "TODO" "IN-PROGRESS" "DELEGATED" "|" "DONE")))

(add-to-list 'load-path "~/.emacs.d/elpa/fill-column-indicator/")
(require 'fill-column-indicator)
(setq fci-rule-column 70)
(setq fci-rule-color "darkviolet")


(add-to-list 'load-path "~/.emacs.d/elpa/iy-go-to-char/")
(require 'iy-go-to-char)
(global-set-key (kbd "C-c f") 'iy-go-to-char)
(global-set-key (kbd "C-c F") 'iy-go-to-char-backward)
(global-set-key (kbd "C-c ;") 'iy-go-to-or-up-to-continue)
(global-set-key (kbd "C-c ,") 'iy-go-to-or-up-to-continue-backward)

(org-babel-do-load-languages
 'org-babel-load-languages '((C . t)
			     (lisp . t)
			     ))

(package-initialize)

(put 'downcase-region 'disabled nil)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
