;; Org mode
(org-babel-do-load-languages
 'org-babel-load-languages
 '(
   (powershell . t)
   (python . t)
   (sql . t)
   (plantuml . t)
   (restclient . t)
   ))
(org-indent-mode 1)
(org-set-startup-visibility)
(global-set-key (kbd "C-x p i") 'org-cliplink)

(setq org-edit-src-content-indentation 0
      org-src-tab-acts-natively t
      org-src-preserve-indentation t)

(setq org-plantuml-jar-path (concat (getenv "HOME") "/apps/plantuml.jar"))
(setq org-capture-templates
      '(("K" "Cliplink capture task" entry (file "")
         "* TODO %(org-cliplink-capture) \n  SCHEDULED: %t\n" :empty-lines 1)))
(setq-default org-download-image-dir (concat (getenv "HOME") "/OneDrive/notes/imgs"))

;; (require 'org-bullets)
(use-package org-bullets
  :after org
  :config (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
  )
;; (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
(defvar my-org-agendafile (concat (getenv "HOME") "/OneDrive/agenda.org"))
(setq org-directory (concat (getenv "HOME") "/OneDrive/notes/"))
(setq org-agenda-files (list my-org-agendafile))

(defun gtd ()
  (interactive)
  (find-file my-org-agendafile)
  )

(use-package deft
  :commands (deft)
  :init ( setq def-extensions '("txt", "tex", "org")
          deft-directory (concat (getenv "HOME") "/OneDrive/notes/")
          deft-recursive t)      
  :config(add-to-list 'load-path (concat (getenv "HOME") "/OneDrive/notes/"))
  )
(use-package org-roam
  :after org
  :init (setq org-roam-v2-ack t) ;; Acknowledge V2 upgrade
  :custom
  (org-roam-directory (file-truename org-directory))
  :config
  (org-roam-setup))
(global-set-key (kbd "C-c n f") 'org-roam-node-find)
(global-set-key (kbd "C-c n r") 'org-roam-node-random)
(define-key org-mode-map (kbd "C-c n i") 'org-roam-node-insert)
(define-key org-mode-map (kbd "C-c n o") 'org-id-get-create)
(define-key org-mode-map (kbd "C-c n t") 'org-roam-tag-add)
(define-key org-mode-map (kbd "C-c n a") 'org-roam-alias-add)
(define-key org-mode-map (kbd "C-c n l") 'org-roam-buffer-toggle)
(provide 'my-org)
