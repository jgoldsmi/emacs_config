;; -*- lexical-binding: t; -*-

(use-package typst-ts-mode
  :vc (:url "https://codeberg.org/meow_king/typst-ts-mode.git" :rev :newest)
  :ensure t
  :mode ("\\.typ\\'" . typst-ts-mode)
  )
