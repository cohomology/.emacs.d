(defgroup my-init-gdb nil
  "All settings related to org mode." 
  :group 'my-init
  :prefix 'my-init-gdb)

(use-package org
  :ensure t)

(use-package evil-org
  :ensure t)

(setq-default major-mode 'org-mode) ;; set org mode as default major mode
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c a") 'org-agenda)

(provide 'init-org)
