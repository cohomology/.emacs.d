(defgroup my-init-evil nil
  "Configuration options for evil-mode."
  :group 'my-init
  :prefix 'my-init-evil)

(defcustom my-init-evil/evil-state-modes
  '(fundamental-mode
    conf-mode
    text-mode
    prog-mode
    sws-mode
    yaml-mode
    vimrc-mode
    help-mode
    dired-mode
    web-mode
    magit-log-mode
    magit-revision-mode
    magit-mode
    log-edit-mode)
  "List of modes that should start up in Evil state."
  :type '(repeat (symbol))
  :group 'my-init-eval)

(defcustom my-init-evil/emacs-state-hooks
  '(org-log-buffer-setup-hook org-capture-mode-hook)
  "List of hooks to automatically start up in Evil Emacs state."
  :type '(repeat (symbol))
  :group 'my-init-evil)

(defcustom my-init-evil/emacs-cursor
  "red"
  "The colorof the cursor in Emacs state."
  :type 'color
  :group 'my-init-evil)

(defcustom my-init-evil/emacs-state-minor-modes
  '(git-commit-mode magit-blame-mode)
  "List of minor modes that when active should switch to Emacs state."
  :type '(repeat (symbol))
  :group 'my-init-evil)

(setq evil-search-module 'evil-search)
(setq evil-magic 'very-magic)

(setq evil-emacs-state-cursor '("red" box))
(setq evil-normal-state-cursor '("green" box))
(setq evil-visual-state-cursor '("orange" box))
(setq evil-insert-state-cursor '("red" bar))
(setq evil-replace-state-cursor '("red" bar))
(setq evil-operator-state-cursor '("red" hollow))

(use-package evil
  :ensure t)

(unless (display-graphic-p)
  (evil-esc-mode))

(use-package evil-leader
  :init
  (setq evil-leader/in-all-states 1)
  :config
  (progn
    (global-evil-leader-mode t)
    (evil-leader/set-leader ","))
  :ensure t)

(use-package evil-commentary
  :config
  (evil-commentary-mode t)
  :ensure t)

(use-package evil-surround
  :config
  (global-evil-surround-mode t)
  :ensure t) 

(use-package evil-exchange
  :config
  (evil-exchange-install)
  :ensure t)

(use-package evil-anzu
  :ensure t)

 (use-package evil-jumper
  :init
  (setq evil-jumper-auto-center t)
  :config
  (global-evil-jumper-mode)
  :ensure t)

(use-package evil-matchit
  :init
  (defun evilmi-customize-keybinding ()
    (evil-define-key 'normal evil-matchit-mode-map
      "%" 'evilmi-jump-items))
  :config
  (global-evil-matchit-mode t)
  :ensure t)

(use-package evil-indent-textobject
  :ensure t)

(use-package evil-visualstar
  :config
  (global-evil-visualstar-mode t)
  :ensure t)

(use-package evil-numbers
  :ensure t)

(use-package evil-vimish-fold
  :ensure t)

(use-package evil-tabs
  :config
  (global-evil-tabs-mode t)
  :ensure t)

(defun my-major-mode-evil-state-adjust ()
  (if (apply 'derived-mode-p my-init-evil/evil-state-modes)
      (turn-on-evil-mode)
    (set-cursor-color my-init-evil/emacs-cursor)
    (turn-off-evil-mode)))
(add-hook 'after-change-major-mode-hook #'my-major-mode-evil-state-adjust)

(cl-loop for mode in my-init-evil/emacs-state-minor-modes
         do (let ((hook (concat (symbol-name mode) "-hook")))
              (add-hook (intern hook) `(lambda ()
                                         (if ,mode
                                             (evil-emacs-state)
                                           (evil-normal-state))))))

(cl-loop for hook in my-init-evil/emacs-state-hooks
         do (add-hook hook #'evil-emacs-state))

;; map ctrl-k + ctrl-j for page up and page down
(define-key evil-normal-state-map (kbd "C-k") (lambda ()
						(interactive)
						(evil-scroll-up nil)))
(define-key evil-normal-state-map (kbd "C-j") (lambda ()
						(interactive)
						(evil-scroll-down nil)))

;; define evil leader keymapping
(evil-leader/set-key "r" 'helm-recentf
                     "o" 'delete-other-windows
                     "b" 'helm-mini
                     "g" 'projectile-grep
                     "h" 'helm-projectile-find-file-dwim
                     "f" 'projectile-find-file) ;; recently opened files

;; increase and decrease width
(global-set-key (kbd "C-+") 'evil-window-increase-width)
(global-set-key (kbd "C--") 'evil-window-decrease-width)
(global-set-key (kbd "C-M-+") 'evil-window-increase-height)
(global-set-key (kbd "C-M--") 'evil-window-decrease-height)

;; escape everything
(defun my-minibuffer-keyboard-quit ()
  "Abort recursive edit.
In Delete Selection mode, if the mark is active, just deactivate it;
then it takes a second \\[keyboard-quit] to abort the minibuffer."
  (interactive)
  (if (and delete-selection-mode transient-mark-mode mark-active)
      (setq deactivate-mark  t)
    (when (get-buffer "*Completions*") (delete-windows-on "*Completions*"))
    (abort-recursive-edit)))
(define-key evil-normal-state-map [escape] 'keyboard-quit)
(define-key evil-visual-state-map [escape] 'keyboard-quit)
(define-key minibuffer-local-map [escape] 'my-minibuffer-keyboard-quit)
(define-key minibuffer-local-ns-map [escape] 'my-minibuffer-keyboard-quit)
(define-key minibuffer-local-completion-map [escape] 'my-minibuffer-keyboard-quit)
(define-key minibuffer-local-must-match-map [escape] 'my-minibuffer-keyboard-quit)
(define-key minibuffer-local-isearch-map [escape] 'my-minibuffer-keyboard-quit)

;; global C-w configuration; not just in evil buffers
(defun my-set-control-w-shortcuts ()
  (define-prefix-command 'my-window-map)
  (global-set-key (kbd "C-w") 'my-window-map)
  (define-key my-window-map (kbd "h") 'windmove-left)
  (define-key my-window-map (kbd "j") 'windmove-down)
  (define-key my-window-map (kbd "k") 'windmove-up)
  (define-key my-window-map (kbd "l") 'windmove-right)
  (define-key my-window-map (kbd "v") 'split-window-right)
  (define-key my-window-map (kbd "b") 'split-window-below)
  (define-key my-window-map (kbd "x") 'delete-window)
  (define-key my-window-map (kbd "o") 'delete-other-windows)
  (define-key my-window-map (kbd "X") 'elscreen-kill)
  (define-key my-window-map (kbd "p") 'elscreen-previous)
  (define-key my-window-map (kbd "n") 'elscreen-next)
  (define-key my-window-map (kbd "t") 'evil-tabs-current-buffer-to-tab))

(my-set-control-w-shortcuts)

(eval-after-load "evil-maps"
  (dolist (map '(evil-motion-state-map
                 evil-insert-state-map
                 evil-emacs-state-map))
    (define-key (eval map) "\C-w" nil)))

(provide 'init-evil)
