;; command backspace mac style
(global-set-key (kbd "s-<backspace>") '(lambda () (interactive) (kill-line 0)) )

(global-set-key (kbd "s-/") 'comment-or-uncomment-region-or-line)(global-set-key (kbd "s-/") 'comment-or-uncomment-region-or-line)

(global-set-key (kbd "C-s") 'swiper)
(global-set-key (kbd "C-/") 'hippie-expand)

;; expand region
(global-set-key (kbd "s-d") 'er/expand-region)

(global-set-key (kbd "s-<right>") 'move-end-of-line)
(global-set-key (kbd "s-<left>") 'move-beginning-of-line)

;; magit-status
(global-set-key (kbd "C-x g") 'magit-status)

;;counsel-ag
(global-set-key (kbd "C-s-s") 'counsel-ag)

(global-set-key (kbd "C-x v") 'describe-variable)
