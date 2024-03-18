(global-set-key (kbd "C-6") 'indent-region)
(global-set-key (kbd "C-7") 'indent-buffer)
(global-set-key (kbd "C-5") 'revert-buffer)
(global-set-key (kbd "C-8") 'deft)
(global-set-key (kbd "C-9") 'eval-region)
(global-set-key "\C-c\C-d" "\C-a\C- \C-n\M-w\C-y\C-p")
(global-set-key "\M-p" 'previous-buffer)
(global-set-key "\M-n" 'next-buffer)
(global-set-key "\C-x\C-c" 'compile)


;; (global-set-key (kbd "C-c k") 'helm-grep-do-git-grep)


  ;; :bind (("C-c n f" . org-roam-node-find)
  ;;        ("C-c n r" . org-roam-node-random)
  ;; (:map org-mode-map
  ;;              (("C-c n i" . org-roam-node-insert)
  ;;               ("C-c n o" . org-id-get-create)
  ;;               ("C-c n t" . org-roam-tag-add)
  ;;               ("C-c n a" . org-roam-alias-add)
  ;;               ("C-c n l" . org-roam-buffer-toggle))))

(provide 'my-keys)
