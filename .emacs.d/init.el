(package-initialize)

(setq evil-want-keybinding nil)

(defvar settings-dir
  (expand-file-name "settings" user-emacs-directory))

(load (expand-file-name "aliases.el" settings-dir))

;; this can eventually be used to run my emacs config as
;; org file from
;; https://github.com/hrs/dotfiles/blob/master/emacs/.emacs.d/configuration.org
(org-babel-load-file (expand-file-name "melpa.org" settings-dir))
(org-babel-load-file (expand-file-name "package-settings.org" settings-dir))
(org-babel-load-file (expand-file-name "org-configuration.org" settings-dir))
(org-babel-load-file (expand-file-name "basic.org" settings-dir))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
	 (quote
		("0e8bac1e87493f6954faf5a62e1356ec9365bd5c33398af3e83cfdf662ad955f" default)))
 '(package-selected-packages
	 (quote
		(snazzy-theme evil-collection org evil-mode web-mode use-package syntax-subword smartparens projectile ox-twbs org-bullets oceanic-theme ob-elixir no-littering multiple-cursors move-text htmlize flycheck flx expand-region exec-path-from-shell evil-magit elixir-mode doom-themes diff-hl counsel auto-compile))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
