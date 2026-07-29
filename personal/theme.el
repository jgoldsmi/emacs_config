;; TODO: switch to lambda themes
;; (use-package nano-theme
;;  :ensure t)
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

(use-package circadian
  :ensure t
  :config
  (setq calendar-latitude 40.7306
        calendar-longitude -73.9352)
  (setq circadian-themes '((:sunrise . lambda-light)
                           (:sunset  . lambda-dark)))
  (circadian-setup))

(set-frame-font "Maple Mono NF 13" nil t)
