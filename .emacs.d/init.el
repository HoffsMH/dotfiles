;;(package-initialize)

(defvar settings-dir
  (expand-file-name "settings" user-emacs-directory))

(load (expand-file-name "default-variables.el" settings-dir))
(load (expand-file-name "mac-functions.el" settings-dir))
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
