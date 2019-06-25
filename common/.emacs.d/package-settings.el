(use-package auto-compile
  :config (auto-compile-on-load-mode))

(setq ivy-use-virtual-buffers t)
(setq ivy-count-format "%d/%d ")

(global-set-key (kbd "C-s-y") 'counsel-yank-pop)
(global-set-key (kbd "C-s-<268632089>") 'counsel-yank-pop)

(global-set-key (kbd "C-s-<268632070>") 'counsel-ag)

(setq ivy-re-builders-alist
'((counsel-ag . ivy--regex-plus)
(counsel-projectile-find-file . ivy--regex-fuzzy)
(t . ivy--regex-fuzzy)))

(setq frame-title-format '((:eval (projectile-project-name))))

(setq projectile-completion-system 'ivy)

(add-to-list 'auto-mode-alist '("\\.js\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsx$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.hbs$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.eex$" . web-mode))

(setq exec-path-from-shell-debug nil)
(setq exec-path-from-shell-shell-name "/bin/zsh")

;; https://github.com/purcell/exec-path-from-shell
;; only need exec-path-from-shell on OSX
;; this hopefully sets up path and other vars better

(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

(smartparens-global-mode 1)

(global-set-key (kbd "C-s-<268632078>") 'move-text-down)
(global-set-key (kbd "C-s-n") 'move-text-down)

(global-set-key (kbd "C-s-<268632080>") 'move-text-up)
(global-set-key (kbd "C-s-p") 'move-text-up)

(global-diff-hl-mode)
(add-hook 'prog-mode-hook 'turn-on-diff-hl-mode)
(add-hook 'vc-dir-mode-hook 'turn-on-diff-hl-mode)

(global-set-key (kbd "s-d") 'er/expand-region)

(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . t)
(elixir . t))
;; ...
)

(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "C-x C-g p") 'magit-push-current)
(global-set-key (kbd "C-x C-g o") 'magit-pull-popup)

(global-set-key (kbd "C->") 'mc/mark-next-like-this)
