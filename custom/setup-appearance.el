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

(use-package keypression
	:hook (prog-mode . keypression-mode)
	:config
	(setq keypression-use-child-frame nil
			keypression-fade-out-delay 1.0
			keypression-frame-justify 'keypression-left-justified
			keypression-cast-command-name t
			keypression-cast-command-name-format "%s	%s"
			keypression-combine-same-keystrokes t
			keypression-font-face-attribute '(:width normal :height 200 :weight bold)))

(provide 'setup-appearance)
