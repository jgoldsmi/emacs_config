;;; 00-vc.el --- package-vc defaults -*- lexical-binding: t; -*-

;;; Commentary:

;; `use-package' defaults `:rev' to `:last-release' when a `:vc' spec omits it
;; (use-package-core.el, `use-package-normalize--vc-arg').  `package-vc' then
;; resolves that to the newest commit that changed the package's `Version:'
;; header -- which can be years behind the branch head, with no warning.
;;
;; That silently pinned lambda-themes to its second-ever commit (2022) and
;; code-review to v0.0.7, 46 commits before the emacsql 4 fix it needed.  Both
;; presented as broken packages rather than stale checkouts.
;;
;; Setting this here rather than in personal/ matters: the variable is read
;; when each `:vc' form is macroexpanded, so it must be bound before any
;; personal file containing one is loaded.

;;; Code:

(setq use-package-vc-prefer-newest t)

(provide '00-vc)
;;; 00-vc.el ends here
