(use-package flymake
  :ensure t)

(use-package eglot
  :ensure t
  :config
  (add-to-list 'eglot-server-programs
               '(php-mode . ("intelephense.cmd" "--stdio")))
  )
(defun my-php-load ()
  (add-hook 'php-mode-hook 'php-enable-default-coding-style
            'php-mode-hook 'php-enable-psr2-coding-style)
  (company-mode t)
  (yas-global-mode 1)
  ;; (eglot-ensure)
  )

(use-package php-mode
  :ensure t
  :init
  (add-hook 'php-mode-hook 'my-php-load)
  )

;; (defvar my/loaded-phps-snippets nil)

;; (defun my/load-phps-snippets()
;;    (if (not my/loaded-php-snippets)
;;     (progn
;;       (yas-load-directory  (concat yas/root-directory) "/php-mode")
;;       (setq my/loaded-phps-snippets t))))

;; (use-package flycheck
;;   :ensure t)

;; (use-package phps-mode
;;   :ensure t
;;   :after flycheck
;;   :mode ("\\.php\\'" "\\.phtml\\'")
;;   :config
;;   (
;;    ;; (phps-mode-flycheck-setup)
;;   (setq phps-mode-async-process-using-async-el t)
;;   (setq phps-mode-cache--use-p nil))
;; :hook
;; (php-mode . my/loaded-phps-snippets)
;;   )
(provide 'my-php)
