(use-package lsp-mode
	:hook ((c-mode . lsp)
				 (c++-mode . lsp))
	:custom
	(lsp-idle-delay 0.1)
	(lsp-eldoc-render-all t)
	(lsp-inlay-hint-enable t)
	(add-hook 'lsp-mode-hook 'lsp-ui-mode))

(use-package lsp-ui
	:ensure
	:commands lsp-ui-mode
	:custom
	(lsp-ui-peek-always-show t)
	(lsp-ui-sideline-show-hover t)
	(lsp-ui-doc-enable nil))

(use-package helm-lsp
	:after lsp-mode
	:commands helm-lsp-workspace-symbol)

(use-package flycheck :ensure)

(use-package company
	:ensure
	:hook ((lsp-mode . company-mode))
	:custom
	(company-idle-delay 0.0)
	(company-minimum-prefix-length 1))

(provide 'setup-c)
