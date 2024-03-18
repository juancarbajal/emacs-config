;; (add-hook 'python-mode-hook 'eglot-ensure)
;; (add-hook 'go-mode-hook 'eglot-ensure)
(add-to-list 'eglot-server-programs
             '((typescript-mode) "typescript-language-server" "--stdio"))
(provide 'my-eglot)
