;; (use-package jedi
;;   :hook (add-hook 'python-mode-hook 'jedi:setup)
;;   ;; :config (add-to-list 'ac-sources 'ac-source-jedi-direct')
;;   :init (setq jedi:complete-on-dot t)
;;   )

(add-hook 'python-mode-hook 'jedi:setup)

(use-package company-jedi
  :ensure t
  :config
  (add-to-list 'company-backends 'company-jedi))

(use-package pyvenv
  :ensure t
  :hook ((python-mode . pyvenv-mode)))
;; (use-package company-jedi
;;   :ensure t
;;   :config
;;   (defun my/python-mode-hoock()
;;     (add-to-list 'company-backends 'company-jedi))
;;   (add-hook 'python-mode-hook 'jedi:setup)
;;   (add-hook 'python-mode-hook 'my/python-mode-hook)
;;   (setq jedi:complete-on-dot t)
;;   )


;; (elpy-enable)
;; (setq elpy-rpc-backend "jedi")  

;; (use-package lsp-python-ms
;;   :ensure t
;;   :init (setq lsp-python-ms-auto-install-server t)
;;   :hook (python-mode . (lambda ()
;;                           (require 'lsp-python-ms)
;;                           (lsp))))  ; or lsp-deferred
;; (package-install elpy)
;; (package-install python-mode)
;; (elpy-enable)
;; (use-package python
;;   :mode ("\\.py" . python-mode)
;;   :ensure t
;;   :config
;;   (use-package elpy
;;     :ensure t
;;     :init
;;     (add-to-list 'auto-mode-alist '("\\.py$" . python-mode))
;;     :config
;;     (setq elpy-rpc-backend "jedi")
;;     ;; :bind (:map elpy-mode-map
;;     ;;           ("M-." . elpy-goto-definition)
;;     ;;           ("M-," . pop-tag-mark))
;;   )
;;   (elpy-enable)
;; )

;; (add-hook 'python-hook 'company-anaconda)
;; (use-package python-mode
;;   :ensure nil
;;   :custom
;;   (python-shell-interpreter "python")
;;   (setq python-shell-interpreter "python"
;; 		python-shell-interpreter-args "-i --simple-prompt")
;;   )

;; (when (load "flycheck" t t)
;;   (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
;;   (add-hook 'elpy-mode-hook 'flycheck-mode))
;; (setq elpy-remove-modeline-lighter t)

;; (advice-add 'elpy-modules-remove-modeline-lighter
;;             :around (lambda (fun &rest args)
;;                       (unless (eq (car args) 'flymake-mode)
;;                         (apply fun args))))

(add-hook 'python-mode-hook #'tree-sitter-mode)

(provide 'my-python)
