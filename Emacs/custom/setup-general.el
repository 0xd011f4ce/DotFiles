(menu-bar-mode -1)

(setq gc-cons-threshold (* 100 1024 1024)
			read-process-output-max (* 1024 1024)
			inhibit-startup-message t
			auto-save-default nil
			create-lockfiles nil
			make-backup-files nil)

(defalias 'yes-or-no-p 'y-or-n-p)

;; use tabs instead of spaces
(setq-default indent-tabs-mode t
							tab-width 2)
(defvaralias 'c-basic-offset 'tab-width)

(defun tabify-before-save ()
	(when (derived-mode-p 'prog-mode)
		(tabify (point-min) (point-max))))
(add-hook 'before-save-hook #'tabify-before-save)

;; yasnippet
(use-package yasnippet
	:config
	(yas-global-mode))

(use-package yasnippet-snippets
	:after yasnippet)

;; projectile
(use-package projectile
	:config
	(projectile-mode +1)
	(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
	(setq projectile-indexing-method 'hybrid))

;; hydra
(use-package hydra)

;; avy
(use-package avy)

;; helm
(use-package helm
	:config
	(helm-mode)
	(global-set-key [remap find-file] #'helm-find-files)
	(global-set-key [remap execute-extended-command] #'helm-M-x)
	(global-set-key [remap switch-to-buffer] #'helm-mini))

(use-package helm-xref
	:after helm)

;; multiple-cursors
(use-package multiple-cursors
	:bind (("C-c f" . mc/mark-next-like-this)
				 ("C-c b" . mc/mark-previous-like-this)))

;; which-key
(use-package which-key
	:config
	(which-key-mode))

(add-hook 'prog-mode-hook
					(lambda ()
						(electric-pair-mode)
						(display-line-numbers-mode)
						(setq display-line-numbers 'relative)
						(column-number-mode)))

;; magit
(use-package magit
	:ensure)

;; C-a goes to the first non-whitespace character
(defun my/move-beginning-of-line ()
	(interactive)
	(if (<= (current-column) (current-indentation))
			(move-beginning-of-line nil)
		(back-to-indentation)))

(global-set-key (kbd "C-a") 'my/move-beginning-of-line)

(provide 'setup-general)
