;;; init-el-get.el --- Initialization of el-get
;;; Commentary:
;;; Code:
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(setq el-get-user-package-directory "~/.emacs.d/el-get-init-files")
(setq el-get-install-branch "master")
(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

(setq el-get-sources
      '(
        (:name theme-changer
	       :type github
	       :pkgname "hadronzoo/theme-changer")
        (:name moe-theme
               :type github
               :pkgname "kuanyui/moe-theme.el")
        ))

(setq my-packages
      '(auto-complete
        ack-and-a-half
        ag
	ace-jump-mode
        anzu
        dired+
	git-gutter
        god-mode
	flycheck
	jedi
	helm
        projectile
        moe-theme
	go-mode
	puppet-mode
	js2-mode
	tern
	cperl-mode
	anything
	anything-match-plugin
	perl-completion
	magit
	markdown-mode
        rainbow-mode
	rainbow-delimiters
        smart-mode-line
        undo-tree
	diminish))

(el-get 'sync my-packages)

(provide 'init-el-get)
;;; init-el-get.el ends here
