(defgroup my-init-company nil
  "All settings related company mode (auto completion)."
  :group 'my-init
  :prefix 'my-init-company)

(use-package company
  :init
  (progn
    (setq company-idle-delay 0)
    (setq company-auto-complete nil)
    (setq company-async-timeout 10))
  :config
  (progn
    (add-hook 'after-init-hook 'global-company-mode))
  :ensure t)

(require 'company-gtags)

(setq company-backends (delete 'company-clang company-backends))
(eval-after-load 'company
  '(add-to-list 'company-backends 'company-gtags))

(use-package company-quickhelp
  :config
  (if window-system
    (company-quickhelp-mode 1))
  :ensure t)

(global-set-key (kbd "C-M-i") 'company-complete)

(provide 'init-company)
