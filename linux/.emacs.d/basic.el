(org-babel-load-file (expand-file-name "basic.org" "~/personal/dotfiles/common/.emacs.d/"))

(eval-after-load 'evil-maps
(dolist (map '(evil-motion-state-map
evil-normal-state-map
evil-insert-state-map
evil-emacs-state-map))
(define-key (eval map) (kbd "C-/") nil)
(define-key (eval map) (kbd "C-n") nil)
(define-key (eval map) (kbd "C-z") nil)
(define-key (eval map) (kbd "C-e") nil))
(define-key (eval map) "\C-e" nil))

(global-set-key (kbd "C-/") nil)
(global-set-key (kbd "C-z") nil)
(define-key undo-tree-map (kbd "C-/") nil)

(global-set-key (kbd "C-z") 'undo)
(global-set-key (kbd "C-/") 'comment-or-uncomment-region-or-line)
