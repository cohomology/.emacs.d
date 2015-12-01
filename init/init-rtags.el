(defgroup my-init-rtags nil
  "Configuration options rtags."
  :group 'my-init
  :prefix 'my-init-rtags)

(require 'rtags) ;; take rtags from git repository; note that you should compile it first!

(defun my-rtags-complete ()
  (interactive)
  (rtags-find-symbol-at-point))

(defadvice my-rtags-complete (before evil-jumper--switch-to-buffer activate)  
  (evil-jumper--set-jump))  

(defun my-rtags-find-references ()
  (interactive)
  (rtags-find-references-at-point))

(defadvice my-rtags-find-references (before evil-jumper--switch-to-buffer activate)  
  (evil-jumper--set-jump))  


(defun my-rtags-keys ()
  (local-set-key (kbd "C-#") 'my-rtags-find-references)
  (local-set-key (kbd "C-ö") 'my-rtags-complete)
  (local-set-key (kbd "C-ä") (lambda () (interactive)
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
