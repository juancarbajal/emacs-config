(setq shell-file-name "C:/cygwin64/bin/bash.exe")
(setq coding-system-for-read 'utf-8)
(setq coding-system-for-write 'utf-8)
(set-buffer-file-coding-system 'unix 't)
(setq-default buffer-file-coding-system 'utf-8-unix)
(setq-default default-buffer-file-coding-system 'utf-8-unix)
(set-default-coding-systems 'utf-8-unix)
(prefer-coding-system 'utf-8-unix)
(setq-default tab-width 4)
(setq c-basic-offset 4)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq indent-line-function 'insert-tab)
(setq inferior-lisp-program "clisp")
;; (require 'paren)
(use-package paren
  :init
  (show-paren-mode 1)
  :config
  ;; (setq show-paren-style 'expression)
  ;; (setq show-paren-style 'mixed)
  (setq show-paren-style 'parenthesis)
  (set-face-background 'show-paren-match (face-background 'default))
  (set-face-foreground 'show-paren-match "#def")
  (set-face-attribute 'show-paren-match nil :weight 'extra-bold)
  )
(use-package markdown-mode
  :ensure t
  :mode ("\\.md$" . markdown-mode))

(use-package elec-pair
  :hook ((prog-mode org-mode) . electric-pair-mode)
  :config
  (setq electric-pair-pairs '(
			      (?\{ . ?\})
			      (?\[ . ?\])
			      (?\< . ?\>)
			      (?\' . ?\')
			      (?\` . ?\`)
			      ))
  )

;; (require 'rainbow-delimiters)
(use-package rainbow-delimiters
  :hook ((prog-mode org-mode) . rainbow-delimiters-mode)
  :config
  (setq global-rainbow-delimiters-mode t)
  )

(use-package which-key
  :config
  (which-key-mode)
  (setq which-key-idle-delay 0.5
        which-key-idle-secondary-delay 0.5)
  (which-key-setup-side-window-bottom))


;; (use-package flycheck
;;   :ensure t
;;   :init (global-flycheck-mode))

(use-package dumb-jump :ensure t :defer 10
  :custom
  (dumb-jump-rg-search-args '())
  :config
  (defun jump-to-mouse-position (event &optional promote-to-region)
    (interactive "e\np")
    (mouse-set-point event promote-to-region)
    (dumb-jump-go))
  (global-unset-key [C-down-mouse-1])
  (define-key global-map [C-mouse-1] 'jump-to-mouse-position))

;; (require 'fic-mode)
(use-package fic-mode
  :init (add-hook 'prog-mode-hook 'fic-mode)
  )

;; (use-package yasnippet
;;   :ensure t
;;   :commands yas-minor-mode
;;   :hook (go-mode . yas-minor-mode))

;; (eshell-git-prompt-use-theme 'powerline)
(use-package git-grep
  :commands (git-grep git-grep-repo)
  ;; :bind (("C-c g g" . git-grep)
  ;;        ("C-c g r" . git-grep-repo))
  )

(use-package restclient
  :ensure t)

(use-package ob-restclient
  :ensure t)

(use-package ini-mode
  :ensure t)

;; (use-package mini-frame
;;   :ensure t)

(provide 'my-programming)

