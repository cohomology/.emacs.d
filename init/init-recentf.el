(defgroup my-init-recentf nil
  "Settings for recent files."
  :group 'my-init
  :prefix 'my-init-recentf)

(use-package recentf
  :init
  (setq recentf-max-menu-items 10)
  :config
  (recentf-mode 1)
  :ensure t)

(provide 'init-recentf)
