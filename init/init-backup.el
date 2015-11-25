(defgroup my-init-backup nil
  "Backup related settings."
  :group 'my-init
  :prefix 'my-init-backup)

;; backup settings
(defvar my-backup-dir (expand-file-name "~/.emacs.d/backup/")
  "My backup diretory.")

(defvar my-autosave-dir (expand-file-name "~/.emacs.d/autosave/")
  "My auto save directory.")

(setq backup-by-copying t)    ; don't clobber symlinks
(setq delete-old-versions t)
(setq kept-new-versions 6)
(setq kept-old-versions 2)
(setq version-control t)      ; use versioned backups
(setq vc-make-backup-files t) ; Perforce is no real version control system
(setq backup-directory-alist (list (cons ".*" my-backup-dir)))
(setq auto-save-list-file-prefix my-autosave-dir)
(setq auto-save-file-name-transforms `((".*" ,my-autosave-dir t)))

(provide 'init-backup)
