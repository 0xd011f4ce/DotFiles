;; theme
(use-package doom-themes
	:ensure t
	:config
	(setq doom-themes-enable-bold t
				doom-themes-enable-italic t)
	(load-theme 'doom-one-light t))

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

(use-package dashboard
	:ensure t
	:config
	(setq dashboard-banner-logo-title "We are all connected"
				dashboard-startup-banner 'logo
				dashboard-center-content t
				dashboard-show-shortcuts t
				dashboard-set-navigator t
				dashboard-set-heading-icons t
				dashboard-set-file-icons t
				initial-buffer-choice (lambda () (get-buffer "*dashboard*"))
				dashboard-projects-switch-function 'projectile-switch-project-by-name

				dashboard-items '((recents . 15)
													(agenda . 10)
													(projects . 10)))
	(dashboard-setup-startup-hook)

	:init
	(add-hook 'after-init-hook 'dashboard-refresh-buffer))

(use-package ligature
	:config
	(ligature-set-ligatures 'prog-mode
													'("|||>" "<|||" "<==>" "<!--" "####" "~~>" "***" "||=" "||>"
														":::" "::=" "=:=" "===" "==>" "=!=" "=>>" "=<<" "=/=" "!=="
														"!!." ">=>" ">>=" ">>>" ">>-" ">->" "->>" "-->" "---" "-<<"
														"<~~" "<~>" "<*>" "<||" "<|>" "<$>" "<==" "<=>" "<=<" "<->"
														"<--" "<-<" "<<=" "<<-" "<<<" "<+>" "</>" "###" "#_(" "..<"
														"..." "+++" "/==" "///" "_|_" "www" "&&" "^=" "~~" "~@" "~="
														"~>" "~-" "**" "*>" "*/" "||" "|}" "|]" "|=" "|>" "|-" "{|"
														"[|" "]#" "::" ":=" ":>" ":<" "$>" "==" "=>" "!=" "!!" ">:"
														">=" ">>" ">-" "-~" "-|" "->" "--" "-<" "<~" "<*" "<|" "<:"
														"<$" "<=" "<>" "<-" "<<" "<+" "</" "#{" "#[" "#:" "#=" "#!"
														"##" "#(" "#?" "#_" "%%" ".=" ".-" ".." ".?" "+>" "++" "?:"
														"?=" "?." "??" ";;" "/*" "/=" "/>" "//" "__" "~~" "(*" "*)"
														"\\\\" "://"))
	(global-ligature-mode t))

(provide 'setup-appearance)
