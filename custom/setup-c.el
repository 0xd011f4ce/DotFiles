(use-package lsp-mode
	:hook ((c-mode . lsp)
				 (c++-mode . lsp))
	:custom
	(lsp-idle-delay 0.1))

(use-package helm-lsp
	:after lsp-mode
	:commands helm-lsp-workspace-symbol)

(use-package flycheck)

(use-package company
	:custom
	(company-idle-delay 0.0)
	(company-minimum-prefix-length 1))

(provide 'setup-c)
