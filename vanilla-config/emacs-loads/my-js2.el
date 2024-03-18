(advice-add #'js2-identifier-start-p
	        :after-until
	        (lambda (c) (eq c ?#)))
;; (js2-global-externs '("customElements"))
(use-package js2-mode :ensure t :defer 20
  :mode
  (("\\.js\\'" . js2-mode)
   ("\\.ts\\'" . js2-mode))
  :custom
  (js2-include-node-externs t)
  (js2-global-externs '("customElements"))
  (js2-highlight-level 3)
  (js2r-prefer-let-over-var t)
  (js2r-prefered-quote-type 2)
  (js-indent-align-list-continuation t)
  (global-auto-highlight-symbol-mode t)
  :config
  (setq js-indent-level 2)
  ;; patch in basic private field support
  (advice-add #'js2-identifier-start-p
              :after-until
              (lambda (c) (eq c ?#))))


(use-package tern :ensure t :defer 30
  :if (locate-file "tern" exec-path)
  :hook (js2-mode . tern-mode))

(use-package json-ts-mode
  :custom
  (json-reformat:indent-with 2)
  :mode (("\\.bowerrc$"     . json-mode)
         ("\\.jshintrc$"    . json-mode)
         ("\\.json_schema$" . json-mode)
         ("\\.json\\'" . json-mode))
  :bind (:package json-mode-map
         :map json-mode-map
         ("C-c <tab>" . json-mode-beauty))
)
;; (use-package json-mode :ensure t :defer 20
;;   :custom
;;   (json-reformat:indent-width 2)
;;   :mode (("\\.bowerrc$"     . json-mode)
;;          ("\\.jshintrc$"    . json-mode)
;;          ("\\.json_schema$" . json-mode)
;;          ("\\.json\\'" . json-mode))
;;   :bind (:package json-mode-map
;; 		  :map json-mode-map
;; 		  ("C-c <tab>" . json-mode-beautify)))

(use-package js2-refactor :ensure t :defer 30
  :config
  (add-hook 'js2-mode-hook #'js2-refactor-mode)
  (js2r-add-keybindings-with-prefix "C-c C-m"))

;; (add-hook 'js2-mode-hook (lambda () (company-mode)))
(add-hook 'js2-mode-hook #'tree-sitter-mode)
;; (add-hook 'js2-mode-hook 'eglot-ensure)


(cl-defmethod project-root ((project (head eglot-project)))
  (cdr project))
(defun my-project-try-tsconfig-json (dir)
  (when-let* ((found (locate-dominating-file dir "tsconfig.json")))
    (cons 'eglot-project found)))
(add-hook 'project-find-functions 'my-project-try-tsconfig-json nil t)

;; (add-to-list 'eglot-server-programs
;;              '((typescript-mode) "typescript-language-server" "--stdio"))

(provide 'my-js2)
