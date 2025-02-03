(use-package clang-format
	:ensure t
	:init
	(add-hook 'before-save-hook (lambda ()
																(when (or (equal major-mode 'c-mode) (equal major-mode 'c++-mode))
																	(clang-format-buffer)))))

(provide 'setup-c)
