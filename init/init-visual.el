(defgroup my-init-visual nil
  "Initialize themes and color."
  :group 'my-init
  :prefix 'my-init-visual)

(set-default-font "dejavu sans mono:pixelsize=17")

(use-package moe-theme
  :config  
  (progn
    (moe-dark)
    (moe-theme-set-color 'blue))
  :ensure t)

(use-package powerline
  :config
  (powerline-moe-theme)
  :ensure t)

(provide 'init-visual)
