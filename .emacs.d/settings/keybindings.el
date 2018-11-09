;; command backspace mac style
(global-set-key (kbd "s-<backspace>") '(lambda () (interactive) (kill-line 0)) )

(global-set-key (kbd "s-/") 'comment-or-uncomment-region-or-line)

(global-set-key (kbd "C-s") 'swiper)
(global-set-key (kbd "C-/") 'hippie-expand)

(global-set-key (kbd "C-x C-m") 'execute-extended-command)
(global-set-key (kbd "C-x m") 'execute-extended-command)

;; expand region
(global-set-key (kbd "s-d") 'er/expand-region)

(global-set-key (kbd "s-<right>") 'move-end-of-line)
(global-set-key (kbd "s-<left>") 'move-beginning-of-line)

;;move-text
(global-set-key (kbd "C-s-<268632078>") 'move-text-down)
(global-set-key (kbd "C-s-n") 'move-text-down)

(global-set-key (kbd "C-s-<268632080>") 'move-text-up)
(global-set-key (kbd "C-s-p") 'move-text-up)

;; magit-status
(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "C-x C-g p") 'magit-push-current)
(global-set-key (kbd "C-x C-g o") 'magit-pull-popup)


;;counsel-ag
(global-set-key (kbd "C-s-s") 'counsel-ag)

(global-set-key (kbd "s-p") 'counsel-git)



(global-set-key (kbd "C-x v") 'describe-variable)
(define-key global-map (kbd "C-s-s") 'counsel-ag)
(define-key global-map (kbd "C-s-<268632083>") 'counsel-ag)


;; set keys for Apple keyboard, for emacs in OS X
(setq mac-command-modifier 'super) ; make cmd key do Meta
;; (setq mac-option-modifier 'super) ; make opt key do Super



(global-set-key (kbd "C->") 'mc/mark-next-like-this)

(global-set-key (kbd "C-f") 'syntax-subword-forward)
(global-set-key (kbd "C-b") 'syntax-subword-backward)
(global-set-key (kbd "s-]") 'my-indent-region)
(global-set-key (kbd "s-[") 'unindent-region)

(global-set-key (kbd "s-=") 'text-scale-increase)
(global-set-key (kbd "s--") 'text-scale-decrease)
(global-set-key (kbd "C-0") 'delete-window)
(global-set-key (kbd "C-o") 'other-window)

(global-unset-key (kbd "M-c"))
