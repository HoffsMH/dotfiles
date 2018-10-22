(defvar settings-dir
  (expand-file-name "settings" user-emacs-directory))

(require 'no-littering)

(load (expand-file-name "default-variables.el" settings-dir))
(load (expand-file-name "mac-functions.el" settings-dir))
(load (expand-file-name "editor-functions.el" settings-dir))
(load (expand-file-name "package-settings.el" settings-dir))
(load (expand-file-name "melpa.el" settings-dir))
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
 '(js-chain-indent nil)
 '(js-indent-align-list-continuation nil)
 '(js-indent-first-init nil)
 '(js-indent-level 2)
 '(js-js-switch-tabs nil)
 '(js-square-indent-offset 0)
 '(js2-allow-member-expr-as-function-name nil)
 '(js2-bounce-indent-p t)
 '(js2-mode-indent-ignore-first-tab t)
 '(line-number-mode nil)
 '(package-selected-packages
   '(git-link flycheck exec-path-from-shell web-mode js2-mode counsel ag "js-mode" "js" async with-editor treepy tablist s epl pkg-info popup dash magit-popup graphql ghub git-commit json-snatcher json-reformat json-mode helm-core flx docker-tramp eslint-fix expand-region swiper dockerfile-mode docker ivy projectile smex flx-ido magit better-defaults no-littering oceanic-theme elixir-mode)))
