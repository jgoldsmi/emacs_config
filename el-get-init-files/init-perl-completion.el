(setq plcmp-use-keymap nil)
(add-hook 'cperl-mode-hook
	  (lambda()
	    (require 'perl-completion)
	    (perl-completion-mode t)))



(add-hook  'cperl-mode-hook
	   (lambda ()
	     (when (require 'auto-complete nil t) ; no error whatever auto-complete.el is not installed.
	       (make-variable-buffer-local 'ac-sources)
	       (setq ac-sources
		     '(ac-source-perl-completion))
	       (auto-complete-mode 1))))
