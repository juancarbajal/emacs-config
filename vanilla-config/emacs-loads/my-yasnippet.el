;; (require 'yasnippet)

;; (use-package yasnippet
;;   :ensure t
;;   :hook (add-hook 'org-mode-hook #'yas-minor-mode)
  
;;   :init (yas-global-mode 1)
;;   (setq yas-snippet-dir "~/.emacs.d/snippets")
;;   (add-hook 'text-mode '#'yas-minor-mode
;;           prog-mode
;;           conf-mode
;;           org-mode
;;           snippet-mode org-mode-hook) #'yas-minor-mode)
;;   )
(use-package yasnippet-snippets
  :ensure t)
(use-package yasnippet-classic-snippets
  :ensure t)
;;c:/Users/juanc/.emacs.d/elpa/yasnippet-snippets-20230815.820/snippets
(use-package yasnippet
  :ensure t
  :config (yas-global-mode 1)
  :init(
        setq yas-snippet-dir "~/.emacs.d/elpa/yasnippet-snippets-20230815.820/snippets")
  )
(global-set-key (kbd "C-<return>") 'yas-expand)

(provide 'my-yasnippet)
