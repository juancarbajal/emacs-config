(require 'package)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.org/packages/")
						 ;; ("melpa-stable" . "https://stable.melpa.org/packages/")
						 ;; ("milkbox" . "http://melpa.milkbox.net/packages/")
						 ))

(package-initialize)

;; (package-refresh-contents)
(defvar my-packages '(better-defaults
                      projectile
					  helm
					  rainbow-delimiters
					  use-package
					  lsp-mode
					  lsp-ui
					  helm-lsp
					  dap-mode
					  emojify
					  ;; flycheck
					  projectile
					  company
					  prescient
					  company-prescient
					  company-box
					  fic-mode
					  js2-mode
					  tern
					  json-mode
					  js2-refactor
					  multi-web-mode
					  yaml-mode
					  yasnippet-snippets
					  yasnippet-classic-snippets
					  dockerfile-mode
					  dotenv-mode
					  slime
					  web-mode
					  php-mode
					  company-php
					  magit
					  which-key
					  powershell
					  org-bullets
					  ob-powershell
					  ob-sql-mode
					  treemacs
					  lsp-treemacs
					  python-mode
					  elpy
					  solidity-mode
					  dart-mode
					  lsp-dart
					  dracula-theme
					  go-mode
					  go-snippets
					  prettier-js
					  elixir-mode
					  ))


(dolist (p my-packages)
  (unless (package-installed-p p)
    (package-install p)))

(provide 'my-packages)
