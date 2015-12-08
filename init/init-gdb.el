(defgroup my-init-gdb nil
  "All settings related to the debugger." 
  :group 'my-init
  :prefix 'my-init-gdb)

(use-package realgud
  :config
  (setq realgud-populate-common-fn-keys-function nil))

(global-set-key [f5] 'realgud:cmd-step)
(global-set-key [f6] 'realgud:cmd-next)
(global-set-key [f7] (lambda() (interactive) (realgud:cmd-continue "")))
(global-set-key [f8] 'realgud:cmd-finish)

(defun my-start-debugging-pid (pid)
  "Start debugging process with pid PID."
  (interactive "nEnter the pid: ")
  (let ((cB (window-buffer))
        (cW (selected-window)))
    (if (one-window-p)
        (select-window (split-window))
      (other-window 1)
      (switch-to-buffer cB))
    (realgud:gdb-pid-associate pid)
    (select-window cW)))

(global-set-key [f12] 'my-start-debugging-pid)

(provide 'init-gdb)
