;; add .emacs.d/lisp directory to the load path
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

;; set different custom file
(setq custom-file (expand-file-name "lisp/custom.el" user-emacs-directory))
(load custom-file)

;; set proxy settings
(setq url-proxy-services
  '(("no_proxy" . "^\\(localhost\\|10.*\\)")
    ("http" . "proxy:8080")
    ("https" . "proxy:8080")))

;; essential settings
(setq inhibit-splash-screen t
      inhibit-startup-message t
      inhibit-startup-echo-area-message t)
(menu-bar-mode -1)
(tool-bar-mode -1)
(when (boundp 'scroll-bar-mode)
  (scroll-bar-mode -1))
(show-paren-mode 1)
(setq visual-line-fringe-indicators '(left-curly-arrow right-curly-arrow))
(global-visual-line-mode nil)
(setq-default left-fringe-width nil)
(setq-default indent-tabs-mode nil)
(eval-after-load "vc" '(setq vc-handled-backends nil))
(setq vc-follow-symlinks t)
(setq large-file-warning-threshold nil)
(setq split-width-threshold nil)
(setq visible-bell t)
(setq compilation-scroll-output t)

;; backup settings
(setq
   backup-by-copying t      ; don't clobber symlinks
   backup-directory-alist
    '(("." . "~/.emacs.d/backup"))    ; don't litter my fs tree
   delete-old-versions t
   kept-new-versions 6
   kept-old-versions 2
   version-control t)       ; use versioned backups
(setq vc-make-backup-files t) ; Perforce is no real version control system

;; initialize some package repos
;; packages
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("org" . "http://orgmode.org/elpa/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")
                         ("melpa-stable" . "http://melpa-stable.milkbox.net/packages/")))
(package-initialize)

;; initialize packages
(require 'cl)
(require 'evil-leader)
(setq evil-leader/in-all-states 1)
(global-evil-leader-mode)
(evil-leader/set-leader ",")
(require 'evil)
(evil-mode 1)
(require 'evil-jumper)
(global-evil-jumper-mode t)
(require 'evil-tabs)
(global-evil-tabs-mode t)
(require 'powerline)
(require 'moe-theme)
(moe-dark)
(moe-theme-set-color 'blue)
(powerline-moe-theme)
(require 'linum)
(global-linum-mode)
(require 'evil-vimish-fold)
(require 'helm-config)
(require 'helm-cmd-t)
(require 'cc-mode)
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(require 'p4)
(require 'magit)

;; helm gtags
(require 'helm-gtags)
(add-hook 'c-mode-hook 'helm-gtags-mode)
(add-hook 'c++-mode-hook 'helm-gtags-mode)
(add-hook 'asm-mode-hook 'helm-gtags-mode)

(custom-set-variables
 '(helm-gtags-path-style 'relative)
 '(helm-gtags-ignore-case t)
 '(helm-gtags-auto-update t))

(defun my-c-helm-gtags-mode ()
  (local-set-key (kbd "C-]") 'helm-gtags-find-tag-from-here)
  (local-set-key (kbd "C-ö") (lambda () (interactive) (helm-gtags-find-tag-other-window (thing-at-point 'symbol)))))

(add-hook 'c++-mode-hook 'my-c-helm-gtags-mode)
(add-hook 'c-mode-hook 'my-c-helm-gtags-mode)

;; helm projectile
(require 'projectile)
(require 'helm-projectile)
(projectile-global-mode)
(setq projectile-completion-system 'helm)
(setq projectile-enable-caching t)
(setq projectile-switch-project-action 'helm-projectile)
(helm-projectile-on)

;; key mappings 
(setq helm-M-x-fuzzy-match t) ;; enable fuzzy search for M-x
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(evil-leader/set-key "r" 'helm-recentf
                     "o" 'delete-other-windows
                     "b" 'helm-mini
                     "g" 'projectile-grep
                     "t" 'helm-gtags-select
                     "h" 'helm-projectile-find-file-dwim
                     "f" 'projectile-find-file) ;; recently opened files

;; change cursor according to vim mode
(setq evil-emacs-state-cursor '("red" box))
(setq evil-normal-state-cursor '("green" box))
(setq evil-visual-state-cursor '("orange" box))
(setq evil-insert-state-cursor '("red" bar))
(setq evil-replace-state-cursor '("red" bar))
(setq evil-operator-state-cursor '("red" hollow))

;; save bookmarks
(setq bookmark-default-file "~/.emacs.d/bookmarks"
      bookmark-save-flag 1) ;; save after every change

;; escape should quit anything
(defun minibuffer-keyboard-quit ()
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
(define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)
(global-set-key [escape] 'evil-exit-emacs-state)

;; map ctrl-k + ctrl-j
(define-key evil-normal-state-map (kbd "C-k") (lambda ()
						(interactive)
						(evil-scroll-up nil)))
(define-key evil-normal-state-map (kbd "C-j") (lambda ()
						(interactive)
						(evil-scroll-down nil)))

;; code layout settings
(setq-default tab-width 2 indent-tabs-mode nil)
(setq c-basic-offset 2)
(setq c-default-style '((java-mode . "java")
                        (awk-mode . "awk")
                        (other . "bsd")))

;; debugger settings
(require 'gud)
(add-hook 'gdb-mode-hook 'gud-initialize)

(defun gud-initialize ()
    "The definition of the keys is similar to MSVC++"
    (local-set-key [S-f5]  'gud-run)   
    (local-set-key [S-f10] 'gud-cont)
    (local-set-key [f11]   'gud-step)
    (local-set-key [f10]   'gud-next)
    (local-set-key [S-f11] 'gud-finish)
)

;; semantics
(require 'semantic)
(require 'semantic/bovine/gcc)
(semantic-mode 1)
(add-to-list 'semantic-default-submodes 'global-semanticdb-minor-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-idle-local-symbol-highlight-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-idle-scheduler-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-idle-summary-mode)
(semanticdb-enable-gnu-global-databases 'c++-mode)
(setq semanticdb-project-roots
      (list "/local/git/CGK"
            "/local/depot/CGK"))
(global-ede-mode 1)
(setq cedet-global-command "global")
(setq ede-locate-setup-options
      '(ede-locate-global
        ede-locate-base))

