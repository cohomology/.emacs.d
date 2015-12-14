(defgroup my-init-rtags nil
  "Configuration options rtags."
  :group 'my-init
  :prefix 'my-init-rtags)

(use-package rtags)   ;; use rtags from git submodule, don't ensure here!

(defun my-init-rtags/complete ()
  (interactive)
  (rtags-find-symbol-at-point))

(defadvice my-init-rtags/complete (before evil-jumper--switch-to-buffer activate)  
  (evil-jumper--set-jump))  

(defun my-init-rtags/find-references ()
  (interactive)
  (rtags-find-references-at-point))

(defadvice my-init-rtags/find-references (before evil-jumper--switch-to-buffer activate)  
  (evil-jumper--set-jump))  

(defun my-init-rtags/keys ()
  (local-set-key (kbd "C-#") 'my-init-rtags/find-references)
  (local-set-key (kbd "C-ö") 'my-init-rtags/complete)
  (local-set-key (kbd "C-ä") (lambda () (interactive)
                               (let* ((cB (window-buffer))
                                      (cW (selected-window)))
                                 (if (one-window-p)
                                     (select-window (split-window-horizontally))
                                   (other-window 1)
                                   (switch-to-buffer cB))
                                 (rtags-find-symbol-at-point)
                                 (select-window cW)))))

(add-hook 'c-mode-common-hook 'my-init-rtags/keys)

(provide 'init-rtags)
