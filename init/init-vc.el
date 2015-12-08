(defgroup my-init-vc nil
  "Settings for version control."
  :group 'my-init
  :prefix 'my-init-vc)

(use-package p4
  :ensure t)

(use-package magit
  :config
  (global-magit-file-mode)
  :ensure t)

(with-eval-after-load 'evil
  (use-package evil-magit))

(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "C-x M-g") 'magit-dispatch-popup)

;; make C-w my normal window switching
(with-eval-after-load 'magit
  (dolist (map '(magit-mode-map))
    (define-key (eval map) "\C-w" nil)))

(provide 'init-vc)
