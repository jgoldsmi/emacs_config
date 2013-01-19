(require 'evil)
(evil-mode 1)

(define-key evil-normal-state-map ",c" 'comment-dwim)
(define-key evil-visual-state-map ",c" 'comment-dwim)
