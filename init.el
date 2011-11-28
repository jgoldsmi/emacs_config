;; init.el
(menu-bar-mode -1)
(if (functionp 'tool-bar-mode) (tool-bar-mode 0))
(setq indent-tabs-mode nil)
(setq inhibit-splash-screen t)
(setq kill-whole-line t)
(column-number-mode 1)
(setq display-time-day-and-date t)
(display-time)
(ido-mode 1)
(defalias 'yes-or-no-p 'y-or-n-p)
(defalias 'list-buffers 'ibuffer)

;; Remember place in files
(setq save-place-file "~/.emacs.d/saveplace")
(setq-default save-place t)
(require 'saveplace)

;; Backups
(setq backup-directory-alist `(("." . "~/.emacs.d/saves")))
(setq backup-by-copying t)
(setq delete-old-versions t
  kept-new-versions 6
  kept-old-versions 2
  version-control t)

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

;; Python Section

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

;; Additional libraries, install through apt
(require 'python-mode)
(require 'ipython)

;; END Python Section

;; reST
(add-to-list 'auto-mode-alist '("\\.rst$" . rst-mode))
(add-to-list 'auto-mode-alist '("\\.rest$" . rst-mode))
(add-to-list 'auto-mode-alist '("\\.txt$" . rst-mode))

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


;; Markdown mode
(add-to-list 'load-path "~/.emacs.d/markdown-mode")
(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing Markdown files" t)
(setq auto-mode-alist
      (cons '("\\.md" . markdown-mode) auto-mode-alist))

;; smex
(add-to-list 'load-path "~/.emacs.d/smex")
(require 'smex)
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

;; rainbow delimiters
(add-to-list 'load-path "~/.emacs.d/rainbow-delimiters")
(require 'rainbow-delimiters)
(global-rainbow-delimiters-mode)

;; Evil
(add-to-list 'load-path "~/.emacs.d/evil")
(require 'evil)
(evil-mode 1)

;;; This was installed by package-install.el.
;;; This provides support for the package system and
;;; interfacing with ELPA, the package archive.
;;; Move this code earlier if you want to reference
;;; packages in your .emacs.
(when
    (load
     (expand-file-name "~/.emacs.d/elpa/package.el"))
  (package-initialize))
