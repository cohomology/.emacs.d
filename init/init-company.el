(defgroup my-init-company nil
  "All settings related company mode (auto completion)."
  :group 'my-init
  :prefix 'my-init-company)

(use-package company
  :config
  (progn
    (add-hook 'after-init-hook 'global-company-mode))
  :ensure t)

(require 'company-gtags)
(require 'company-rtags)

(use-package company-irony
  :config
  (progn
    (setq company-backends (delete 'company-clang company-backends))
    (eval-after-load 'company
    '(add-to-list 'company-backends 'company-rtags)))
  :ensure t)

(use-package company-quickhelp
  :config
  (company-quickhelp-mode 1)
  :ensure t)

(provide 'init-company)
