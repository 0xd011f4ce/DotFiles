;; theme
(use-package material-theme
	:config
	(load-theme 'material t))

;; rainbow-delimiters
(use-package rainbow-delimiters
	:hook (prog-mode . rainbow-delimiters-mode))

;; moody
(use-package moody
	:config
	(setq x-underline-at-descent-line t)
	(moody-replace-mode-line-buffer-identification)
	(moody-replace-vc-mode)
	(moody-replace-eldoc-minibuffer-message-function))

(set-face-attribute 'default nil
				:family "JetBrains Mono"
				:height 95)

(provide 'setup-appearance)
