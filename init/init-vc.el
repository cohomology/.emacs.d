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

(use-package evil-magit
  :ensure t)

(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "C-x M-g") 'magit-dispatch-popup)

(provide 'init-vc)
