;; init.el

;; Basic config
(menu-bar-mode -1)
(when (functionp 'tool-bar-mode) (tool-bar-mode 0))
(setq indent-tabs-mode nil)
(setq inhibit-splash-screen t)
(setq kill-whole-line t)
(setq require-final-newline 'query)
(setq-default major-mode 'text-mode)
(setq-default fill-column 80)
(setq-default show-trailing-whitespace t)
(column-number-mode 1)
(ido-mode 1)
(define-key global-map (kbd "RET") 'newline-and-indent)
(when window-system (global-linum-mode))
(defalias 'yes-or-no-p 'y-or-n-p)
(defalias 'list-buffers 'ibuffer)

;; custom file
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

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
(defun recentf-ido-find-file ()
  "Find a recent file using Ido."
  (interactive)
  (let ((file (ido-completing-read "Choose recent file: " recentf-list nil t)))
    (when file
      (find-file file))))
(global-set-key "\C-x\C-r" 'recentf-ido-find-file)

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

;; Keybindings
;; (define-key evil-normal-state-map ",i" 'ibuffer)
;; (define-key evil-normal-state-map ",b" 'ido-switch-buffer)
;; (define-key evil-normal-state-map ",c" 'comment-dwim)
;; (define-key evil-visual-state-map ",c" 'comment-dwim)
;; (define-key evil-normal-state-map ",m" 'magit-status)
;; (define-key evil-normal-state-map ",r" 'recentf-ido-find-file)
;; (define-key evil-normal-state-map ",x" 'smex)
;; (define-key evil-normal-state-map "ZZ" (kbd "C-c C-c"))
;; (define-key minibuffer-local-map (kbd "C-w") 'backward-kill-word)

;; emacs server
(server-start)
