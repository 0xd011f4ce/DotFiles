(use-package emms
	:config
	(require 'emms-setup)
	(emms-all)
	(setq emms-source-file-default-directory (expand-file-name "~/Music/")

				emms-source-playlist-default-format 'm3u
				emms-playlist-mode-center-when-go t
				emms-playlist-default-major-mode 'emms-playlist-mode
				emms-show-format "NP: %s"

				emms-player-list '(emms-player-mpv)
				emms-player-mpv-parameters '("--quiet" "--really-quiet" "--no-audio-display" "--force-window=no" "--vo=null" "--volume=30"))
	:custom
	(emms-browser-covers #'emms-browser-cache-thumbnail-async)
	:init
	(require 'emms-librefm-scrobbler)
	(emms-librefm-scrobbler-enable)
	:bind
	(("C-c w m b" . emms-browser)
	 ("C-c w m e" . emms)
	 ("C-c w m p" . emms-play-playlist)
	 ("<XF86AudioRaiseVolume>" . emms-volume-lower)
	 ("<XF86AudioLowerVolume>" . emms-volume-raise)))

(provide 'setup-emms)
