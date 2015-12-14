(defgroup my-init-compile nil
  "Configuration options for compilation."
  :group 'my-init
  :prefix 'my-init-compile)

(add-to-list 'safe-local-variable-values
             '(compile-command . "make_cgk"))

;; accept any command starting with "make" as valid compile-command
(put 'compile-command 'safe-local-variable (lambda (x)
                                             (and (stringp x) (string-prefix-p "make" x))))

(defvar-local my-init-compile/compile-common ""
  "Compile common projects. Should be overwritten by .dir-locals.el")

;; make variable safe to specify in .dir-locals.el
(put 'my-init-compile/compile-common 'safe-local-variable #'stringp)

(defvar-local my-init-compile/compile-all ""
  "Compile all project. Should be overwritten by .dir-locals.el")

;; make variable safe to specify in .dir-locals.el
(put 'my-init-compile/compile-all 'safe-local-variable #'stringp)

(defun my-init-compile/do-compile-common ()
  "Compile common projects."
  (interactive)
  (compile (concat compile-command my-init-compile/compile-common))) 

(defun my-init-compile/do-compile-all ()
  "Compile all projects."
  (interactive)
  (compile (concat compile-command my-init-compile/compile-all)))

(defun my-init-compile/compile-keys ()
  "Set compile keys."
  (local-set-key [f2] 'my-init-compile/do-compile-common)
  (local-set-key [f3] 'my-init-compile/do-compile-all))

(add-hook 'c-mode-common-hook 'my-init-compile/compile-keys)
(setq compilation-auto-jump-to-first-error t)
(setq compilation-skip-threshold 2)

(provide 'init-compile)
