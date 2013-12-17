(setq helm-c-locate-command
      (case system-type
	('gnu/linux "locate -i -r %s")
	('berkeley-unix "locate -i %s")
	('windows-nt "es %s")
	('darwin "mdfind -name %s %s")
	(t "locate %s"))
      )
(helm-mode 1)
(global-set-key (kbd "C-x C-m") 'helm-M-x)
(global-set-key (kbd "C-c C-m") 'helm-M-x)
