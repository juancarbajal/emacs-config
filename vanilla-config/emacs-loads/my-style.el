(show-paren-mode 1)
(blink-cursor-mode 1)
(global-visual-line-mode t)
(fset `yes-or-no-p `y-or-n-p)
(tool-bar-mode -1)
(setq find-file-visit-truename t)
;;(setq interprogram-paste-function 'x-cut-buffer-or-selection-value)
(setq inhibit-startup-message		t) ;;init with blank file
(setq global-linum-mode t)
(setq column-number-mode t)
(setq mode-line-format nil)
;; (use-package doom-modeline
;;   :ensure t
;;   :hook (after-init . doom-modeline-mode))


;; (global-display-line-numbers-mode)
(set-frame-font "Hack 12" nil t)
;; (load-theme 'deeper-blue)
(load-theme 'wombat)
;;(load-theme 'leuven)
(provide 'my-style)
