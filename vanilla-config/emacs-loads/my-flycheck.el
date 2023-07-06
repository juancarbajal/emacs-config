(with-eval-after-load 'flycheck
  (setq-default flycheck-disabled-checkers '(emacs-lisp-checkdoc)))

(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))
;; (flymake)
(provide 'my-flycheck)
