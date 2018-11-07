;; This is only needed once, near the top of the file

 (eval-when-compile
   ;; Following line is not needed if use-package.el is in ~/.emacs.d
   (add-to-list 'load-path "<path where use-package is installed>")
   (require 'use-package))
(setq use-package-always-ensure t)

(use-package syntax-subword)
(use-package counsel)
(use-package projectile)
(use-package smartparens)
(use-package flx)
(use-package elixir-mode)
(use-package magit)
(use-package multiple-cursors)
(use-package swiper)
(use-package exec-path-from-shell)
(use-package oceanic-theme)
(use-package flycheck)
(use-package no-littering)
(use-package ivy)
(use-package expand-region)
(use-package web-mode)
(use-package move-text)
(use-package ox-twbs)
(use-package htmlize)
(use-package ob-elixir)
(use-package org-bullets
  :init
  (add-hook 'org-mode-hook #'org-bullets-mode))
(setq org-ellipsis "⤵")


(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . t)
   (elixir . t)))

;; http://www.flycheck.org/manual/latest/index.html

;; (require 'flycheck)
;;(require 'projectile)
;; (require 'no-littering)

;; now even #files# shouldn't litter current directory
(setq auto-save-file-name-transforms
     `((".*" ,(no-littering-expand-var-file-name "auto-save/") t)))

;; adjust indents for web-mode to 2 spaces
(defun my-web-mode-hook ()
  "Hooks for Web mode. Adjust indents"
  (message "web mode hook!!")
  ;;; http://web-mode.org/
  (two-space-indent)
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2))
(add-hook 'web-mode-hook  'my-web-mode-hook)

(add-hook 'web-mode-hook  'emmet-mode)

;; activate web-mode when appropriate
(add-to-list 'auto-mode-alist '("\\.js\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsx$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.hbs$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.eex$" . web-mode))


;; use eslint with web-mode for jsx files
(flycheck-add-mode 'javascript-eslint 'web-mode)

;; extreme hackyness for some reason both js2 and js mode think I should
;; indent like this, absolutely  sad :(
;; const thing = () =>
;;       ('thing')
;; I preffer
;; const thing = () =>
;;   ('thing')
;; (add-hook 'js-mode-hook (lambda () (setq js--declaration-keyword-re "$a")))

;; ivy
(ivy-mode 1)
(setq ivy-re-builders-alist
      '((t . ivy--regex-fuzzy)))

;; projectile which will be configured to use ivy
(setq projectile-completion-system 'ivy)
(define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
(projectile-mode +1)

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

;; https://github.com/purcell/exec-path-from-shell
;; only need exec-path-from-shell on OSX
;; this hopefully sets up path and other vars better
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

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

(global-syntax-subword-mode 1)
(smartparens-global-mode 1)
