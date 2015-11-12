(defgroup my-init-rtags nil
  "Configuration options rtags."
  :group 'my-init
  :prefix 'my-init-rtags)

(use-package rtags
  :ensure t)

(defun my-rtags-complete ()
  (interactive)
  (rtags-find-symbol-at-point))

(defadvice my-rtags-complete (before evil-jumper--switch-to-buffer activate)  
  (evil-jumper--set-jump))  

(defun my-rtags-keys ()
  (local-set-key (kbd "M-ö") 'my-rtags-complete)
  (local-set-key (kbd "M-ä") (lambda () (interactive)
                               (let* ((cB (window-buffer))
                                      (cW (selected-window)))
                                 (if (one-window-p)
                                     (select-window (split-window-horizontally))
                                   (other-window 1)
                                   (switch-to-buffer cB))
                                 (rtags-find-symbol-at-point)
                                 (select-window cW)))))

(add-hook 'c-mode-common-hook 'my-rtags-keys)

(provide 'init-rtags)
