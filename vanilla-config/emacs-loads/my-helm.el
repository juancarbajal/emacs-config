(use-package helm
  :init
  (helm-mode 1)
  :config
  ;; (require 'helm-config)
  (setq	helm-split-window-in-side-p t
		helm-move-to-line-cycle-in-source t
		)
  (global-set-key (kbd "M-x") 'helm-M-x)
  (global-set-key (kbd "M-x") 'helm-M-x)
  (global-set-key (kbd "C-x r b") 'helm-filtered-bookmarks)
  (global-set-key (kbd "C-x C-f") 'helm-find-files)
  (global-set-key (kbd "C-x b") 'helm-mini)
  (global-set-key (kbd "C-x C-r") 'helm-recentf)
  (global-set-key (kbd "C-c i") 'helm-imenu)
  (global-set-key (kbd "C-s") 'helm-occur)
  (global-set-key (kbd "M-y") 'helm-show-kill-ring)
  (define-key helm-map (kbd "TAB") 'helm-execute-persistent-action)
  (define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action)
  (define-key helm-map (kbd "C-z") 'helm-select-action))


(provide 'my-helm)
