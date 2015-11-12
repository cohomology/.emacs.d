(defgroup my-init-semantic nil
  "All settings related to the semantics engine." 
  :group 'my-init
  :prefix 'my-init-semantic)

(use-package semantic
  :init
  (progn
    (add-to-list 'semantic-default-submodes '(global-semanticdb-minor-mode
                                              global-semantic-idle-local-symbol-highlight-mode
                                              global-semantic-idle-scheduler-mode
                                              global-semantic-idle-summary-mode
                                              global-semantic-mru-bookmark-mode))

    (setq semanticdb-project-roots
          (list "/local/git/CGK"
                "/local/depot/CGK"
                "~/.emacs.d/")))
  :config
  (progn
    (semantic-mode 1)
    (semanticdb-enable-gnu-global-databases 'c-mode)
    (semanticdb-enable-gnu-global-databases 'c++-mode))
  :ensure t)

(use-package ede
  :init
  (progn
    (setq cedet-global-command "global")
    (setq ede-locate-setup-options
          '(ede-locate-global
            ede-locate-base)))
  :config
  (global-ede-mode t)
  :ensure t)

(defun my-fast-jump ()
  (interactive)
  (semantic-ia-fast-jump (point)))

(defadvice my-fast-jump (before evil-jumper--switch-to-buffer activate)
  (evil-jumper--set-jump))

(defun my-semantic-hook ()
  (semantic-add-system-include
     "/sapmnt/depot/tools/src/OpenSource/ANTLRv3/3.5/Cpp/include" 'c++-mode)
  (semantic-add-system-include
     "/sapmnt/depot/tools/src/OpenSource/STLport/4.5.0/stlport" 'c++-mode))

(add-hook 'semantic-init-hooks 'my-semantic-hook)

(require 'semantic/bovine/gcc)
(require 'semantic/ia)

;; activate gtags imenu building
(setq-local imenu-create-index-function #'ggtags-build-imenu-index)

(defun my-semantic-mode ()
  (local-set-key (kbd "M-ü") 'semantic-ia-complete-symbol)
  (local-set-key (kbd "M-ö") 'my-fast-jump)
  (local-set-key (kbd "M-ä") (lambda () (interactive)
                               (let* ((cB (window-buffer))
                                      (cW (selected-window)))
                                      (if (one-window-p)
                                          (select-window (split-window-horizontally))
                                            (other-window 1)
                                            (switch-to-buffer cB))
                                 (semantic-ia-fast-jump (point))
                                 (select-window cW)))))

(add-hook 'c-mode-common-hook 'my-semantic-mode)

(provide 'init-semantic)
