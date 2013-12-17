;;; init-backups --- settings related to backups
;;; Commentary:

;;; Code:
(setq backup-directory-alist `(("." . "~/.emacs.d/backups")))
(setq auto-save-file-name-transforms `((".*" "~/.emacs.d/autosaves/\\1" t)))
(setq backup-by-copying t)
(setq delete-old-versions t
  kept-new-versions 6
  kept-old-versions 2
  version-control t)

(provide 'init-backups)
;;; init-backups.el ends here
