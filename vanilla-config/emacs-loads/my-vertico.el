(package-install 'vertico)
(package-install 'orderless)
(package-install 'consult)

(setq read-file-name-completion-ignore-case t
      read-buffer-completion-ignore-case t
      completion-ignore-case t)

;; Enable vertico
(use-package vertico
  :init
  (vertico-mode)
  (setq vertico-scroll-margin 0)
  (setq vertico-count 20)
  (setq vertico-resize t)
  (setq vertico-cycle t)
  )

;; Persist history over Emacs restarts. Vertico sorts by history position.
(use-package savehist
  :init
  (savehist-mode))

(use-package emacs
  :init
  (defun crm-indicator (args)
    (cons (format "[CRM%s] %s"
                  (replace-regexp-in-string
                   "\\`\\[.*?]\\*\\|\\[.*?]\\*\\'" ""
                   crm-separator)
                  (car args))
          (cdr args)))
  (advice-add #'completing-read-multiple :filter-args #'crm-indicator)

  (setq minibuffer-prompt-properties
        '(read-only t cursor-intangible t face minibuffer-prompt))
  (add-hook 'minibuffer-setup-hook #'cursor-intangible-mode)

  (setq enable-recursive-minibuffers t))
(use-package orderless
  :init
  (setq completion-styles '(orderless basic)
        completion-category-defaults nil
        completion-category-overrides '((file (styles partial-completion)))))

(keymap-set vertico-map "?" #'minibuffer-completion-help)
(keymap-set vertico-map "M-RET" #'minibuffer-force-complete-and-exit)
(keymap-set vertico-map "M-TAB" #'minibuffer-complete)

(setq completion-styles '(substring orderless basic))

;; margin information en minibuffer 
(use-package marginalia
  :ensure t
  :config
  (marginalia-mode) )


(use-package consult
  :bind (
		 )                ;; orig. previous-matching-history-element

  :hook (completion-list-mode . consult-preview-at-point-mode)
  :init
  (setq register-preview-delay 0.5
		register-preview-function #'consult-register-format)
  (advice-add #'register-preview :override #'consult-register-window)
  (setq xref-show-xrefs-function #'consult-xref
		xref-show-definitions-function #'consult-xref)
  :config

  (consult-customize
   consult-theme :preview-key '(:debounce 0.2 any)
   consult-ripgrep consult-git-grep consult-grep
   consult-bookmark consult-recent-file consult-xref
   consult--source-bookmark consult--source-file-register
   consult--source-recent-file consult--source-project-recent-file
   ;; :preview-key "M-."
   :preview-key '(:debounce 0.4 any)))

(use-package consult-projectile
  :ensure t)

;; (defun set-buffer-local-project ()
;;   (interactive)
;;   (let ((consult-projectile-source-projectile-project-action (lambda (dir) (setq-local projectile-project-root dir))))
;;     (consult-projectile)))

(setq consult-narrow-key "<") ;; "C-+"


;; keys
(global-set-key (kbd "C-c M-x") 'consult-mode-command)
(global-set-key (kbd "C-c h") 'consult-history)
(global-set-key (kbd "C-c k") 'consult-kmacro)
(global-set-key (kbd "C-c m") 'consult-man)
(global-set-key (kbd "C-c i") 'consult-info)
;; (global-set-key (kbd [remap Info-search] 'consult-info)
(global-set-key (kbd "C-x M-:") 'consult-complex-command)     ;; orig'repeat-complex-command
(global-set-key (kbd "C-x b") 'consult-buffer)                ;; orig'switch-to-buffer
(global-set-key (kbd "C-x 4 b") 'consult-buffer-other-window) ;; orig'switch-to-buffer-other-window
(global-set-key (kbd "C-x 5 b") 'consult-buffer-other-frame)  ;; orig'switch-to-buffer-other-frame
(global-set-key (kbd "C-x r b") 'consult-bookmark)            ;; orig'bookmark-jump
(global-set-key (kbd "C-x p b") 'consult-project-buffer)      ;; orig'project-switch-to-buffer
(global-set-key (kbd "M-#") 'consult-register-load)
(global-set-key (kbd "M-'") 'consult-register-store)          ;; orig'abbrev-prefix-mark (global-set-key (kbd unrelated)
(global-set-key (kbd "C-M-#") 'consult-register)
(global-set-key (kbd "M-y") 'consult-yank-pop)                ;; orig'yank-pop
(global-set-key (kbd "M-g e") 'consult-compile-error)
(global-set-key (kbd "M-g f") 'consult-flymake)               ;; Alternative: consult-flycheck
(global-set-key (kbd "M-g g") 'consult-goto-line)             ;; orig'goto-line
(global-set-key (kbd "M-g M-g") 'consult-goto-line)           ;; orig'goto-line
(global-set-key (kbd "M-g o") 'consult-outline)               ;; Alternative: consult-org-heading
(global-set-key (kbd "M-g m") 'consult-mark)
(global-set-key (kbd "M-g k") 'consult-global-mark)
(global-set-key (kbd "M-g i") 'consult-imenu)
(global-set-key (kbd "M-g I") 'consult-imenu-multi)
(global-set-key (kbd "M-s d") 'consult-find)
(global-set-key (kbd "M-s D") 'consult-locate)
(global-set-key (kbd "M-s g") 'consult-grep)
(global-set-key (kbd "M-s G") 'consult-git-grep)
(global-set-key (kbd "M-s r") 'consult-ripgrep)
(global-set-key (kbd "C-s") 'consult-line)
(global-set-key (kbd "M-s L") 'consult-line-multi)
(global-set-key (kbd "M-s k") 'consult-keep-lines)
(global-set-key (kbd "M-s u") 'consult-focus-lines)
(global-set-key (kbd "M-s e") 'consult-isearch-history)
(define-key isearch-mode-map (kbd "M-e") 'consult-isearch-history)         ;; orig'isearch-edit-string
(define-key isearch-mode-map (kbd "M-s e") 'consult-isearch-history)       ;; orig'isearch-edit-string
(define-key isearch-mode-map (kbd "M-s l") 'consult-line)                  ;; needed by consult-line to detect isearch
(define-key isearch-mode-map (kbd "M-s L") 'consult-line-multi)            ;; needed by consult-line to detect isearch
(define-key minibuffer-local-map (kbd "M-s") 'consult-history)                 ;; orig'next-matching-history-element
(define-key minibuffer-local-map (kbd "M-r") 'consult-history)
(provide 'my-vertico)
