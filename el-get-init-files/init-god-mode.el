(require 'god-mode)
(global-set-key (kbd "C-c g") 'god-local-mode)
(define-key god-local-mode-map (kbd ".") 'repeat)
(define-key god-local-mode-map (kbd "i") 'god-local-mode)
