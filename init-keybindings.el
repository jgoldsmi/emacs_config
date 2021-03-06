;;; init-keybindings.el -- Keybindings not specific to an el-get package
;;; Commentary:

;;; Code:
(global-set-key (kbd "RET") 'newline-and-indent)
(global-set-key (kbd "C-w") 'backward-kill-word)
(global-set-key "\C-x\C-k" 'kill-region)
(global-set-key "\C-c\C-k" 'kill-region)
(global-set-key "\C-x\\" 'align-regexp)
(global-set-key "\C-z" 'scroll-down-command)

(provide 'init-keybindings)
;;; init-keybindings ends here
