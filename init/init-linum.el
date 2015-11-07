(defgroup my-init-linum nil
  "Configuration options for line numbers."
  :group 'my-init
  :prefix 'my-init-linum)
(use-package linum
  :config
  (global-linum-mode))
(provide 'init-linum)
