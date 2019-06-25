(org-babel-load-file (expand-file-name "basic.org" "~/personal/dotfiles/common/.emacs.d/"))

(with-eval-after-load 'evil-maps
(define-key evil-normal-state-map (kbd "C-/") nil)
(define-key evil-normal-state-map (kbd "C-n") nil)
(define-key evil-normal-state-map (kbd "C-z") nil)
(define-key evil-normal-state-map (kbd "C-p") nil))

(global-set-key (kbd "C-/") nil)
(global-set-key (kbd "C-z") nil)
(define-key undo-tree-map (kbd "C-/") nil)

(global-set-key (kbd "C-z") 'undo)
(global-set-key (kbd "C-/") 'comment-or-uncomment-region-or-line)
