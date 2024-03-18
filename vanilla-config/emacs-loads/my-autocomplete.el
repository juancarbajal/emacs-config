(use-package company
  :ensure t
  :defer 20
  :custom
  (global-company-mode t)
  (debug-on-error nil) ;; otherwise this throws lots of errors on compl
  :config
  (setq company-idle-delay 0
        company-minimum-prefix-length 3
        company-selection-wrap-around t))

;; (global-company-mode)

(define-key company-active-map (kbd "TAB") 'company-complete-selection)
(define-key company-active-map (kbd "<tab>") 'company-complete-selection)
(define-key company-active-map [return] 'company-complete-selection)
(define-key company-active-map (kbd "RET") 'company-complete-selection)

(defun my-company-visible-and-explicit-action-p ()
  (and (company-tooltip-visible-p)
       (company-explicit-action-p)))

(defun company-ac-setup ()
  "Sets up `company-mode' to behave similarly to `auto-complete-mode'."
  (setq company-require-match nil)
  (setq company-auto-complete #'my-company-visible-and-explicit-action-p)
  (setq company-frontends '(company-echo-metadata-frontend
                            company-pseudo-tooltip-unless-just-one-frontend-with-delay
                            company-preview-frontend))
  (define-key company-active-map [tab]
    'company-select-next-if-tooltip-visible-or-complete-selection)
  (define-key company-active-map (kbd "TAB")
    'company-select-next-if-tooltip-visible-or-complete-selection))
(company-ac-setup)

(add-hook 'after-init-hook 'global-company-mode)
(setq company-tooltip-align-annotations t)

;; Icons in company 
(use-package company-box
  :hook (company-mode . company-box-mode))

(use-package company-quickhelp :ensure t :defer 30
  :config
  (company-quickhelp-mode t))


;; (require 'prescient)
;; (require 'company-prescient)
;; (straight-use-package 'prescient)
;; (straight-use-package 'company-prescient)
(use-package prescient)
(use-package company-prescient)
;; (use-package company-lsp
;;   :ensure t
;;   :commands company-lsp)

(provide 'my-autocomplete)
