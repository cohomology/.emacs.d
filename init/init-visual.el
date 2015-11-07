(defgroup my-init-visual nil
  "Initialize themes and color."
  :group 'my-init
  :prefix 'my-init-visual)

(use-package moe-theme
  :config
  (moe-dark)
  (moe-theme-set-color 'blue)
  :ensure t)

(use-package powerline
  :config
  (powerline-moe-theme)
  :ensure t)

(provide 'init-visual)
