(defgroup my-init-gdb nil
  "All settings related to the debugger." 
  :group 'my-init
  :prefix 'my-init-gdb)

(use-package gud
  :ensure t)

(add-hook 'gdb-mode-hook 'gud-initialize)

(defun gud-initialize ()
    "The definition of the keys is similar to MSVC++."
    (local-set-key [S-f5]  'gud-run)   
    (local-set-key [S-f10] 'gud-cont)
    (local-set-key [f11]   'gud-step)
    (local-set-key [f10]   'gud-next)
    (local-set-key [S-f11] 'gud-finish)
)

(provide 'init-gdb)
