(defgroup my-init-compile nil
  "Configuration options for compilation."
  :group 'my-init
  :prefix 'my-init-compile)

(defun my-init-compile/compile-common ()
  "Comple common projects."
  (interactive)
  (compile (concat compile-command " -p krn/dbi all -p krn/abap all -p krn/sapr3 all -p krn/local_instance all")))

(defun my-init-compile/compile-all ()
  "Compile whole kernel."
  (interactive)
  (compile (concat compile-command " krn/local_instance/all")))

(defun my-init-compile/compile-keys ()
  (local-set-key [f2] 'my-init-compile/compile-common)
  (local-set-key [f3] 'my-init-compile/compile-all))

(add-hook 'c-mode-common-hook 'my-init-compile/compile-keys)
(setq compilation-auto-jump-to-first-error t)
(setq compilation-skip-threshold 2)

(provide 'init-compile)
