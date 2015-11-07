(defgroup my-init-semantic nil
  "All settings related to the semantics engine." 
  :group 'my-init
  :prefix 'my-init-semantic)

(use-package semantic
  :init
  (setq semanticdb-project-roots
        (list "/local/git/CGK"
              "/local/depot/CGK"
              "~/.emacs.d/"))
  (setq cedet-global-command "global")
  (setq ede-locate-setup-options
        '(ede-locate-global
          ede-locate-base))
  :config
  (semantic-mode 1)
  (global-ede-mode 1)
  (semanticdb-enable-gnu-global-databases 'c++-mode)
  :ensure t)

(add-to-list 'semantic-default-submodes 'global-semanticdb-minor-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-idle-local-symbol-highlight-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-idle-scheduler-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-idle-summary-mode)

(defun my-semantic-hook ()
  (semantic-add-system-include
     "/sapmnt/depot/tools/src/OpenSource/ANTLRv3/3.5/Cpp/include" 'c++-mode)
  (semantic-add-system-include
     "/sapmnt/depot/tools/src/OpenSource/STLport/4.5.0/stlport" 'c++-mode))

(add-hook 'semantic-init-hooks 'my-semantic-hook)j

(use-package semantic/bovine/gcc
  :ensure t)

(provide 'init-semantic)
