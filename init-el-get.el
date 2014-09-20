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

(require 'el-get-elpa)
(unless (file-directory-p el-get-recipe-path-elpa)
  (el-get-elpa-build-local-recipes))

(setq my-packages
      '(dash
        auto-complete
        ack-and-a-half
        ag
        ace-jump-mode
        anzu
        deft
        dired+
        expand-region
        git-gutter
        flycheck
        jedi
        virtualenvwrapper
        helm
        helm-git-grep
        projectile
        multiple-cursors
        moe-theme
        go-mode
        lua-mode
        puppet-mode
        js2-mode
        tern
        magit
        markdown-mode
        rainbow-delimiters
        smart-mode-line
        web-mode
        undo-tree
        yaml-mode))

(el-get 'sync my-packages)

(provide 'init-el-get)
;;; init-el-get.el ends here
