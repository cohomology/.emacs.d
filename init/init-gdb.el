(defgroup my-init-gdb nil
  "All settings related to the debugger." 
  :group 'my-init
  :prefix 'my-init-gdb)

(use-package realgud
  :init
  (setq realgud:gdb-command-name "/usr/local/bin/gdb")
  :ensure t)

(provide 'init-gdb)
