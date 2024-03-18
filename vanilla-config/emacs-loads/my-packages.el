(require 'package)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.org/packages/")
						 ;; ("melpa-stable" . "https://stable.melpa.org/packages/")
						 ;; ("milkbox" . "http://melpa.milkbox.net/packages/")
						 ))

(package-initialize)

;; (defvar my-packages '(better-defaults
;;                       projectile
;; 					  helm
;;                       helm-projectile
;; 					  rainbow-delimiters
;; 					  use-package
;;  					  emojify
;; 					  ;; flycheck
;; 					  projectile
;;                       yasnippet-classic-snippets
;;                       yasnippet-snippets
;; 					  company
;; 					  prescient  ;;prescient the last commands 
;; 					  company-prescient
;; 					  company-box ;; icons in company
;; 					  fic-mode ;;  add comments TODO BUG FIXME
;; 					  js2-mode
;; 					  tern  ;; JS ANalizer
;; 					  json-mode  
;; 					  js2-refactor
;; 					  prettier-js
;; 					  multi-web-mode
;; 					  yaml-mode
;; 					  dockerfile-mode
;; 					  dotenv-mode
;; 					  slime ;;lisp mode 
;; 					  web-mode
;; 					  ;; php-mode
;; 					  ;; company-php
;; 					  magit
;; 					  which-key
;; 					  powershell
;; 					  org-bullets
;;                       org-download
;;                       org-cliplink
;;                       deft
;; 					  ob-powershell
;; 					  ob-sql-mode
;; 					  ;; python-mode
;; 					  ;; elpy
;;                       jedi
;;                       company-jedi
;; 					  solidity-mode
;; 					  elixir-mode
;; 					  dart-mode
;; 					  go-mode
;; 					  go-snippets
;;                       eshell-git-prompt
;; 					  ))


;; (dolist (p my-packages)
;;   (unless (package-installed-p p)
;;     (package-install p)))

(provide 'my-packages)
