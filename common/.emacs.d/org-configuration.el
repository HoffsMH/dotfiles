(setq org-log-done 'time)

(setq org-directory "~/personal/")

(defun org-file-path (filename)
  "Return the absolute address of an org file, given its relative name."
  (concat (file-name-as-directory org-directory) filename))

(setq org-link-frame-setup
'((vm . vm-visit-folder-other-frame)
(vm-imap . vm-visit-imap-folder-other-frame)
(gnus . org-gnus-no-new-news)
(file . find-file)
(wl . wl-other-frame)))

(setq org-ellipsis "⤵")

(setq org-default-notes-file (expand-file-name "~/personal/00-capture/capture.org"))

(setq org-refile-targets (quote (
("~/personal/01-schedule/project-list.org" :maxlevel . 1)
("~/personal/01-schedule/next-actions.org" :maxlevel . 1))))

(setq org-archive-location
(concat (org-file-path "archive/archive.org") "::* From %s"))

(defun hrs/mark-done-and-archive ()
  "Mark the state of an org-mode item as DONE and archive it."
  (interactive)
  (org-todo 'done)
  (org-archive-subtree))

(define-key org-mode-map (kbd "C-c C-x C-s") 'hrs/mark-done-and-archive)
