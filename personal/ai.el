(use-package agent-shell
  :ensure t
  :bind (("C-c a" . agent-shell)
         ("C-c A" . agent-shell-send-dwim))
  :config
  (setq agent-shell-anthropic-authentication
        (agent-shell-anthropic-make-authentication :login t))
  (setq agent-shell-preferred-agent-config
        (agent-shell-anthropic-make-claude-code-config))
  ;; keep Prelude's whitespace/indent modes from fighting agent edits
  (setq agent-shell-write-inhibit-minor-modes '(whitespace-mode)))
