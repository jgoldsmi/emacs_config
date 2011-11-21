;; init.el
(menu-bar-mode -1)
(setq indent-tabs-mode nil)

;; Evil
(add-to-list 'load-path "~/.emacs.d/evil")
(require 'evil)
(evil-mode 1)