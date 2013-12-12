(setq helm-c-locate-command
      (case system-type
	('gnu/linux "locate -i -r %s")
	('berkeley-unix "locate -i %s")
	('windows-nt "es %s")
	('darwin "mdfind -name %s %s")
	(t "locate %s"))
      )
(require 'helm)
(helm-mode 1)

;; (define-key evil-normal-state-map ",b" 'helm-buffers-list)
;; (define-key evil-normal-state-map ",x" 'helm-M-x)
;; (define-key evil-normal-state-map ",f" 'helm-for-files)
;; (define-key evil-normal-state-map ",p" 'helm-show-kill-ring)
