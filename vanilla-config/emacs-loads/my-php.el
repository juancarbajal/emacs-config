;; (require 'php-mode)
;; (require 'flymake-php)
(use-package php-mode
  :init
  ;; (add-hook 'php-mode-hook
  ;; 			'(lambda ()
  ;; 			   (require 'company-php)
  ;; 			   (company-mode t)
  ;; 			   (add-to-list 'company-backends 'company-ac-php-backend)
  ;; 			   (ac-php-core-eldoc-setup)
  ;; 			   (set (make-local-variable 'company-backends)
  ;; 					'((company-ac-php-backend company-dabbrev-code)
  ;; 					  company-capf company-files))
  ;; 			   ))
  :config
  (setq php-mode-coding-style 'psr2)
  (define-key php-mode-map (kbd "M-]") 'ac-php-find-symbol-at-point)
  (define-key php-mode-map (kbd "M-[") 'ac-php-location-stack-back)
  ;; (flymake-php-load)
  )

(provide 'my-php)
