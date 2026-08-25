;; -*- lexical-binding: t -*-

(use-package org-roam
  :ensure t
  :config
  (setopt
   org-roam-directory (file-truename "~/org-roam")
   org-roam-dailies-directory "daily/"
   org-roam-dailies-capture-templates
   '(("d" "default" entry
      "* %?"
      :target (file+head "%<%Y-%m-%d>.org"
                         "#+title: %<%Y-%m-%d>\n"))))
  (org-roam-db-autosync-mode)
  )

(setq org-agenda-files '("~/org-roam/" "~/org-roam/daily/"))

(defun jg/org-fill-setup ()
  (setq-local fill-column 80)
  (auto-fill-mode +1))

(add-hook 'org-mode-hook #'jg/org-fill-setup)

(setq org-todo-keywords '((sequence "TODO" "PROG" "|" "DONE")))


(defun jg/paste-slack-rich-text ()
  "Paste HTML text from the macOS clipboard as formatted Org links."
  (interactive)
  (let ((html-hex (shell-command-to-string
                   "osascript -e 'the clipboard as \"HTML\"' 2>/dev/null")))
    (if (or (string-empty-p html-hex) (string-match-p "error" html-hex))
        ;; Fallback to standard yank if there is no rich text/HTML in the clipboard
        (call-interactively 'org-yank)
      ;; Decode hex string into raw HTML text, then parse with pandoc
      (let ((converted-text
             (shell-command-to-string
              (format "osascript -e 'the clipboard as \"HTML\"' | perl -ne 'print chr foreach unpack(\"C*\", pack(\"H*\", substr($_,11,-3)))' | pandoc -f html -t org"))))
        (insert converted-text)))))

(global-set-key (kbd "C-c x a") 'org-agenda)
(global-set-key (kbd "C-c x f") 'org-roam-node-find)
(global-set-key (kbd "C-c x i") 'org-roam-node-insert)
(global-set-key (kbd "C-c x t") 'org-roam-dailies-goto-today)
