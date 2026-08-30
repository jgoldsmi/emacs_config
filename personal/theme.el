;; -*- lexical-binding: t; -*-
;; TODO: switch to lambda themes

(use-package lambda-themes
  :vc (:url "https://codeberg.org/Lambda-Emacs/lambda-themes"
            :rev :newest)
  :config
  (setopt
   lambda-themes-set-italic-comments t
   lambda-themes-set-italic-keywords t
   lambda-themes-set-variable-pitch t
   )
  )

(use-package lambda-line
  :vc (:url "https://codeberg.org/Lambda-Emacs/lambda-line" :rev :newest)
  :custom
  (lambda-line-position 'top)        ; default 'bottom — status line as a header
  (lambda-line-abbrev t)             ; default nil — shorten major-mode names
  (lambda-line-prefix-padding nil)   ; default t
  (lambda-line-hspace "  ")          ; default " " — cushion
  (lambda-line-space-top +.50)       ; default +.35 — vertical padding
  (lambda-line-symbol-position 0.1)  ; default .067 — nudge the status glyph
  (lambda-line-use-nerd-icons t)
  :config
  (lambda-line-mode)
  (when (eq lambda-line-position 'top)
    (setq-default mode-line-format (list "%_"))
    (setq mode-line-format (list "%_"))))

(use-package circadian
  :ensure t
  :config
  (setq calendar-latitude 40.7306
        calendar-longitude -73.9352)
  (setq circadian-themes '((:sunrise . lambda-light)
                           (:sunset  . lambda-dark)))
  (circadian-setup))

(set-frame-font "RobotoMono Nerd Font" nil t)

;; Customize whitespace-mode
(setq whitespace-style '(face tabs empty trailing))   ; drop lines-tail, lambda blanks it out
