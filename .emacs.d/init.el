;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;;(package-initialize)

(defvar settings-dir
  (expand-file-name "settings" user-emacs-directory))

(load (expand-file-name "melpa.el" settings-dir))
(load (expand-file-name "package-settings.el" settings-dir))
(load (expand-file-name "default-variables.el" settings-dir))
(load (expand-file-name "mac-functions.el" settings-dir))
(load (expand-file-name "editor-functions.el" settings-dir))
(load (expand-file-name "basic.el" settings-dir))
(load (expand-file-name "keybindings.el" settings-dir))
(load (expand-file-name "aliases.el" settings-dir))

;; this can eventually be used to run my emacs config as
;; org file from
;; https://github.com/hrs/dotfiles/blob/master/emacs/.emacs.d/configuration.org
;;(org-babel-load-file "~/.emacs.d/configuration.org")

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
 )





(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("ecba61c2239fbef776a72b65295b88e5534e458dfe3e6d7d9f9cb353448a569e" "151bde695af0b0e69c3846500f58d9a0ca8cb2d447da68d7fbf4154dcf818ebc" "12bacee81d067acf07dec4c867be541a04744a6ac6a39636de25a2c77e9b573c" "1c082c9b84449e54af757bcae23617d11f563fc9f33a832a8a2813c4d7dfb652" "75d3dde259ce79660bac8e9e237b55674b910b470f313cdf4b019230d01a982a" "6d589ac0e52375d311afaa745205abb6ccb3b21f6ba037104d71111e7e76a3fc" "6b2636879127bf6124ce541b1b2824800afc49c6ccd65439d6eb987dbf200c36" "4697a2d4afca3f5ed4fdf5f715e36a6cac5c6154e105f3596b44a4874ae52c45" "d2e9c7e31e574bf38f4b0fb927aaff20c1e5f92f72001102758005e53d77b8c9" "a3fa4abaf08cc169b61dea8f6df1bbe4123ec1d2afeb01c17e11fdc31fc66379" "7e78a1030293619094ea6ae80a7579a562068087080e01c2b8b503b27900165c" default))
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
 '(nil nil t)
 '(package-selected-packages
   '(powerline-evil diff-hl powerline doom-themes auto-compile org-bullets multi-term ob-elixir htmlize ox-twbs move-text web-mode use-package syntax-subword smartparens projectile oceanic-theme no-littering multiple-cursors magit flycheck flx expand-region exec-path-from-shell elixir-mode counsel))
 '(web-mode-code-indent-offset 2)
 '(web-mode-enable-auto-closing nil)
 '(web-mode-enable-auto-indentation nil)
 '(web-mode-enable-auto-opening nil)
 '(web-mode-enable-auto-pairing nil)
 '(web-mode-enable-control-block-indentation nil)
 '(web-mode-indent-style 1)
 '(web-mode-markup-indent-offset 2))
