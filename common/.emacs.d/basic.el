(fset 'yes-or-no-p 'y-or-n-p)

(setq visible-bell t)
(setq ring-bell-function 'ignore)

(global-auto-revert-mode t)

(setq require-final-newline t)

(add-hook 'focus-out-hook (lambda () (save-some-buffers t)))
(auto-save-visited-mode 0)
(auto-save-mode 0)

(setq backup-directory-alist `(("." . "~/.emacs-saves")))

(setq create-lockfiles nil)

(pending-delete-mode 1)

(menu-bar-mode -1)

(defun comment-or-uncomment-region-or-line ()
"Comments or uncomments the region or the current line if there's no active region." (interactive)
(let (beg end)
(if (region-active-p)
(setq beg (region-beginning) end (region-end))
(setq beg (line-beginning-position) end (line-end-position)))
(comment-or-uncomment-region beg end)))

(setq explicit-shell-file-name "/bin/zsh")

(global-set-key (kbd "s-<right>") 'move-end-of-line)
(global-set-key (kbd "s-<left>") 'move-beginning-of-line)

;; backspace mac style
(global-set-key (kbd "s-<backspace>") '(lambda () (interactive) (kill-line 0)) )

(global-set-key (kbd "C-S-a") 'org-agenda)
(global-set-key (kbd "s-p") 'projectile-find-file)

(show-paren-mode t)

(set-face-attribute 'region nil :background "#C325D1")

(global-hl-line-mode t)

(setq default-tab-width 2)

(set-frame-font "Fira Code:antialias-none")
(set-face-attribute 'default nil :weight 'Light :height 120)

(menu-bar-mode nil)
(scroll-bar-mode nil)
(tool-bar-mode 0)

(setq-default cursor-type 'box)

(defun transparency (value)
  "Sets the transparency of the frame window. 0=transparent/100=opaque."
  (interactive "nTransparency Value 0 - 100 opaque:")
  (set-frame-parameter (selected-frame) 'alpha value))

(transparency 90)

(setq user-full-name "Matthew Hecker"
  user-mail-address "matthecker@pm.me")

(setq inhibit-startup-message t)
(setq initial-scratch-message nil)

(setq vc-follow-symlinks t)

(setq default-directory "~/")

(setq mac-command-modifier 'super) ; make cmd key do Meta
;; (setq mac-option-modifier 'super) ; make opt key do Super

(global-unset-key (kbd "M-c"))

(setq load-prefer-newer t)

(set-face-attribute 'region nil :background "#C325D1")

(setenv "SHELL" "/bin/zsh")

(global-set-key (kbd "s-t") nil)
