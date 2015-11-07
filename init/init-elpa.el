(defgroup my-init-elpa nil
  "Elpa related settings, loads also use-package macro."
  :group 'my-init
  :prefix 'my-init-elpa)
;; set proxy settings
(setq url-proxy-services
  '(("no_proxy" . "^\\(localhost\\|10.*\\)")
    ("http" . "proxy:8080")
    ("https" . "proxy:8080")))
;; initialize use-package for use-package macro
(require 'use-package)
(require 'package)
(mapc (lambda(p) (push p package-archives))
      '(("gnu" . "http://elpa.gnu.org/packages/")
        ("org" . "http://orgmode.org/elpa/")
        ("melpa" . "http://melpa.milkbox.net/packages/")
        ("melpa-stable" . "http://melpa-stable.milkbox.net/packages/")))
;; get new contents
(package-refresh-contents)
(package-initialize)
(provide 'init-elpa)
