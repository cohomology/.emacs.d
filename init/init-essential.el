(defgroup my-init-essential nil
  "Essential emacs options."
  :group 'my-init
  :prefix 'my-init-essential)
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
(setq compilation-scroll-output t)   ;; scroll during compilation
(setq x-select-enable-clipboard nil) ;; disable clipboard => doesn't work with evil; still works with + register
(setq bookmark-default-file "~/.emacs.d/bookmarks"
      bookmark-save-flag 1) ;; save after every change
(setq-default tab-width 2 indent-tabs-mode nil) ;; no tabs, indent = 2
(add-to-list 'safe-local-variable-values
             '(compile-command . "make_cgk"))
(put 'narrow-to-region 'disabled nil)
(fset 'yes-or-no-p 'y-or-n-p) ;; "y" or "n" instead of "yes" or "no"
(setq sentence-end-double-space nil) ;; sentences end in single space after point
(prefer-coding-system 'utf-8)
(when (display-graphic-p)
  (setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING)))
(add-to-list 'auto-mode-alist '("\\.gmk\\'" . makefile-gmake-mode)) ;; open gmk as gnu make 
(provide 'init-essential)
