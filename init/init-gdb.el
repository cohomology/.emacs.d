(defgroup my-init-gdb nil
  "All settings related to the debugger." 
  :group 'my-init
  :prefix 'my-init-gdb)

(use-package realgud
  :ensure t)

(use-package dash ;; modern list library for elisp; used below
  :ensure t)

(global-set-key [f5] 'realgud:cmd-step)
(global-set-key [f6] 'realgud:cmd-next)
(global-set-key [f7] 'realgud:cmd-continue)
(global-set-key [f8] 'realgud:cmd-finish)
(global-set-key [f11] 'realgud:cmdbuf-associate)

(defun my-find-command-buffer (pid)  
  "Find the current command buffers for the given pid."
  (-filter (lambda (buf)
             (and
              (string-prefix-p (concat "*gdb " (number-to-string pid)) (buffer-name buf))
              (get-buffer-process buf))) (buffer-list)))

(defun my-start-debugging-pid (pid)
  "Start debugging process with pid PID."
  (interactive "nEnter the pid: ")
  (let* ((cW (selected-window)))
    (if (one-window-p)
        (select-window (split-window-horizontally))
      (other-window 1))
    (realgud:gdb (concat realgud:gdb-command-name " -p " (number-to-string pid)))
    (select-window cW)
    (mapc (lambda (buf)
            (realgud:cmdbuf-associate (buffer-name buf))) (my-find-command-buffer pid))))

(defun my-realgud:cmd-break()
  "Set a breakpoint at the current line"
  (interactive)
  (realgud-send-command (concat "break " (buffer-file-name) ":"
                                (number-to-string (line-number-at-pos)))))
  
(defun my-realgud:cmd-clear()
  "Delete breakpoint at the current line"
  (interactive)
  (realgud-send-command (concat "clear " (buffer-file-name) ":"
                                (number-to-string (line-number-at-pos)))))

(global-set-key [f12] 'my-start-debugging-pid)

(provide 'init-gdb)
