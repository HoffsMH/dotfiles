;;(package-initialize)

(defvar settings-dir
	(expand-file-name "settings" user-emacs-directory))

(load (expand-file-name "editor-functions.el" settings-dir))
(load (expand-file-name "keybindings.el" settings-dir))
(load (expand-file-name "aliases.el" settings-dir))

;; this can eventually be used to run my emacs config as
;; org file from
;; https://github.com/hrs/dotfiles/blob/master/emacs/.emacs.d/configuration.org
(org-babel-load-file (expand-file-name "basic.org" settings-dir))
(org-babel-load-file (expand-file-name "melpa.org" settings-dir))
(org-babel-load-file (expand-file-name "package-settings.org" settings-dir))
(org-babel-load-file (expand-file-name "web-mode.org" settings-dir))
(org-babel-load-file (expand-file-name "org-configuration.org" settings-dir))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(god-mode yaml-mode web-mode use-package syntax-subword smartparens projectile powerline-evil ox-twbs org-bullets oceanic-theme ob-elixir no-littering multiple-cursors move-text magit htmlize flycheck flx expand-region exec-path-from-shell elixir-mode doom-themes diff-hl counsel auto-compile)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
