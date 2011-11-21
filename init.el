;; init.el
(menu-bar-mode -1)
(setq indent-tabs-mode nil)
(setq inhibit-splash-screen t)

;; Pymacs/Rope
;; Install python-rope and python-ropemacs and pymacs via package manager
(require 'pymacs)
(pymacs-load "ropemacs" "rope-")

;; Magit
(add-to-list 'load-path "~/.emacs.d/magit")
(require 'magit)

;; undo-tree
(add-to-list 'load-path "~/.emacs.d/undo-tree")
(require 'undo-tree)
(global-undo-tree-mode)

;; Evil
(add-to-list 'load-path "~/.emacs.d/evil")
(require 'evil)
(evil-mode 1)
