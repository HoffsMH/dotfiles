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

;; "Don't present the usual startup message, and clear the scratch
;; buffer."
(setq inhibit-startup-message t)
(setq initial-scratch-message nil)
(setq require-final-newline t)

;; "When opening a file, always follow symlinks."
(setq vc-follow-symlinks t)

(setq default-directory "~/")

(setq default-tab-width 2)
;;Don't ask `yes/no?', ask `y/n?'
(fset 'yes-or-no-p 'y-or-n-p)
(setq visible-bell t)
(add-hook 'focus-out-hook (lambda () (save-some-buffers t)))

(setq org-log-done 'time)



;; formatting behavior
(global-whitespace-mode +1)
(global-hl-line-mode t)
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
(load-theme 'doom-vibrant t)

;; functions that are not package settings that
;; I would like to call on startup

;; editor function does exactly what it says
(set-frame-size-according-to-resolution)
