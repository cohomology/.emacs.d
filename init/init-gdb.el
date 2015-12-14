(defgroup my-init-gdb nil
  "All settings related to the debugger." 
  :group 'my-init
  :prefix 'my-init-gdb)

(use-package realgud
  :init
  (setq realgud-populate-common-fn-keys-function
        'realgud-populate-common-fn-keys-eclipse))

(defun my-init-gdb/start-debugging-pid (pid)
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

(global-set-key [f12] 'my-init-gdb/start-debugging-pid)

(provide 'init-gdb)
