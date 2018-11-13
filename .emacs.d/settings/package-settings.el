(eval-when-compile
	 ;; Following line is not needed if use-package.el is in ~/.emacs.d
	 (add-to-list 'load-path "<path where use-package is installed>")
	 (require 'use-package))
(setq use-package-always-ensure t)

(use-package auto-compile
:config (auto-compile-on-load-mode))

(use-package flx)

(setq ivy-use-virtual-buffers t)
(setq ivy-count-format "%d/%d ")
(setq ivy-re-builders-alist '((t . ivy--regex-fuzzy)))

(use-package ivy)
(use-package counsel)
(use-package swiper)
(ivy-mode 1)

(global-set-key (kbd "C-x C-y") 'counsel-yank-pop)
(global-set-key (kbd "C-s") 'swiper)

(define-key global-map (kbd "C-s-s") 'counsel-ag)
(define-key global-map (kbd "C-s-<268632083>") 'counsel-ag)
(global-set-key (kbd "C-s-s") 'counsel-ag)

(use-package projectile)
(setq frame-title-format '((:eval (projectile-project-name))))

(setq projectile-completion-system 'ivy)
(define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
(projectile-mode t)

(use-package web-mode)

(defun my-web-mode-hook ()
  "Hooks for Web mode. Adjust indents"
  (two-space-indent))

(add-hook 'web-mode-hook  'my-web-mode-hook)

(setq web-mode-code-indent-offset 2)
(setq web-mode-indent-style 1)
(setq web-mode-css-indent-offset 2)
(setq web-mode-markup-indent-offset 2)
(setq web-mode-code-indent-offset 2)

(setq web-mode-enable-auto-closing nil)
(setq web-mode-enable-auto-indentation nil)
(setq web-mode-enable-auto-opening nil)
(setq web-mode-enable-auto-pairing nil)
(setq web-mode-enable-control-block-indentation nil)

(add-to-list 'auto-mode-alist '("\\.js\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsx$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.hbs$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.eex$" . web-mode))

(use-package flycheck)
 ;; use eslint with web-mode for jsx files
 (flycheck-add-mode 'javascript-eslint 'web-mode)


 ;; turn on flychecking globally
 (add-hook 'after-init-hook #'global-flycheck-mode)

 ;; disable jshint since we prefer eslint checking
 (setq-default flycheck-disabled-checkers
   (append flycheck-disabled-checkers
   '(javascript-jshint)))

;; customize flycheck temp file prefix
(setq-default flycheck-temp-prefix ".flycheck")

;; disable json-jsonlist checking for json files
(setq-default flycheck-disabled-checkers
	(append flycheck-disabled-checkers
		'(json-jsonlist)))

;; use local eslint from node_modules before global
;; http://emacs.stackexchange.com/questions/21205/flycheck-with-file-relative-eslint-executable
(defun my/use-eslint-from-node-modules ()
	(let* ((root (locate-dominating-file
		(or (buffer-file-name) default-directory)
		"node_modules"))
	 (eslint (and root
		(expand-file-name "node_modules/eslint/bin/eslint.js"
					root))))
		(when (and eslint (file-executable-p eslint))
(setq-local flycheck-javascript-eslint-executable eslint))))
(add-hook 'flycheck-mode-hook #'my/use-eslint-from-node-modules)

(use-package exec-path-from-shell)
;; https://github.com/purcell/exec-path-from-shell
;; only need exec-path-from-shell on OSX
;; this hopefully sets up path and other vars better

(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

(use-package syntax-subword)
(global-syntax-subword-mode 1)

(global-set-key (kbd "C-f") 'syntax-subword-forward)
(global-set-key (kbd "C-b") 'syntax-subword-backward)

(use-package smartparens)
(smartparens-global-mode 1)

(use-package move-text)
(global-set-key (kbd "C-s-<268632078>") 'move-text-down)
(global-set-key (kbd "C-s-n") 'move-text-down)

(global-set-key (kbd "C-s-<268632080>") 'move-text-up)
(global-set-key (kbd "C-s-p") 'move-text-up)

(use-package diff-hl)
(global-diff-hl-mode)
(add-hook 'prog-mode-hook 'turn-on-diff-hl-mode)
(add-hook 'vc-dir-mode-hook 'turn-on-diff-hl-mode)

(use-package expand-region)
(global-set-key (kbd "s-d") 'er/expand-region)

(use-package ox-twbs)
(use-package htmlize)
(use-package ob-elixir)

(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . t)
(elixir . t))
;; ...
)

(use-package elixir-mode)

(use-package magit)

(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "C-x C-g p") 'magit-push-current)
(global-set-key (kbd "C-x C-g o") 'magit-pull-popup)

(use-package multiple-cursors)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)

(use-package no-littering)

;; now even #files# shouldn't litter current directory
(setq auto-save-file-name-transforms
  `((".*" ,(no-littering-expand-var-file-name "auto-save/") t)))

(use-package org-bullets
  :init
  (add-hook 'org-mode-hook #'org-bullets-mode))

(use-package god-mode)

     (global-set-key (kbd "C-i") 'god-local-mode)

(defun c/god-mode-update-cursor ()
(let ((limited-colors-p (> 257 (length (defined-colors)))))
  (cond (god-local-mode (progn
			  (set-face-background 'mode-line (if limited-colors-p "white" "#e9e2cb"))
			  (set-face-background 'mode-line-inactive (if limited-colors-p "white" "#e9e2cb"))))
	(t (progn
	     (set-face-background 'mode-line (if limited-colors-p "black" "#0a2832"))
	     (set-face-background 'mode-line-inactive (if limited-colors-p "black" "#0a2832")))))))

(use-package doom-themes)
(use-package oceanic-theme)

;; (global-unset-key "\C-z")
;; (defalias 'ctl-z-keymap (make-sparse-keymap))
;; (defvar ctl-z-map (symbol-function 'ctl-z-keymap)
;;   "Global keymap for characters following C-z.")



;; (define-key global-map "\C-z" 'ctl-z-keymap)



;; (define-key ctl-z-map "\C-c" 'help-for-help)

;; (global-set-key (kbd "C-z k") 'swiper)
