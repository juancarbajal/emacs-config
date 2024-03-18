;; (projectile-mode +1)
;; (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
;; (setq projectile-sort-order 'recently-active) ;; Recently active and opened recentf (openned)
;; (setq projectile-enable-caching t)

;; (setq projectile-project-search-path '("~/Projects/" ))
;; (setq projectile-require-project-root t)
;; (setq projectile-indexing-method 'native)
;; (use-package consult-projectile
;;   :ensure t)
(use-package ivy
  :ensure t)
(use-package projectile
  :ensure t
  :config
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
  (projectile-mode)
  (setq projectile-completion-system 'ivy)
  ;; (setq projectile-completion-system 'ivy
  (setq
   projectile-sort-order 'recently-active
   projectile-enable-caching t
   )
  (setq projectile-project-search-path '("~/Projects/" ))
  )
(provide 'my-projectile)
