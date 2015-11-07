;; add .emacs.d/lisp directory to the load path
(add-to-list 'load-path (expand-file-name "init" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "third-party" user-emacs-directory))

;;  load custom file
(setq custom-file (expand-file-name "init/init-custom.el" user-emacs-directory))
(load custom-file)

(require 'init-essential) ;; essential settings, not connected to a specific package
(require 'init-elpa)      ;; init emacs package repository; provides use-package.el
(require 'init-vc)        ;; version control: git + perforce
(require 'init-backup)    ;; init backup settings
(require 'init-linum)     ;; everything connected to line numbers
(require 'init-visual)    ;; initialize themes and colors
(require 'init-recentf)   ;; recent file settings
(require 'init-helm)      ;; initialize helm
(require 'init-evil)      ;; init evil mode
(require 'init-cpp)       ;; c++ coding style
(require 'init-gdb)       ;; debugger settings


