(defgroup my-init-visual nil
  "Initialize themes and color."
  :group 'my-init
  :prefix 'my-init-visual)

(setq default-frame-alist '((font . "dejavu sans mono:pixelsize=17")))

(use-package powerline
  :ensure t)

(use-package moe-theme
  :config  
  (progn
    (moe-dark)
    (moe-theme-set-color 'blue)
    (powerline-moe-theme))
  :ensure t)


(provide 'init-visual)
