(defconst dot-emacs (concat (getenv "HOME") "/" ".emacs.juan.el")
    "My dot emacs file")
 
(require 'bytecomp)
(setq compiled-dot-emacs (byte-compile-dest-file dot-emacs))
 
(if (or (not (file-exists-p compiled-dot-emacs))
	(file-newer-than-file-p dot-emacs compiled-dot-emacs)
        (equal (nth 4 (file-attributes dot-emacs)) (list 0 0)))
    (load dot-emacs)
  (load compiled-dot-emacs))
 
(add-hook 'kill-emacs-hook
          '(lambda () (and (file-newer-than-file-p dot-emacs compiled-dot-emacs)
                           (byte-compile-file dot-emacs))))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(lsp-tailwindcss eglot tide typescript-mode git-timemachine ob-restclient haskell-mode restclient company-terraform true terraform-mode phps-mode consult-projectile helm-projectile helm counsel-projectile php-ts-mode company-mode rust-mode yasnippet-classic-snippets yasnippet-snippets ini-mode company-phpactor ac-php company-php consult yaml-mode which-key web-mode vertico treemacs-projectile tree-sitter-langs tern solidity-mode smex slime shrink-path rainbow-delimiters pyvenv prettier-js powershell php-mode org-roam-bibtex org-download org-cliplink org-bullets orderless ob-sql-mode ob-powershell nerd-icons multi-web-mode marginalia magit julia-mode json-mode jsdoc js2-refactor jedi highlight-indentation go-mode git-grep flymake-php flycheck fic-mode eshell-git-prompt emojify elixir-mode dumb-jump dotenv-mode dockerfile-mode deft dart-mode company-quickhelp company-prescient company-jedi company-box command-log-mode better-defaults all-the-icons))
 '(tree-sitter-langs-grammar-dir
   "c:/Users/juanc/.emacs.d/elpa/tree-sitter-langs-20230822.544/bin"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
