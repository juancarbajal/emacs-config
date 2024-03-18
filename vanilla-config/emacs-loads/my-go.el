;; (add-hook 'go-mode-hook #'lsp-deferred)
;; (defun lsp-go-install-save-hooks ()
;;   (add-hook 'before-save-hook #'lsp-format-buffer t t)
;;   (add-hook 'before-save-hook #'lsp-organize-imports t t))
;; (add-hook 'go-mode-hook #'lsp-go-install-save-hooks)
;; (add-hook 'go-mode-hook #'lsp-deferred)
;; (add-hook 'go-mode-hook #'yas-minor-mode)
;; (add-hook 'go-mode-hook #'tree-sitter-mode)

;; (lsp-register-custom-settings
;;  '(("gopls.completeUnimported" t t)
;;    ("gopls.staticcheck" t t)))

;; (setq lsp-go-analyses '((shadow . t)
;;                         (simplifycompositelit . :json-false)))

;; (add-hook 'go-mode-hook 'eglot-ensure)

;; (use-package tree-sitter-langs
;;   :ensure t
;;   :after tree-sitter
;;   )

(use-package go-ts-mode
  :ensure t
  :mode ("\\.go$" . go-ts-mode)
  :hook
  ((go-ts-mode .  (lambda() (prettify-symbols-mode)))
   ;; (go-ts-mode . eglot-ensure)
   )
  :config
  (setq indent-tabs-mode nil
        ;; c-basic-offset 4
        ;; c-ts-common-indent-offset 4
        go-ts-mode-indent-offset 4)
  )
(provide 'my-go)
