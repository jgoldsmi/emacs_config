;; init.el
(menu-bar-mode -1)
(setq indent-tabs-mode nil)
(setq inhibit-splash-screen t)
(setq kill-whole-line t)

;; Pymacs/Rope
;; Install python-rope and python-ropemacs and pymacs via package manager
(require 'pymacs)
(pymacs-load "ropemacs" "rope-")
(setq ropemacs-enable-autoimport t)

;; Pyflakes checking
(when (load "flymake" t) 
  (defun flymake-pyflakes-init () 
    (let* ((temp-file (flymake-init-create-temp-buffer-copy 
		       'flymake-create-temp-inplace)) 
	   (local-file (file-relative-name 
			temp-file 
			(file-name-directory buffer-file-name)))) 
      (list "pyflakes" (list local-file)))) 
  (add-to-list 'flymake-allowed-file-name-masks 
	       '("\\.py\\'" flymake-pyflakes-init))) 

(add-to-list 'load-path "~/.emacs.d/flymake-cursor")
(load-library "flymake-cursor")
(add-hook 'find-file-hook 'flymake-find-file-hook)

;; Magit
(add-to-list 'load-path "~/.emacs.d/magit")
(require 'magit)

;; undo-tree
(add-to-list 'load-path "~/.emacs.d/undo-tree")
(require 'undo-tree)
(global-undo-tree-mode)

;; auto-complete
(add-to-list 'load-path "~/.emacs.d/auto-complete")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/auto-complete/dict")
(ac-config-default)

;; Evil
(add-to-list 'load-path "~/.emacs.d/evil")
(require 'evil)
(evil-mode 1)
