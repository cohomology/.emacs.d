(defgroup my-init-compile nil
  "Configuration options for compilation."
  :group 'my-init
  :prefix 'my-init-compile)

(defvar-local my-init-compile/compile-common ""
  "Compile common projects. Should be overwritten by .dir-locals.el")

(defvar-local my-init-compile/compile-all ""
  "Compile all project. Should be overwritten by .dir-locals.el")

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
