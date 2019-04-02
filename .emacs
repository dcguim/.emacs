(setq inhibit-startup-message t)
(setq column-number-mode t)
(setq line-number-mode t)
(if window-system
    (tool-bar-mode -1))

;; Uncomment to debug .emacs
;;(setq debug-on-error t)

;; Make org-mode work with files ending in .org
 (add-to-list 'auto-mode-alist '("\\.org$" . org-mode))

;; color theme
(add-to-list 'load-path "~/.emacs.d/elpa/color-theme-sanityinc-tomorrow-1.17/")
(setq color-theme-sanityinc-tomorrow-eighties t)

;; Makes the cursor red
(add-to-list 'default-frame-alist '(cursor-color . "red"))
(set-face-attribute 'region nil :background "#ead9ff")

;; text marking
(global-set-key (kbd "C-c m") 'er/expand-region)

;; emacs speaks statistics
(add-to-list 'load-path "~/.emacs.d/elpa/ess-17.11.999/")
(add-to-list 'auto-mode-alist '("\\.r\\'" . r-mode))

;; clojure mode
(add-to-list 'load-path "~/.emacs.d/elpa/clojure-mode-1.7.1/")
(add-to-list 'auto-mode-alist '("\\.clj\\'" . minizinc-mode))

;; A hook for c programming identation
(add-hook 'c-mode-common-hook '(lambda ()
				 (local-set-key (kbd "RET") 'newline-and-indent)))

;; vertical limit line
(add-to-list 'load-path "~/.emacs.d/elpa/fill-column-indicator/")
(setq fci-rule-column 80)
(setq fci-rule-color "violet")

;; automatic inclusion of drawing pagckages for org-export-latex
(with-eval-after-load 'ox-latex
   (add-to-list 'org-latex-classes
                '("article"
                  "\\documentclass[a4paper,12pt]{article}
		  \\usepackage{tikz}
                  \\usepackage{pgfplots}")))

  'org-export-latex-classes
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   (vector "#eaeaea" "#d54e53" "#b9ca4a" "#e7c547" "#7aa6da" "#c397d8" "#70c0b1" "#424242"))
 '(custom-enabled-themes '(sanityinc-tomorrow-night))
 '(custom-safe-themes
   '("06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" "628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" default))
 '(fci-rule-color "#424242")
 '(package-archives
   '(("gnu" . "http://elpa.gnu.org/packages/")
     ("melpa-stable" . "http://stable.melpa.org/packages/")))
 '(package-selected-packages
   '(htmlize color-theme-sanityinc-tomorrow multiple-cursors expand-region magit s-buffer iy-go-to-char fill-column-indicator ess ein multiple-cursors clojure-mode))
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   '((20 . "#d54e53")
     (40 . "#e78c45")
     (60 . "#e7c547")
     (80 . "#b9ca4a")
     (100 . "#70c0b1")
     (120 . "#7aa6da")
     (140 . "#c397d8")
     (160 . "#d54e53")
     (180 . "#e78c45")
     (200 . "#e7c547")
     (220 . "#b9ca4a")
     (240 . "#70c0b1")
     (260 . "#7aa6da")
     (280 . "#c397d8")
     (300 . "#d54e53")
     (320 . "#e78c45")
     (340 . "#e7c547")
     (360 . "#b9ca4a")))
 '(vc-annotate-very-old-color nil))

;; setup load-path and autoloads
(add-to-list 'load-path "/Applications/slime")
(require 'slime-autoloads)

;; Set your lisp system and, optionally, some contribs
(setq inferior-lisp-program "/usr/local/bin/sbcl")
(setq slime-contribs '(slime-fancy))

;;Packages
(require 'package)
;;  elpa
(add-to-list 'package-archives
	      '("elpa" . "http://tromey.com/elpa/"))

	     
;;  marmalade
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))

;; Set org todo tags
(setq org-todo-keywords
      '((sequence "TODO" "IN-PROGRESS" "DELEGATED" "|" "DONE")))
(setq org-todo-keyword-faces
      '(("TODO" . (:foreground "red" :weight bold))
	("IN-PROGRESS" . "darkviolet")
	("REFACTOR" . "blue")
	("DELEGATED" . "brown")
	("DONE" .  "darkgreen")))

;; Efective Keyboard Cmds
(setq ns-function-modifier 'super)

;; moving
(setq next-line-add-newlines t)
;; note ';' go to next char and ',' go to previous
(global-set-key (kbd "C-c f") 'iy-go-to-char)
(global-set-key (kbd "C-c b") 'iy-go-to-char-backward)
(global-set-key (kbd "C-c ;") 'iy-go-to-or-up-to-continue)
(global-set-key (kbd "C-c ,") 'iy-go-to-or-up-to-continue-backward)
(global-set-key (kbd "C-c C-g") 'iy-go-to-char-done)

;; additional rebindings
(global-set-key (kbd "M-s s") 'other-frame)
(global-set-key (kbd "C-c C-f") 'load-file)
(global-set-key (kbd "RET") 'newline-and-indent)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-M-m") 'mc/mark-more-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
(global-set-key (kbd "C-x g") 'magit-status)
(setq org-src-tab-acts-natively t)

(org-babel-do-load-languages
 'org-babel-load-languages '((C . t)
			     (lisp . t)
			     (latex . t)))

(package-initialize)

(put 'downcase-region 'disabled nil)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )





