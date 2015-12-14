(defgroup my-init-w3m nil
  "Configuration options for w3m." 
  :group 'my-init
  :prefix 'my-init-w3m)

(use-package wanderlust
  :ensure t) ;; w3m's dependencies are wrong

(use-package w3m
  :ensure t)

(use-package helm-w3m
  :ensure t)

(use-package htmlfontify
  :ensure t)

(setq browse-url-browser-function 'w3m-browse-url)
(autoload 'w3m-browse-url "w3m" "Ask a WWW browser to show a URL." t)
(setq w3m-use-cookies t)
(setq w3m-coding-system 'utf-8
      w3m-file-coding-system 'utf-8
      w3m-file-name-coding-system 'utf-8
      w3m-input-coding-system 'utf-8
      w3m-output-coding-system 'utf-8
      w3m-terminal-coding-system 'utf-8)

(defun my-init-w3m/wikipedia-search (search-term)
  "Search for SEARCH-TERM on wikipedia"
  (interactive
   (let ((term (if mark-active
                   (buffer-substring (region-beginning) (region-end))
                 (word-at-point))))
     (list (read-string (format "Wikipedia (%s): " term) nil nil term))))
  (w3m-browse-url (concat
                   "http://en.m.wikipedia.org/w/index.php?search="
                   search-term)))

(provide 'init-w3m)
