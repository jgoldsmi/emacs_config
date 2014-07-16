(setq jedi:setup-keys t)
(setq jedi:complete-on-dot t)
(add-hook 'python-mode-hook 'jedi:ac-setup)
(add-to-list 'auto-mode-alist '("\\.psp\\'" . python-mode))
