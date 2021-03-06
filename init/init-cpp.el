(defgroup my-init-cpp nil
  "All c++ related settings."
  :group 'my-init
  :prefix 'my-init-cpp)

(use-package cc-mode
  :init
  (progn
    (setq c-basic-offset 2)
    (setq c-default-style '((java-mode . "java")
                            (awk-mode . "awk")
                            (other . "bsd"))))
  :ensure t)

;; indent case labels, too
(defun my-init-cpp/c-mode-hooks ()
  (c-set-offset 'case-label '+))

(add-hook 'c-mode-common-hook 'my-init-cpp/c-mode-hooks)

;; treat .h and .c files as c++
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.c\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.inl\\'" . c++-mode)) ;; antlr c++ backend

(provide 'init-cpp)
