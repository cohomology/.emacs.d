(add-to-list 'load-path (expand-file-name "init" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "third-party/use-package" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "third-party/realgud" user-emacs-directory)) 

;;  load custom file
(setq custom-file (expand-file-name "init/init-custom.el" user-emacs-directory))
(load custom-file)

(require 'init-essential) ;; essential settings, not connected to a specific package
(require 'init-elpa)      ;; init emacs package repository; provides use-package.el
(require 'init-w3m)       ;; initialize web browsing
(require 'init-vc)        ;; version control: git + perforce
(require 'init-backup)    ;; init backup settings
(require 'init-linum)     ;; everything connected to line numbers
(require 'init-visual)    ;; initialize themes and colors
(require 'init-recentf)   ;; recent file settings
(require 'init-helm)      ;; initialize helm
(require 'init-evil)      ;; init evil mode
(require 'init-cpp)       ;; c++ coding style
(require 'init-gdb)       ;; debugger settings
(require 'init-rtags)     ;; rtags
(require 'init-company)   ;; company mode 
(require 'init-compile)   ;; compile settings
(require 'init-antlr)     ;; antlr-mode
(require 'init-org)       ;; org mode
