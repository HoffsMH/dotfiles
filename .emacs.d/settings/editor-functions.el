(defun comment-or-uncomment-region-or-line ()
		"Comments or uncomments the region or the current line if there's no active region."
		(interactive)
		(let (beg end)
				(if (region-active-p)
						(setq beg (region-beginning) end (region-end))
						(setq beg (line-beginning-position) end (line-end-position)))
				(comment-or-uncomment-region beg end)))



(defun my-setup-indent (n)
	(setq-default tab-width n)
	(setq-local css-indent-offset n)) ; css-mode

(defun two-space-indent ()
	(interactive)
	(message "2 space indent Active!")
	;; use space instead of tab
	(setq indent-tabs-mode nil)
	(setq indent-line-function 'insert-tab)

	;; indent 2 spaces width
	(my-setup-indent 2))

(defun unindent-region (N)
	(interactive "p")
	(if (use-region-p)
			(progn (indent-rigidly (region-beginning) (region-end) (* N -2))
						 (setq deactivate-mark nil))
		(self-insert-command N)))

(defun my-indent-region (N)
	(interactive "p")
	(if (use-region-p)
			(progn (indent-rigidly (region-beginning) (region-end) (* N 2))
						 (setq deactivate-mark nil))
		(self-insert-command N)))
