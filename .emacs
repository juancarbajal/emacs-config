(setq org-agenda-files (list "C:/Users/jcarbajal/Google Drive/gtd.org")) 
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files (quote ("C:/Users/jcarbajal/Google Drive/gtd.org")))
 '(package-selected-packages
   (quote
	(json-mode feature-mode yaml-mode org-vcard cyberpunk-theme markdown-mode magit)))
 '(safe-local-variable-values (quote ((ENCODING . UTF-8))))
 '(send-mail-function (quote smtpmail-send-it)))


(require 'cl)
(add-to-list 'load-path (expand-file-name "elisp" (getenv "HOME")))
(add-to-list 'exec-path "C:/cygwin64/bin")
(setenv "RSH" "SSH")
(setenv "LANG" "es_ES")
(setenv "CYGWIN" "nodosfilewarning")

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
(blink-cursor-mode -1)
(winner-mode 1)
(windmove-default-keybindings)
(savehist-mode 1)

(when (fboundp 'mac-print-mode)
  (mac-print-mode 1)
  (global-set-key (kbd "M-p") 'mac-print-buffer))
(setq vc-follow-symlinks t
      read-quoted-char-radix 10)


(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(prefer-coding-system 'utf-8)
(setq coding-system-for-read 'utf-8)
(setq coding-system-for-write 'utf-8)
;;(invert-face 'default)
;;(global-font-lock-mode t)
(menu-bar-mode 1)
(tool-bar-mode -1)
;; (setq make-backup-files nil)
(setq
 backup-by-copying t      
 backup-directory-alist
 '(("." . "~/.saves"))    
 delete-old-versions t
 kept-new-versions 6
 kept-old-versions 2
 version-control t)
(setq bookmark-default-file "~/.saves/bookmarks.bmk" bookmark-save-flag 1)
(setq x-select-enable-clipboard t)
(if (eq system-type 'gnu-linux) (setq interprogram-paste-function 'x-cut-buffer-or-selection-value))
(if (eq system-type 'windows-nt) (setq interprogram-paste-function 'x-selection-value))
(global-visual-line-mode t)

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
;;Fuente
;;(add-to-list 'default-frame-alist
;;             '(font . "DejaVu Sans Mono-10"))
;;(set-frame-font "DejaVu Sans Mono-10")
;; (cond
;;  ((string-equal system-type "windows-nt") ; Microsoft Windows
;;   (when (member "DejaVu Sans Mono" (font-family-list))
;;     (add-to-list 'initial-frame-alist '(font . "DejaVu Sans Mono-10"))
;;     (add-to-list 'default-frame-alist '(font . "DejaVu Sans Mono-10"))))
;;  ((string-equal system-type "darwin") ; Mac OS X
;;   (when (member "DejaVu Sans Mono" (font-family-list))
;;     (add-to-list 'initial-frame-alist '(font . "DejaVu Sans Mono-10"))
;;     (add-to-list 'default-frame-alist '(font . "DejaVu Sans Mono-10"))))
;;  ((string-equal system-type "gnu/linux") ; linux
;;   (when (member "DejaVu Sans Mono" (font-family-list))
;;     (add-to-list 'initial-frame-alist '(font . "DejaVu Sans Mono-10"))
;;     (add-to-list 'default-frame-alist '(font . "DejaVu Sans Mono-10")))))


(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/"))
(package-initialize)


(fset `yes-or-no-p `y-or-n-p)
										;(global-linum-mode t)
										;(setq linum-format "%4d")
(setq find-file-visit-truename t)
;;(setq interprogram-paste-function 'x-cut-buffer-or-selection-value)
(setq visible-bell t)
(setq inhibit-startup-message   t)
(setq column-number-mode t)

(defun indent-buffer ()
  (interactive)
  (save-excursion
	(indent-region (point-min) (point-max) nil)))
(global-set-key [f12] 'indent-buffer)

(setq-default c-basic-offset 4
              tab-width 4              
              indent-tabs-mode t)
(global-set-key (kbd "C-S-i") 'indent-region)
(global-set-key (kbd "C-S-l") 'goto-line)
										;(global-set-key (kbd "C-q") 'query-replace)
(global-set-key (kbd "C-c q") 'query-replace-regexp)
(global-set-key (kbd "C-s") 'isearch-forward)
(global-set-key (kbd "C-r") 'isearch-backward)
(global-set-key (kbd "C-c s") 'isearch-forward-regexp)
(global-set-key (kbd "C-c r") 'isearch-backward-regexp)
(global-set-key (kbd "C-s") 'isearch-forward)
(global-set-key (kbd "C-r") 'isearch-backward)
(global-set-key (kbd "C-c s") 'isearch-forward-regexp)
(global-set-key (kbd "C-c r") 'isearch-backward-regexp)

(global-set-key (kbd "C-S-c") 'comment-region)
(global-set-key (kbd "C-S-u") 'uncomment-region)
(global-set-key (kbd "C-z") 'call-last-kbd-macro)
(global-set-key (kbd "C-x C-k") 'kill-buffer)
;;(global-set-key (kbd "C-c l") 'linum-mode)
(global-set-key (kbd "C-f") 'new-frame)

(global-set-key [kp-home]  'beginning-of-buffer) ; [Home] 
(global-set-key [home]     'beginning-of-buffer) ; [Home] 
(global-set-key [kp-end]   'end-of-buffer)       ; [End] 
(global-set-key [end]      'end-of-buffer)       ; [End] 
(global-set-key [kp-prior] 'my-scroll-down)      ; [PgUp] 
(global-set-key [prior]    'my-scroll-down)      ; [PgUp] 
(global-set-key [kp-next]  'my-scroll-up)        ; [PgDn] 
(global-set-key [next]     'my-scroll-up)        ; [PgDn] 

(defun duplicate-line()
  (interactive)
  (move-beginning-of-line 1)
  (kill-line)
  (yank)
  (open-line 1)
  (next-line 1)
  (yank)
  )
(global-set-key (kbd "C-c d") 'duplicate-line)
(setq org-timer-default-timer 25)

;;(global-set-key (kbd "C-<") 'tabbar-backward)
;;(global-set-key (kbd "C->") 'tabbar-forward) ;; tabbar.el, put all the buffers on the tabs.
;;(setq tabbar-use-images t)

(setq load-path (cons "~/.emacs.d/extras" load-path))

										;

;;IDO
(ido-mode 1)

;;Color theme
(add-to-list 'load-path "~/.emacs.d/extras/color-theme-6.6.0")
(require 'color-theme)
										;(require 'zenburn-theme)
(color-theme-initialize)
										;(color-theme-deep-blue)
										;(color-theme-zendburn)
;;(color-theme-gray30)
;;(color-theme-word-perfect)
										;(require 'color-theme-wombat)
										;(color-theme-wombat)
										;(require 'color-theme-leuven)
										;(color-theme-leuven)
;;(require 'cyberpunk-theme)
;;(cyberpunk-theme)
(add-to-list 'custom-theme-load-path "~/.emacs.d/extras/cyberpunk-theme.el")
;;(set-frame-font "-unknown-DejaVu Sans Mono-normal-normal-normal-*-*-*-*-*-m-0-iso10646-1")
(load-theme 'cyberpunk t)

;;GIT
;;(setq load-path (cons "~/.emacs.d/extras/magit-1.2.0" load-path))
;;(require 'magit)

;;Markdown
(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

(autoload 'gfm-mode "gfm-mode"
  "Major mode for editing GitHub Flavored Markdown files" t)
(add-to-list 'auto-mode-alist '("README\\.md\\'" . gfm-mode))


;;Diccionarios
;; (add-hook 'LaTeX-mode-hook 'flyspell-mode)
;; (add-hook 'org-mode-hook 'flyspell-mode)

(add-to-list 'load-path "~/.emacs.d/extras/auto-complete-1.3.1")    ; This may not be appeared if you have already added.
(require 'auto-complete)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/extras/auto-complete-1.3.1/dict")
(require 'auto-complete-config)
(ac-config-default)
(setq ac-auto-start 3)
(setq ac-menu-height 20)
;; (add-hook 'org-mode-hook
;;           (lambda ()
;;             (make-local-variable 'ac-stop-words)
;;             (loop for template in org-structure-template-alist do
;;                   (add-to-list 'ac-stop-words 
;;                                (concat "<" (car template))))))
(setq ac-use-menu-map t)
;; (add-hook 'org-mode-hook 'auto-complete-mode)
(add-to-list 'ac-modes 'org-mode)
(ac-set-trigger-key "TAB")

;; Default settings
(define-key ac-menu-map "\C-n" 'ac-next)
(define-key ac-menu-map "\C-p" 'ac-previous)


;;Latex
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)

;;PHP
(require 'php-mode)
(autoload 'php-mode "php-mode" "Major mode for editing php code." t)
(add-to-list 'auto-mode-alist '("\\.php$" . php-mode))
(add-to-list 'auto-mode-alist '("\\.inc$" . php-mode))
(add-to-list 'auto-mode-alist '("\\.phtml$" . php-mode))

;;
(defun show-file-name ()
  "Show the full path file name in the minibuffer."
  (interactive)
  (message (buffer-file-name))
  (kill-new (file-truename buffer-file-name))
  )


;;LIsta de contactos
;;(add-to-list 'load-path "~/.emacs.d/extras/bbdb-3.1.2/lisp")    ;; (1)
;;(add-to-list 'load-path "~/elisp/bbdb/lisp")         ;; (2)

;; (require 'bbdb) ;; (3)
;; (bbdb-initialize 'gnus 'message)   ;; (4)
;; (setq bbdb-north-american-phone-numbers-p nil)   ;; (5)


;;Herramientas
(require 'tabbar)
(tabbar-mode t)


										;ORG
(require 'org-bullets)
(add-hook 'org-clock-in-hook '(lambda () 
								(if (not org-timer-current-timer) 
									(org-timer-set-timer '(16))))) 
(defun gtd ()
  (interactive)
  (find-file "C:/Users/jcarbajal/Google Drive/gtd.org")
  )
(setq org-src-fontify-natively t)
(setq org-src-tab-acts-natively t)
(add-hook 'org-mode-hook 'org-bullets-mode)
(add-hook 'org-mode-hook
		  '(lambda()
			 (local-set-key (kbd "C-c l") 'org-store-link)
			 (local-set-key (kbd "C-c a") 'org-agenda)
			 (local-set-key (kbd "C-c c") 'org-capture)
			 (local-set-key (kbd "C-c i") 'org-iswitchb)
			 )
		  )



;;printing
(setq ps-printer-name "\\\\fileserver03\\PDF_FOR_ALL"
      ps-spool-duplex t
      ps-print-header nil
      ps-use-face-background t)


;;Server
(require 'server)
(when (and (= emacs-major-version 23)
           (= emacs-minor-version 1)
           (equal window-system 'w32))
  (defun server-ensure-safe-dir (dir) "Noop" t)) ; Suppress error "directory
                                                 ; ~/.emacs.d/server is unsafe"
                                                 ; on windows.
(server-start 1)
