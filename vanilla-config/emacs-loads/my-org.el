;; Org mode
(org-babel-do-load-languages
 'org-babel-load-languages
 '(
   (powershell . t)
   ))
(org-indent-mode 1)
(org-set-startup-visibility)

;; (require 'org-bullets)
;; (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

(provide 'my-org)
