(use-package lsp-mode
  :ensure t
  :init
  (setq lsp-keymap-prefix "C-c l")
  (setq lsp-enable-symbol-highlighting t)
  :hook (
		 (lsp-mode . lsp-enable-which-key-integration)
		 (typescript-mode . lsp)
		 (js2-mode . lsp-deferred)
		 (go-mode . lsp-deferred)
		 ;; (dart-mode . lsp)
		 (python-mode . lsp)
		 (php-mode . lsp-deferred)
		 )
  :commands (lsp lsp-deferred))

;; (define-key lsp-mode-map (kbd "C-c l") lsp-command-map)

;; (use-package company-lsp
;;   :ensure t
;;   :commands company-lsp)

(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode)
;; (use-package lsp-ivy :commands lsp-ivy-workspace-symbol)


(provide 'my-lsp)
