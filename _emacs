(prefer-coding-system 'utf-8)
(setq default-file-name-coding-system 'UTF-8)
(setenv "CVS_RSH" "ssh")
(setenv "WikiDataDir" "test-data")
(setq visible-bell t)
(setq mouse-drag-copy-region t)
(setq history-length 1000)
(setq tramp-auto-save-directory (getenv "TEMP"))
(setq shell-file-name "C:/cygwin64/bin/bash.exe")
(show-paren-mode 1)
;;(scroll-bar-mode -1)
(blink-cursor-mode 1)
(winner-mode 1)
(windmove-default-keybindings)
(savehist-mode 1)


(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Fira Code" :foundry "outline" :slant normal :weight normal :height 98 :width normal)))))

(prefer-coding-system 'utf-8)
(setq coding-system-for-read 'utf-8)
(setq coding-system-for-write 'utf-8)
;;(invert-face 'default)
;;(global-font-lock-mode t)
(menu-bar-mode 1)
(tool-bar-mode -1)
(setq make-backup-files nil)
(when (version<= "26.0.50" emacs-version )
  (global-display-line-numbers-mode))

(setq bookmark-default-file "~/.saves/bookmarks.bmk" bookmark-save-flag 1)
(setq x-select-enable-clipboard t)
(if (eq system-type 'gnu-linux) (setq interprogram-paste-function 'x-cut-buffer-or-selection-value))
(if (eq system-type 'windows-nt) (setq interprogram-paste-function 'x-selection-value))
(global-visual-line-mode t)
(fset `yes-or-no-p `y-or-n-p)

(set-buffer-file-coding-system 'unix 't)

(defun dos2unix (buffer)
  "Automate M-% C-q C-m RET C-q C-j RET"
  (interactive "*b")
  (save-excursion
	(goto-char (point-min))
	(while (search-forward (string ?\C-m) nil t)
	  (replace-match (string ?\C-j) nil t))))

(defun convert-utf8 ()
  (interactive)
  (let ((coding-system-for-read 'utf8-unix)
		(coding-system-for-write 'utf8-unix)
		(coding-system-require-warning t)
		(current-prefix-arg nil))
	(message "has: Reopened file with coding set to windows-1252")
	(find-alternate-file buffer-file-name)
	)
  )


(setq find-file-visit-truename t)
;;(setq interprogram-paste-function 'x-cut-buffer-or-selection-value)
(setq visible-bell t)
(setq inhibit-startup-message   t)
(setq column-number-mode t)

(defun indent-buffer ()
  (interactive)
  (save-excursion
	(indent-region (point-min) (point-max) nil)))

(require 'package)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.org/packages/")
			 ("milkbox" . "http://melpa.milkbox.net/packages/")))
(package-initialize)
;;M-x package-refresh-contents
(package-install 'color-theme-modern)
(package-install 'csv-mode)
(package-install 'magit)
(package-install 'git-timemachine)
(package-install 'lsp-mode)
(package-install 'lsp-ui)
(package-install 'lsp-treemacs)
(package-install 'lsp-pascal)
(package-install 'dap-mode)
(package-install 'flycheck)
(package-install 'treemacs-magit)
(package-install 'projectile)
(package-install 'treemacs-projectile)
(package-install 'company)
;;Javascript
(package-install 'js2-mode)
;;(require 'js2-mode)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
;; (add-hook 'js2-mode-hook
;;           (lambda () (flycheck-select-checker "javascript-eslint")))
;; ;; (package-install 'rjsx-mode)
(package-install 'typescript-mode)
(package-install 'js2-refactor)
(package-install 'react-snippets)

;; Install in node:
;; npm i -g typescript
;; npm i -g typescript-language-server
;; lsp-install-server

;;Python
(package-install 'jedi)
(package-install 'lsp-jedi)
(package-install 'company-jedi)
(package-install 'yasnippet-classic-snippets)
(package-install 'flymake-php)
(package-install 'flymake-json)
(package-install 'flymake-jslint)
(package-install 'flymake-python-pyflakes)
(package-install 'ac-js2)
(package-install 'php-mode)
(package-install 'company-php)
(package-install 'company-anaconda)
(package-install 'company-irony) ;;c++

(package-install 'smartparens)
(require 'smartparens-config)
(add-hook 'js-mode-hook #'smartparens-mode)
(add-hook 'php-mode-hook #'smartparens-mode)
(add-hook 'c++-mode-hook #'smartparens-mode)
(add-hook 'python-mode-hook #'smartparens-mode)
(add-hook 'lisp-interaction-mode-hook #'smartparens-mode)

;; Projectile
(projectile-mode 1)
(counsel-projectile-mode 1)
;;(counsel-projectile-key-bindings)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
(setq projectile-sort-order 'recently-active) ;; Recently active and opened recentf (openned)
(setq projectile-sort-order 'recently-active) ;; Cache for big projects


;;Ivy
;; (package-install 'ivy)
;; (package-install 'swiper)
;; (package-install 'counsel)
;; (package-install 'counsel-projectile)
;; (setq projectile-completion-system 'ivy)
;; (setq ivy-use-virtual-buffers t)
;; (setq ivy-count-format "(%d/%d) ")
;; (setq projectile-completion-system 'ivy)
;; (ivy-mode 1)
;; (global-set-key (kbd "C-s") 'swiper-isearch)
;; (global-set-key (kbd "M-x") 'counsel-M-x)
;; (global-set-key (kbd "C-x C-f") 'counsel-find-file)
;; (global-set-key (kbd "M-y") 'counsel-yank-pop)
;; (global-set-key (kbd "<f1> f") 'counsel-describe-function)
;; (global-set-key (kbd "<f1> v") 'counsel-describe-variable)
;; (global-set-key (kbd "<f1> l") 'counsel-find-library)
;; (global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
;; (global-set-key (kbd "<f2> u") 'counsel-unicode-char)
;; (global-set-key (kbd "<f2> j") 'counsel-set-variable)
;; (global-set-key (kbd "C-x b") 'ivy-switch-buffer)
;; (global-set-key (kbd "C-c v") 'ivy-push-view)
;; (global-set-key (kbd "C-c V") 'ivy-pop-view)
;; (global-set-key (kbd "C-c c") 'counsel-compile)
;; (global-set-key (kbd "C-c g") 'counsel-git)
;; (global-set-key (kbd "C-c j") 'counsel-git-grep)
;; (global-set-key (kbd "C-c L") 'counsel-git-log)
;; (global-set-key (kbd "C-c k") 'counsel-rg)
;; (global-set-key (kbd "C-c m") 'counsel-linux-app)
;; (global-set-key (kbd "C-c n") 'counsel-fzf)
;; (global-set-key (kbd "C-x l") 'counsel-locate)
;; (global-set-key (kbd "C-c J") 'counsel-file-jump)
;; (global-set-key (kbd "C-S-o") 'counsel-rhythmbox)
;; (global-set-key (kbd "C-c w") 'counsel-wmctrl)
;; (global-set-key (kbd "C-c C-r") 'ivy-resume)
;; (global-set-key (kbd "C-c b") 'counsel-bookmark)
;; (global-set-key (kbd "C-c d") 'counsel-descbinds)
;; (global-set-key (kbd "C-c g") 'counsel-git)
;; (global-set-key (kbd "C-c o") 'counsel-outline)
;; (global-set-key (kbd "C-c t") 'counsel-load-theme)
;; (global-set-key (kbd "C-c F") 'counsel-org-file)

;;helm
(package-install 'helm)
(package-install 'helm-projectile)
(package-install 'helm-company)
(package-install 'helm-lsp)
(package-install 'swiper)
(package-install 'swiper-helm)
(require 'helm)
(require 'helm-config)
(require 'helm-projectile)
(helm-projectile-on)
(global-set-key (kbd "C-x b") #'helm-buffers-list)
(global-set-key (kbd "C-x C-f") #'helm-find-files)
(global-set-key (kbd "M-y") #'helm-show-kill-ring)
(global-set-key (kbd "M-x") #'helm-M-x)
(global-set-key (kbd "C-x r b") #'helm-filtered-bookmarks)
(global-set-key (kbd "C-x C-f") #'helm-find-files)
(global-set-key (kbd "C-s") #'swiper-isearch)

;;(global-set-key (kbd "C-c p") #'helm-projectile)
(helm-mode 1)




;; Direx
;; (package-install 'direx)
;; (require 'direx)
;; (global-set-key (kbd "C-x C-j") 'direx:jump-to-directory)

(require 'yasnippet)
(yas-global-mode 1)
(add-hook 'after-init-hook 'global-company-mode)
(add-hook 'python-hook 'company-anaconda)
(add-hook 'php-mode-hook 'company-php)
(add-hook 'c++-mode 'irony-mode) 
;; (add-to-list 'company-backends 'ac-js2-company)


;; (eval-after-load 'company
;;   '(push 'company-anaconda ac-js2-company))
;; (eval-after-load 'company
;;   '(push 'company-anaconda company-backends))
;; (add-hook 'python-mode-hook 'anaconda-mode)
;; (eval-after-load 'company
;;   '(push 'company-anaconda company-irony))


;;php mode
(require 'php-mode)

(add-hook 'php-mode-hook
          '(lambda ()
             ;; Enable company-mode
             (company-mode t)
             (require 'company-php)

             ;; Enable ElDoc support (optional)
             (ac-php-core-eldoc-setup)

             (set (make-local-variable 'company-backends)
                  '((company-ac-php-backend company-dabbrev-code)
                    company-capf company-files))

             ;; Jump to definition (optional)
             (define-key php-mode-map (kbd "M-]")
               'ac-php-find-symbol-at-point)

             ;; Return back (optional)
             (define-key php-mode-map (kbd "M-[")
               'ac-php-location-stack-back)))

;; LSP
;;npm install -g @angular/language-service@next typescript @angular/language-server
(setq lsp-keymap-prefix "s-l")
(require 'lsp-mode)
(add-hook 'js2-mode-hook #'lsp)
(add-hook 'c++-mode-hook #'lsp)
(add-hook 'sh-mode-hook #'lsp)
(add-hook 'html-mode-hook #'lsp)
;; (add-hook 'pascal-mode-hook #'lsp)


;;Programing
;;(package-install 'rainbow-delimiters)
;;(package-install 'rainbow-identifiers)


;;Keys
(global-set-key [f5] 'revert-buffer)
(global-set-key [f12] 'indent-buffer)
(global-set-key [f3] 'projectile-find-file)

;;Typescript compilation Mode
(require 'ansi-color)
(defun colorize-compilation-buffer ()
  (ansi-color-apply-on-region compilation-filter-start (point-max)))
(add-hook 'compilation-filter-hook 'colorize-compilation-buffer)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(custom-safe-themes
   '("e3a1b1fb50e3908e80514de38acbac74be2eb2777fc896e44b54ce44308e5330" "b02eae4d22362a941751f690032ea30c7c78d8ca8a1212fdae9eecad28a3587f" "24168c7e083ca0bbc87c68d3139ef39f072488703dcdd82343b8cab71c0f62a7" "d9646b131c4aa37f01f909fbdd5a9099389518eb68f25277ed19ba99adeb7279" "3b8284e207ff93dfc5e5ada8b7b00a3305351a3fb222782d8033a400a48eca48" "fc1137ae841a32f8be689e0cfa07c872df252d48426a47f70dba65f5b0f88ac4" "8530b2f7b281ea6f263be265dd8c75b502ecd7a30b9a0f28fa9398739e833a35" "b5cff93c3c6ed12d09ce827231b0f5d4925cfda018c9dcf93a2517ce3739e7f1" "3ed2e1653742e5059e3d77af013ee90c1c1b776d83ec33e1a9ead556c19c694b" "72c530c9c8f3561b5ab3bf5cda948cd917de23f48d9825b7a781fe1c0d737f2f" "780c67d3b58b524aa485a146ad9e837051918b722fd32fd1b7e50ec36d413e70" "1a094b79734450a146b0c43afb6c669045d7a8a5c28bc0210aba28d36f85d86f" "9dc64d345811d74b5cd0dac92e5717e1016573417b23811b2c37bb985da41da2" "39a854967792547c704cbff8ad4f97429f77dfcf7b3b4d2a62679ecd34b608da" "be5b03913a1aaa3709d731e1fcfd4f162db6ca512df9196c8d4693538fa50b86" "3fe4861111710e42230627f38ebb8f966391eadefb8b809f4bfb8340a4e85529" "67b11ee5d10f1b5f7638035d1a38f77bca5797b5f5b21d16a20b5f0452cbeb46" "11e5e95bd3964c7eda94d141e85ad08776fbdac15c99094f14a0531f31a156da" "595099e6f4a036d71de7e1512656e9375dd72cf60ff69a5f6d14f0171f1de9c1" "9bd5ee2b24759fbc97f86c2783d1bf8f883eb1c0dd2cf7bda2b539cd28abf6a9" "b4fd44f653c69fb95d3f34f071b223ae705bb691fb9abaf2ffca3351e92aa374" "6c0d748fb584ec4c8a0a1c05ce1ae8cde46faff5587e6de1cc59d3fc6618e164" "d9e811d5a12dec79289c5bacaecd8ae393d168e9a92a659542c2a9bab6102041" "5eb4b22e97ddb2db9ecce7d983fa45eb8367447f151c7e1b033af27820f43760" "fe349b21bb978bb1f1f2db05bc87b2c6d02f1a7fe3f27584cd7b6fbf8e53391a" "b8c5adfc0230bd8e8d73450c2cd4044ad7ba1d24458e37b6dec65607fc392980" "77515a438dc348e9d32310c070bfdddc5605efc83671a159b223e89044e4c4f1" "392f19e7788de27faf128a6f56325123c47205f477da227baf6a6a918f73b5dc" "2d5c40e709543f156d3dee750cd9ac580a20a371f1b1e1e3ecbef2b895cf0cd2" "a455366c5cdacebd8adaa99d50e37430b0170326e7640a688e9d9ad406e2edfd" "ed92c27d2d086496b232617213a4e4a28110bdc0730a9457edf74f81b782c5cf" "1c10e946f9a22b28613196e4c02b6508970e3b34660282ec92d9a1c293ee81bb" "cdc2a7ba4ecf0910f13ba207cce7080b58d9ed2234032113b8846a4e44597e41" "6e03b7f86fcca5ce4e63cda5cd0da592973e30b5c5edf198eddf51db7a12b832" "a11043406c7c4233bfd66498e83600f4109c83420714a2bd0cd131f81cbbacea" "0ca71d3462db28ebdef0529995c2d0fdb90650c8e31631e92b9f02bd1bfc5f36" default))
 '(package-selected-packages
   '(csv-mode swiper-helm helm-lsp helm-company helm-projectile helm lsp-pascal lsp-python-ms git-timemachine smartparens monokai-theme company-irony company-anaconda company-php php-mode ac-js2 flymake-python-pyflakes flymake-jslint flymake-json flymake-php company-jedi lsp-jedi jedi react-snippets treemacs-projectile projectile treemacs-magit flycheck dap-mode lsp-treemacs counsel-projectile counsel swiper zenburn-theme lsp-ui lsp-mode paredit yasnippet-classic-snippets company js2-refactor rainbow-identifiers rainbow-delimiters typescript-mode rjsx-mode js2-mode direx ivy magit color-theme-sanityinc-tomorrow color-theme-modern markdown-mode))
 '(show-paren-mode t)
 '(tool-bar-mode nil)
 '(treemacs-project-follow-mode t))

;;(load-theme 'solarized-dark t)
;; (load-theme 'wombat)
(package-install 'monokai-theme)
(load-theme 'monokai)

(setq find-program "C:\\cygwin64\\bin\\find.exe")
(setq grep-program "C:\\cygwin64\\bin\\grep.exe")
