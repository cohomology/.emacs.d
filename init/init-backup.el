(defgroup my-init-backup nil
  "Backup related settings."
  :group 'my-init
  :prefix 'my-init-backup)
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
(provide 'init-backup)
