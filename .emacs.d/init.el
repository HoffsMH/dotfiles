;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;; (package-initialize)

(defvar settings-dir
  (expand-file-name "settings" user-emacs-directory))

(load (expand-file-name "melpa.el" settings-dir))
(load (expand-file-name "package-settings.el" settings-dir))
(load (expand-file-name "default-variables.el" settings-dir))
(load (expand-file-name "mac-functions.el" settings-dir))
(load (expand-file-name "editor-functions.el" settings-dir))
(load (expand-file-name "basic.el" settings-dir))
(load (expand-file-name "keybindings.el" settings-dir))

 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("12bacee81d067acf07dec4c867be541a04744a6ac6a39636de25a2c77e9b573c" default))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(hl-line ((t (:inherit highlight :background "gray27"))))
 '(region ((t (:background "#6868C9")))))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-save-default nil)
 '(fill-column 900)
 '(js-chain-indent nil)
 '(js-indent-align-list-continuation nil)
 '(js-indent-first-init nil)
 '(js-indent-level 1)
 '(js-js-switch-tabs nil)
 '(js-square-indent-offset 0)
 '(js2-allow-member-expr-as-function-name nil)
 '(js2-bounce-indent-p t)
 '(js2-mode-indent-ignore-first-tab t)
 '(line-number-mode nil)
 '(package-selected-packages)
	 (quote
		(flycheck-elixir smartparens syntax-subword multiple-cursors git-link exec-path-from-shell web-mode counsel ag "js-mode" "js" async with-editor treepy tablist s epl pkg-info popup dash magit-popup graphql ghub git-commit json-snatcher json-reformat json-mode helm-core flx docker-tramp eslint-fix expand-region swiper dockerfile-mode docker ivy projectile smex flx-ido magit better-defaults no-littering oceanic-theme elixir-mode)))
 '(web-mode-code-indent-offset 2)
 '(web-mode-enable-auto-closing nil)
 '(web-mode-enable-auto-indentation nil)
 '(web-mode-enable-auto-opening nil)
 '(web-mode-enable-auto-pairing nil)
 '(web-mode-enable-control-block-indentation nil)
 '(web-mode-indent-style 1)
 '(web-mode-markup-indent-offset 2))
