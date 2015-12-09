(defgroup my-init-elpa nil
  "Elpa related settings, loads also use-package macro."
  :group 'my-init
  :prefix 'my-init-elpa)
;; set proxy settings
(when (string-prefix-p "WDF" (upcase system-name))
  (setq url-proxy-services
        '(("no_proxy" . "^\\(localhost\\|10.*\\)")
          ("http" . "proxy:8080")
          ("https" . "proxy:8080"))))
;; initialize use-package for use-package macro
(require 'url-handlers)
(require 'use-package)
(require 'package)
(mapc (lambda(p) (push p package-archives))
      '(("org" . "http://orgmode.org/elpa/")
        ("melpa" . "http://melpa.milkbox.net/packages/")))
;; get new contents
(package-refresh-contents)
(package-initialize)

(provide 'init-elpa)
