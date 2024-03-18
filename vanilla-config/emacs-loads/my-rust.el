(use-package rust-mode
  :ensure t)
(use-package rust-ts-mode
  :ensure t
  :mode ("\\.rs$"     . rust-ts-mode)
  :hook((rust-ts-mode . company-mode)
        ;; (rust-ts-mode . eglot-ensure)
        )
  :config
  (setq indent-tabs-mode nil
        rust-format-on-save t)
  (setq cargo-process--custom-path-to-bin (concat (getenv "HOME") "/.cargo/bin"))
  (setq cargo-process--rustc-cmd (concat (getenv "HOME") "/.cargo/bin"))
  (add-to-list 'eglot-server-programs '((rust-ts-mode rust-mode) . ("rustup" "run" "stable" "rust-analyzer"))))

(use-package company
  :ensure t)
;; (use-package rust-mode
;;   :ensure t
;;   :mode ("\\.rs$"     . rust-mode)
;;   :hook
;;   (rust-mode . (lambda () (prettify-symbols-mode)))
;;   ;; (rust-mode . eglot-ensure)
;;   :config
;;   (setq indent-tabs-mode nil
;;         rust-format-on-save t)
;;   (setq cargo-process--custom-path-to-bin (concat (getenv "HOME") "/.cargo/bin"))
;;   (setq cargo-process--rustc-cmd (concat (getenv "HOME") "/.cargo/bin"))
;;   (add-to-list 'eglot-server-programs '((rust-ts-mode rust-mode) . ("rustup" "run" "stable" "rust-analyzer")))
;;   )

;; (use-package rustic
;;   :ensure t
;;   :mode ("\\.rs$" . rustic-mode)
;;   :config
;;   (setq rustic-lsp-client 'eglot
;;         rustic-format-on-save t)
;;   (add-to-list 'eglot-server-programs '((rust-ts-mode rust-mode) . ("rustup" "run" "stable" "rust-analyzer")))
;;   :custom
;;   (rustic-analyzer-command '("rustup" "run" "stable" "rust-analyzer")))
(provide 'my-rust)
