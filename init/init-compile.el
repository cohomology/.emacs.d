(defgroup my-init-compile nil
  "Configuration options for compilation."
  :group 'my-init
  :prefix 'my-init-compile)

(defun my-compile-common ()
  "Comple common projects."
  (interactive)
  (compile (concat compile-command " -p krn/dbi all -p krn/abap all -p krn/sapr3 all -p krn/local_instance all")))

(defun my-compile-all ()
  "Compile whole kernel."
  (interactive)
  (compile (concat compile-command " krn/local_instance/all")))

(defun my-compile-keys ()
  (local-set-key [f4] 'my-compile-common)
  (local-set-key [f5] 'my-compile-all))

(add-hook 'c-mode-common-hook 'my-compile-keys)
(setq compilation-auto-jump-to-first-error t)
(setq compilation-skip-threshold 2)

(provide 'init-compile)
