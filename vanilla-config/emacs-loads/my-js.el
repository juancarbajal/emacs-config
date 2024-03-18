(use-package tern :ensure t :defer 30
  :if (locate-file "tern" exec-path)
  :hook (js-mode . tern-mode))

(use-package json-mode :ensure t :defer 20
  :custom
  (json-reformat:indent-width 2)
  :mode (("\\.bowerrc$"     . json-mode)
         ("\\.jshintrc$"    . json-mode)
         ("\\.json_schema$" . json-mode)
         ("\\.json\\'" . json-mode))
  :bind (:package json-mode-map
		  :map json-mode-map
		  ("C-c <tab>" . json-mode-beautify)))

;; (add-hook 'js2-mode-hook #'tree-sitter-mode)

(provide 'my-js)
