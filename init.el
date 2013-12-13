;; init.el
(load-file "compat.el")
(load-file "keybindings.el")
;; Basic config
(when (not (eq window-system 'ns))
  (menu-bar-mode -1))
(when (functionp 'tool-bar-mode) (tool-bar-mode 0))
(setq indent-tabs-mode nil)
(setq inhibit-splash-screen t)
(setq kill-whole-line t)
(setq require-final-newline 'query)
(setq-default major-mode 'text-mode)
(setq-default fill-column 80)
(setq-default show-trailing-whitespace t)
(column-number-mode 1)
(show-paren-mode 1)
(when window-system (global-linum-mode))
(defalias 'yes-or-no-p 'y-or-n-p)
(defalias 'list-buffers 'ibuffer)

;; Remember place in files
(setq save-place-file "~/.emacs.d/saveplace")
(setq-default save-place t)
(require 'saveplace)

;; Backups
(setq backup-directory-alist `(("." . "~/.emacs.d/backups")))
(setq auto-save-file-name-transforms `((".*" "~/.emacs.d/autosaves/\\1" t)))
(setq backup-by-copying t)
(setq delete-old-versions t
  kept-new-versions 6
  kept-old-versions 2
  version-control t)

;; recentf
(require 'recentf)
(recentf-mode 1)

;; Uniquify
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)
(setq uniquify-separator "/")
(setq uniquify-after-kill-buffer-p t) ; rename after killing uniquified
(setq uniquify-ignore-buffers-re "^\\*") ; don't muck with special buffers

;; Flyspell
(defun turn-on-flyspell ()
   "Force flyspell-mode on using a positive arg.  For use in hooks."
   (interactive)
   (flyspell-mode 1))
(add-hook 'message-mode-hook 'turn-on-flyspell)
(add-hook 'text-mode-hook 'turn-on-flyspell)
(add-hook 'python-mode-hook 'flyspell-prog-mode)
(add-hook 'c-mode-common-hook 'flyspell-prog-mode)

;; reST
(add-to-list 'auto-mode-alist '("\\.rst$" . rst-mode))
(add-to-list 'auto-mode-alist '("\\.rest$" . rst-mode))
(add-to-list 'auto-mode-alist '("\\.txt$" . rst-mode))

;; el-get setup
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(setq el-get-user-package-directory "~/.emacs.d/el-get-init-files")
(setq el-get-install-branch "master")
(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

(setq el-get-sources
      '((:name theme-changer
	       :type github
	       :pkgname "hadronzoo/theme-changer")))

(setq my-packages
      '(auto-complete
	flycheck
	jedi
	helm
	go-mode
	puppet-mode
	js2-mode
	cperl-mode
	anything
	anything-match-plugin
	perl-completion
	magit
	markdown-mode
	rainbow-delimiters
	theme-changer
	solarized-theme
	diminish))

(el-get 'sync my-packages)

;; emacs server
(server-start)
