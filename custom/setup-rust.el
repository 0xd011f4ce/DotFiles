(use-package eglot
	:ensure t)

(use-package flycheck
	:ensure
	:config
	(global-flycheck-mode +1))

(use-package rust-mode
	:init
	:hook ((rust-mode . eglot-ensure)))

(use-package company
	:ensure
	:hook ((prog-mode-hook . company-mode)
				 (rust-mode . company-mode))
	:custom
	(company-idle-delay 0.0)
	(company-minimum-prefix-length 1))

(provide 'setup-rust)
