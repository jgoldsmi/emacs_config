;; Use cperl-mode instead of perl-mode
(defalias 'perl-mode 'cperl-mode)
(add-hook 'cperl-mode-hook
          (lambda ()
            (set-face-background 'cperl-array-face nil)
            (set-face-background 'cperl-hash-face nil)))
