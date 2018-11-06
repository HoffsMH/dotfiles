;; Window Appearance
(menu-bar-mode 0)
(scroll-bar-mode 0)
(tool-bar-mode 0)
(show-paren-mode 1)
(global-auto-revert-mode t)
(setq inhibit-startup-screen t)
(setq-default
  whitespace-line-column 80
  whitespace-style       '(face lines-tail trailing empty))

(setq default-tab-width 2)
(add-hook 'focus-out-hook (lambda () (save-some-buffers t)))


;; formatting behavior
(global-whitespace-mode +1)
(global-hl-line-mode +1)
(pending-delete-mode 1)
(setq-default cursor-type 'box)
(add-hook 'before-save-hook 'whitespace-cleanup)
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; this can over heat my laptop during editing auto reload
;; js apps if enabled
(auto-save-mode 0)
(auto-save-visited-mode 0)

;; I don't care Ill just use git and commit often :)
(setq create-lockfiles nil)


;; font
(set-frame-font "Fira Code-15:antialias-none")
(set-face-attribute 'default nil :weight 'ExtraLight :height 160)


(setq backup-directory-alist `(("." . "~/.emacs-saves")))
(load-theme 'oceanic t)

;; functions that are not package settings that
;; I would like to call on startup

;; editor function does exactly what it says
(set-frame-size-according-to-resolution)
