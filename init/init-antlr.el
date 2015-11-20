(defgroup my-init-antlr nil
  "Configuration options for antlr mode."
  :group 'my-init
  :prefix 'my-init-antlr)

(use-package antlr-mode
  :ensure t)

(setq auto-mode-alist (cons '("\\.g\\'" . antlr-mode) auto-mode-alist))

(provide 'init-antlr)
