(defgroup my-init-gdb nil
  "All settings related to the debugger." 
  :group 'my-init
  :prefix 'my-init-gdb)

(use-package gud
  :init
  (setq gdb-many-windows t)
  :config
  (gud-tooltip-mode)
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

(defun my-gud ()
  (interactive)
  (gdb "gdb -i=mi"))

(global-set-key [f12] 'my-gud)

(defadvice gdb-setup-windows (after activate)
  (my-gdb-setup-windows))

(defun my-gdb-setup-windows ()
  "Layout the window pattern for option `gdb-many-windows'."
  (gdb-get-buffer-create 'gdb-locals-buffer)
  (gdb-get-buffer-create 'gdb-stack-buffer)
  (gdb-get-buffer-create 'gdb-breakpoints-buffer)
  (set-window-dedicated-p (selected-window) nil)
  (switch-to-buffer gud-comint-buffer)
  (delete-other-windows)
  (let ((win0 (selected-window))
        (win1 (split-window nil ( / ( * (window-height) 3) 4)))
        (win2 (split-window nil ( / (window-height) 3)))
        (win3 (split-window-right)))
    (gdb-set-window-buffer (gdb-locals-buffer-name) nil win3)
    (select-window win2)
    (set-window-buffer
     win2
     (if gud-last-last-frame
         (gud-find-file (car gud-last-last-frame))
       (if gdb-main-file
           (gud-find-file gdb-main-file)
         ;; Put buffer list in window if we
         ;; can't find a source file.
         (list-buffers-noselect))))
    (setq gdb-source-window (selected-window))
    (select-window win1)
    (gdb-set-window-buffer (gdb-stack-buffer-name))
    (let ((win5 (split-window-right)))
      (gdb-set-window-buffer (if gdb-show-threads-by-default
                                 (gdb-threads-buffer-name)
                               (gdb-breakpoints-buffer-name))
                             nil win5))
    (select-window win0)))

(provide 'init-gdb)
