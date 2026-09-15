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

;; TODO: add blackout or some better diminishing

;; TODO: investigate fira code and glyphs
(use-package mood-line
  :ensure t
  :config (mood-line-mode))

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
