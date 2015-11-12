(defgroup my-init-irony nil
  "Configuration options for irony mode." 
  :group 'my-init
  :prefix 'my-init-irony)

(use-package irony
  :ensure t)

(add-hook 'c-mode-common-hook 'irony-mode)
(defun my-irony-mode-hook ()
  (define-key irony-mode-map [remap completion-at-point]
    'irony-completion-at-point-async)
  (define-key irony-mode-map [remap complete-symbol]
    'irony-completion-at-point-async))
(add-hook 'irony-mode-hook 'my-irony-mode-hook)
(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)

(provide 'init-irony)
