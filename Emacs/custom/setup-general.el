(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

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

;; texfrag
(use-package texfrag
	:ensure t
	:config
	(texfrag-global-mode 1))

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

;; lsp,flycheck and company
(use-package lsp-mode
	:ensure t
	:init
	(add-hook 'prog-mode-hook 'lsp-deferred))

(use-package lsp-ui
	:ensure t
	:after lsp-mode
	:custom
	(setq lsp-ui-sideline-show-diagnostics t
				lsp-ui-sideline-show-hover t
				lsp-ui-sideline-show-code-actions t
				lsp-ui-sideline-update-mode 'point
				lsp-ui-sideline-delay 0.1
				lsp-ui-peek-enable t
				lsp-ui-doc-show-with-cursor t)
	:custom
	(define-key lsp-ui-mode-map [remap xref-find-definitions] #'lsp-ui-peek-find-definitions)
	(define-key lsp-ui-mode-map [remap xref-find-references] #'lsp-ui-peek-find-references))

(use-package flycheck
	:ensure
	:config
	(global-flycheck-mode +1))

(use-package company
	:ensure
	:init
	(add-hook 'prog-mode-hook #'company-mode)
	:custom
	(company-idle-delay 0.0)
	(company-minimum-prefix-length 1))

(provide 'setup-general)
