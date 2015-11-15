(defgroup my-init-company nil
  "All settings related company mode (auto completion)."
  :group 'my-init
  :prefix 'my-init-company)

(use-package company
  :init
  (progn
    (setq company-auto-complete t)
    (setq company-async-timeout 10))
  :config
  (progn
    (add-hook 'after-init-hook 'global-company-mode))
  :ensure t)

(use-package company-irony
  :ensure t)

(setq company-backends (delete 'company-clang company-backends))
(eval-after-load 'company
  '(add-to-list 'company-backends 'company-irony))

(use-package company-quickhelp
  :config
  (if window-system
    (company-quickhelp-mode 1))
  :ensure t)

(global-set-key (kbd "C-M-i") 'company-complete)

(provide 'init-company)
