;;; init-compat --- code to keep things working across versions of emacs
;;; Commentary:

;;; Code:
(unless (fboundp 'string-prefix-p) ;; < 24
  (defun string-prefix-p (str1 str2 &optional ignore-case)
    "Return non-nil if STR1 is a prefix of STR2.
    If IGNORE-CASE is non-nil, the comparison is done without paying attention
    to case differences."
    (eq t (compare-strings str1 nil nil
                           str2 0 (length str1) ignore-case))))

(provide 'init-compat)
;;; init-compat.el ends here
