(projectile-mode +1)

(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
(setq projectile-sort-order 'recently-active) ;; Recently active and opened recentf (openned)
(setq projectile-enable-caching t)

;;Ivy

(provide 'my-projectile)
