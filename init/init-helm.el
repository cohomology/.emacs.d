(defgroup my-init-helm nil
  "Initialize helm et al." 
  :group 'my-init
  :prefix 'my-init-helm)

(use-package helm
  :ensure t)

(use-package helm-cmd-t
  :ensure t)

(use-package helm-gtags
  :init 
  (progn
    (setq helm-gtags-fuzzy-match t)
    (setq helm-gtags-direct-helm-completing t))
  :ensure t)

(add-hook 'c-mode-hook 'helm-gtags-mode)
(add-hook 'c++-mode-hook 'helm-gtags-mode)
(add-hook 'asm-mode-hook 'helm-gtags-mode)

(custom-set-variables
 '(helm-gtags-path-style 'relative)
 '(helm-gtags-ignore-case t)
 '(helm-gtags-auto-update t))

(defun my-helm-gtags-keys ()
  (local-set-key (kbd "C-ö") 'helm-gtags-find-tag-from-here)
  (local-set-key (kbd "C-ä") '(lambda () (interactive) (helm-gtags-find-tag-other-window (thing-at-point 'symbol)))))

(add-hook 'c-mode-common-hook 'my-helm-gtags-keys)

(use-package projectile
  :init
  (progn
    (setq projectile-completion-system 'helm)
    (setq projectile-enable-caching t)
    (setq projectile-switch-project-action 'helm-projectile))
  :config
  (projectile-global-mode)
  :ensure t)

(use-package helm-projectile
  :config
  (helm-projectile-on)
  :ensure t)

;; settings for helm-M-x and helm find files 
(setq helm-M-x-fuzzy-match t) ;; enable fuzzy search for M-x
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "M-p") 'projectile-switch-project)

(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to do persistent action
(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB works in terminal
(define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z

(provide 'init-helm)
