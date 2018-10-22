(defun comment-or-uncomment-region-or-line ()
    "Comments or uncomments the region or the current line if there's no active region."
    (interactive)
    (let (beg end)
        (if (region-active-p)
            (setq beg (region-beginning) end (region-end))
            (setq beg (line-beginning-position) end (line-end-position)))
        (comment-or-uncomment-region beg end)))


;; this enables Ligatures for Fira Code
(when (window-system)
  (set-frame-font "Fira Code"))
(let ((alist '((33 . ".\\(?:\\(?:==\\|!!\\)\\|[!=]\\)")
	       (35 . ".\\(?:###\\|##\\|_(\\|[#(?[_{]\\)")
	       (36 . ".\\(?:>\\)")
	       (37 . ".\\(?:\\(?:%%\\)\\|%\\)")
	       (38 . ".\\(?:\\(?:&&\\)\\|&\\)")
	       (42 . ".\\(?:\\(?:\\*\\*/\\)\\|\\(?:\\*[*/]\\)\\|[*/>]\\)")
	       (43 . ".\\(?:\\(?:\\+\\+\\)\\|[+>]\\)")
	       (45 . ".\\(?:\\(?:-[>-]\\|<<\\|>>\\)\\|[<>}~-]\\)")
	       (46 . ".\\(?:\\(?:\\.[.<]\\)\\|[.=-]\\)")
	       (47 . ".\\(?:\\(?:\\*\\*\\|//\\|==\\)\\|[*/=>]\\)")
	       (48 . ".\\(?:x[a-zA-Z]\\)")
	       (58 . ".\\(?:::\\|[:=]\\)")
	       (59 . ".\\(?:;;\\|;\\)")
	       (60 . ".\\(?:\\(?:!--\\)\\|\\(?:~~\\|->\\|\\$>\\|\\*>\\|\\+>\\|--\\|<[<=-]\\|=[<=>]\\||>\\)\\|[*$+~/<=>|-]\\)")
	       (61 . ".\\(?:\\(?:/=\\|:=\\|<<\\|=[=>]\\|>>\\)\\|[<=>~]\\)")
	       (62 . ".\\(?:\\(?:=>\\|>[=>-]\\)\\|[=>-]\\)")
	       (63 . ".\\(?:\\(\\?\\?\\)\\|[:=?]\\)")
	       (91 . ".\\(?:]\\)")
	       (92 . ".\\(?:\\(?:\\\\\\\\\\)\\|\\\\\\)")
	       (94 . ".\\(?:=\\)")
	       (119 . ".\\(?:ww\\)")
	       (123 . ".\\(?:-\\)")
	       (124 . ".\\(?:\\(?:|[=|]\\)\\|[=>|]\\)")
	       (126 . ".\\(?:~>\\|~~\\|[>=@~-]\\)")
	       )
	     ))
  (dolist (char-regexp alist)
    (set-char-table-range composition-function-table (car char-regexp)
			  `([,(cdr char-regexp) 0 font-shape-gstring]))))


(defun set-frame-size-according-to-resolution ()
  (interactive)
  (if window-system
  (progn
    ;; use 120 char wide window for largeish displays
    ;; and smaller 80 column windows for smaller displays
    ;; pick whatever numbers make sense for you
    (if (> (x-display-pixel-width) 1280)
           (add-to-list 'default-frame-alist (cons 'width 90))
           (add-to-list 'default-frame-alist (cons 'width 180)))
    ;; for the height, subtract a couple hundred pixels
    ;; from the screen height (for panels, menubars and
    ;; whatnot), then divide by the height of a char to
    ;; get the height we want
    (add-to-list 'default-frame-alist
         (cons 'height (/ (- (x-display-pixel-height) line-height)
                             (frame-char-height)))))))

(defun my-setup-indent (n)
  (setq-default tab-width n)
  ;; java/c/c++
  ;; (setq-local c-basic-offset n)
		;; web development
  ;; (setq-local coffee-tab-width n) ; coffeescript
  (setq-local javascript-indent-level 1) ; javascript-mode
  (setq-local js-indent-level 1) ; js-mode

  ;; (setq-local web-mode-markup-indent-offset n) ; web-mode, html tag in html file
  ;; (setq-local web-mode-css-indent-offset n) ; web-mode, css in html file
  ;; (setq-local web-mode-code-indent-offset n) ; web-mode, js code in html file
   (setq-local css-indent-offset 1)) ; css-mode

(defun two-space-indent ()
  (interactive)
  (message "2 space indent Active!")
  ;; use space instead of tab
  (setq indent-tabs-mode nil)
  (setq indent-line-function 'insert-tab)

  ;; indent 2 spaces width
  (my-setup-indent 1))
