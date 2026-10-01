;; -*- lexical-binding: t; -*-

(with-eval-after-load 'eglot
  ;; In a repo this large, basedpyright registers didChangeWatchedFiles watches
  ;; across the whole tree. macOS kqueue burns one file descriptor per watched
  ;; directory, so Emacs exhausts its fd limit ("no file descriptor left") long
  ;; before eglot's own eglot-max-file-watches cap, and the server exits with
  ;; status 1. Advertise that we do not support dynamic registration of file
  ;; watching, so basedpyright watches internally in its own node process.
  (advice-add 'eglot-client-capabilities :filter-return
              (lambda (caps)
                (plist-put (plist-get caps :workspace)
                           :didChangeWatchedFiles
                           '(:dynamicRegistration :json-false))
                caps)))
