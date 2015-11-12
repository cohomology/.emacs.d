(defgroup my-init-company nil
  "All settings related company mode (auto completion)."
  :group 'my-init
  :prefix 'my-init-company)

(use-package company
  :config
  (progn
    (add-hook 'after-init-hook 'global-company-mode)
    (setq company-async-timeout 10))
  :ensure t)

(require 'company-gtags)

(use-package company-irony
  :config
  (progn
    (setq company-backends (delete 'company-clang company-backends))
    (eval-after-load 'company
    '(add-to-list 'company-backends 'company-irony)))
  :ensure t)

(use-package company-quickhelp
  :config
  (company-quickhelp-mode 1)
  :ensure t)

(defun my-company-keys ()
  (local-set-key (kbd "M-ö") 'company-complete))
  
(add-hook 'c-mode-common-hook 'my-company-keys)

(provide 'init-company)
