(defgroup my-init-gdb nil
  "All settings related to the debugger." 
  :group 'my-init
  :prefix 'my-init-gdb)

(use-package realgud
  :ensure t)

(global-set-key [f5] 'realgud:cmd-step)
(global-set-key [f6] 'realgud:cmd-next)
(global-set-key [f7] 'realgud:cmd-continue)
(global-set-key [f8] 'realgud:cmd-finish)
(global-set-key [f11] 'realgud:cmdbuf-associate)

(provide 'init-gdb)
