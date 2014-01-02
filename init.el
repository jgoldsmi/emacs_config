;;; init.el --- Emacs init stuff
;;; Commentary:
;;; Code:
(add-to-list 'load-path "~/.emacs.d")
(require 'init-compat)
(require 'init-el-get)
(require 'init-keybindings)
(require 'init-backups)

;; Basic config
(when (not (eq window-system 'ns))
  (menu-bar-mode -1))
(when (functionp 'tool-bar-mode) (tool-bar-mode 0))
(setq-default indent-tabs-mode nil)
(setq inhibit-splash-screen t)
(setq kill-whole-line t)
(setq require-final-newline 'query)
(setq-default major-mode 'text-mode)
(setq-default fill-column 80)
(setq-default show-trailing-whitespace t)
(column-number-mode 1)
(show-paren-mode 1)
(global-hl-line-mode 1)
(when window-system (global-linum-mode))
(defalias 'yes-or-no-p 'y-or-n-p)
(defalias 'list-buffers 'ibuffer)

;; Remember place in files
(setq save-place-file "~/.emacs.d/saveplace")
(setq-default save-place t)
(require 'saveplace)

;; recentf
(recentf-mode 1)

;; Uniquify
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)
(setq uniquify-separator "/")
(setq uniquify-after-kill-buffer-p t) ; rename after killing uniquified
(setq uniquify-ignore-buffers-re "^\\*") ; don't muck with special buffers

;; Flyspell
(defun turn-on-flyspell ()
   "Force command `flyspell-mode' on using a positive arg.  For use in hooks."
   (interactive)
   (flyspell-mode 1))
(add-hook 'message-mode-hook 'turn-on-flyspell)
(add-hook 'text-mode-hook 'turn-on-flyspell)
(add-hook 'python-mode-hook 'flyspell-prog-mode)
(add-hook 'c-mode-common-hook 'flyspell-prog-mode)

(provide 'init)
;;; init.el ends here
