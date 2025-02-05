(use-package org-bullets
	:config
	(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
	:custom
	(org-bullets-bullet-list '("◉" "○" "●" "○" "●" "○" "●")))

(setq org-hide-emphasis-markers t
			org-pretty-entities t
			org-agenda-tags-column 0

			org-auto-align-tags nil
			org-tags-column 0
			org-catch-invisible-edits 'show-and-error
			org-special-ctrl-a/e t
			org-insert-heading-respect-content t

			org-ellipsis "…")

(add-hook 'org-mode-hook (lambda ()
													 (variable-pitch-mode)
													 (visual-line-mode)
													 (org-indent-mode)))

(defun update-org-last-modified ()
	"Update the #+LAST_MODIFIED everytime we save."
	(when (derived-mode-p 'org-mode)
		(save-excursion
			(goto-char (point-min))
			(when (re-search-forward "^#\\+LAST_MODIFIED:" nil t)
				(delete-region (point) (line-end-position))
				(insert (format-time-string " %a %d %b %T UTC %Y" (current-time) t))))))

(add-hook 'before-save-hook 'update-org-last-modified)

(font-lock-add-keywords 'org-mode
												'(("^ *\\([-]\\) "
													 (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))

(custom-theme-set-faces
 'user
 '(org-block ((t (:inherit fixed-pitch))))
 '(org-code ((t (:inherit (shadow fixed-pitch)))))
 '(org-document-info ((t (:foreground "dark orange"))))
 '(org-document-info-keyword ((t (:inherit (shadow fixed-pitch)))))
 '(org-indent ((t (:inherit (org-hide fixed-pitch)))))
 '(org-link ((t (:foreground "royal blue" :underline t))))
 '(org-meta-line ((t (:inherit (font-lock-comment-face fixed-pitch)))))
 '(org-property-value ((t (:inherit fixed-pitch))) t)
 '(org-special-keyword ((t (:inherit (font-lock-comment-face fixed-pitch)))))
 '(org-table ((t (:inherit fixed-pitch :foreground "#83a598"))))
 '(org-tag ((t (:inherit (shadow fixed-pitch) :weight bold :height 0.8))))
 '(org-verbatim ((t (:inherit (shadow fixed-pitch))))))

(use-package org-roam
	:ensure t
	:custom
	(org-roam-directory "~/RoamNotes")
	:bind (("C-c n l" . org-roam-buffer-toggle)
				 ("C-c n f" . org-roam-node-find)
				 ("C-c n i" . org-roam-node-insert))
	:config
	(org-roam-setup))

(use-package org-drill
	:ensure t)

;; setup agenda
(setq org-directory "~/Org"
			org-agenda-files '("Tasks.org" "Birthdays.org" "Habits.org")

			org-agenda-start-with-log-mode t
			org-log-done 'time
			org-log-into-drawer t)

(setq org-todo-keywords
			'((sequence "TODO(t)" "NEXT(n)" "|" "DONE(d!)")
				(sequence "BACKLOG(b)" "PLANNED(p)" "READY(r)" "ACTIVE(a)" "REVIEW(v)" "WAIT(w@/!)" "HOLD(h)" "|" "COMPLETED(c)")))

(setq org-agenda-custom-commands
			'(("d" "Dashboard"
				 ((agenda "" ((org-deadline-warning-days 7)))
					(todo "NEXT"
								((org-agenda-overriding-header "Next Tasks")))
					(tags-todo "agenda/ACTIVE" ((org-agenda-overriding-header "Active Projects")))))

				("n" "Next Tasks"
				 ((todo "NEXT"
								((org-agenda-overriding-header "Next Tasks")))))


				;; Low-effort next actions
				("e" tags-todo "+TODO=\"NEXT\"+Effort<15&+Effort>0"
				 ((org-agenda-overriding-header "Low Effort Tasks")
					(org-agenda-max-todos 20)
					(org-agenda-files org-agenda-files)))

				("w" "Workflow Status"
				 ((todo "WAIT"
								((org-agenda-overriding-header "Waiting on External")
								 (org-agenda-files org-agenda-files)))
					(todo "REVIEW"
								((org-agenda-overriding-header "In Review")
								 (org-agenda-files org-agenda-files)))
					(todo "PLAN"
								((org-agenda-overriding-header "In Planning")
								 (org-agenda-todo-list-sublevels nil)
								 (org-agenda-files org-agenda-files)))
					(todo "BACKLOG"
								((org-agenda-overriding-header "Project Backlog")
								 (org-agenda-todo-list-sublevels nil)
								 (org-agenda-files org-agenda-files)))
					(todo "READY"
								((org-agenda-overriding-header "Ready for Work")
								 (org-agenda-files org-agenda-files)))
					(todo "ACTIVE"
								((org-agenda-overriding-header "Active Projects")
								 (org-agenda-files org-agenda-files)))
					(todo "COMPLETED"
								((org-agenda-overriding-header "Completed Projects")
								 (org-agenda-files org-agenda-files)))
					(todo "CANC"
								((org-agenda-overriding-header "Cancelled Projects")
								 (org-agenda-files org-agenda-files)))))))

(setq org-capture-templates
			`(("t" "Tasks / Projects")
				("tt" "Task" entry (file+olp "~/Org/Tasks.org" "Inbox")
				 "* TODO %?\n	 %U\n	 %i" :empty-lines 1)
				("ts" "Clocked Entry Subtask" entry (clock)
				 "* TODO %?\n	 %U\n	 %i" :empty-lines 1)

				("j" "Journal Entries")
				("jj" "Journal" entry
				 (file+olp+datetree "~/Org/Journal.org")
				 "\n* %<%I:%M %p> - Journal :journal:\n\n%?\n\n"
				 :clock-in :clock-resume
				 :empty-lines 1)
				("jm" "Meeting" entry
				 (file+olp+datetree "~/Org/Tasks.org")
				 "* %<%I:%M %p> - Meeting :meetings:\n\n%?\n\n"
				 :clock-in :clock-resume
				 :empty-lines 1)))

(define-key global-map (kbd "C-c j")
						(lambda () (interactive) (org-capture)))

;; org-habit
(require 'org-habit)
(add-to-list 'org-modules 'org-habit)
(setq org-habit-graph-column 60)

(provide 'setup-org)
