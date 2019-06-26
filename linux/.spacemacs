(load (expand-file-name ".spacemacs" "~/personal/dotfiles/common/"))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."

  (setq evil-toggle-key "C-`")
  )


(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."

  (load (expand-file-name "aliases.el" "~/personal/dotfiles/common/.emacs.d/"))

  (org-babel-load-file (expand-file-name "package-settings.org" "~/personal/dotfiles/linux/.emacs.d/"))

  (org-babel-load-file (expand-file-name "org-configuration.org" "~/personal/dotfiles/linux/.emacs.d/"))

  (org-babel-load-file (expand-file-name "basic.org" "~/personal/dotfiles/linux/.emacs.d/"))
)
;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (powerline spinner hydra lv parent-mode flycheck flx highlight smartparens iedit anzu evil goto-chg undo-tree popup f projectile counsel swiper ivy bind-map bind-key packed s company dash elixir-mode pkg-info epl avy helm-themes helm-swoop helm-projectile helm-mode-manager helm-flx helm-descbinds helm-ag ace-jump-helm-line helm helm-core ws-butler winum which-key wgrep volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spaceline smex restart-emacs request rainbow-delimiters popwin persp-mode pcre2el paradox org-bullets open-junk-file ob-elixir neotree move-text macrostep lorem-ipsum linum-relative link-hint ivy-hydra indent-guide hungry-delete hl-todo highlight-parentheses highlight-numbers highlight-indentation helm-make google-translate golden-ratio flycheck-mix flycheck-credo flx-ido fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu eval-sexp-fu elisp-slime-nav dumb-jump diminish diff-hl define-word counsel-projectile column-enforce-mode clean-aindent-mode auto-highlight-symbol auto-compile async alchemist aggressive-indent adaptive-wrap ace-window ace-link))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; IF THERE is more than one, they won't work right.
 '(org-refile-use-outline-path t)
 '(evil-toggle-key "C-`")
 '(package-selected-packages
   (quote
    (helm-gtags ggtags counsel-gtags zoom-frm spacemacs-whitespace-cleanup spacemacs-theme spacemacs-purpose-popwin spaceline-config ivy-spacemacs-help info+ image-mode ido-vertical-mode hide-comnt help-fns+ flycheck-mix flycheck-credo dired-x alchemist hybrid-mode holy-mode evil-evilified-state ob-elixir diff-hl ws-butler winum which-key wgrep volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spaceline smex restart-emacs request rainbow-delimiters popwin persp-mode pcre2el paradox org-plus-contrib org-bullets open-junk-file neotree move-text macrostep lorem-ipsum linum-relative link-hint ivy-hydra indent-guide hungry-delete hl-todo highlight-parentheses highlight-numbers highlight-indentation helm-make google-translate golden-ratio flx-ido fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu eval-sexp-fu elisp-slime-nav dumb-jump diminish define-word counsel-projectile column-enforce-mode clean-aindent-mode auto-highlight-symbol auto-compile aggressive-indent adaptive-wrap ace-window ace-link))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
)
