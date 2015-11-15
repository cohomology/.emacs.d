(defgroup my-init-vc nil
  "Settings for version control."
  :group 'my-init
  :prefix 'my-init-vc)

(use-package p4
  :ensure t)

(use-package magit
  :ensure t)

(use-package evil-magit
  :ensure t)

(global-set-key [f2] 'magit-status)

(provide 'init-vc)
