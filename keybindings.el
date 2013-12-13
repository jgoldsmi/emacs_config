;; Keybindings
(define-key global-map (kbd "RET") 'newline-and-indent)
(global-set-key (kbd "C-z") 'scroll-down-command)
(global-set-key "\C-w" 'backward-kill-word)  ;; From effective emacs
(global-set-key "\C-x\C-k" 'kill-region)
(global-set-key "\C-c\C-k" 'kill-region)
(global-set-key "\C-x\C-m" 'execute-extended-command)
(global-set-key "\C-c\C-m" 'execute-extended-command)
(global-set-key "\M-<" 'beginning-of-buffer)
(global-set-key "\M->" 'end-of-buffer)
