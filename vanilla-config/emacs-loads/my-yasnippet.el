;; (require 'yasnippet)
(yas-global-mode 1)
(use-package yasnippet
  :ensure t
  :commands yas-minor-mode
  :hook (go-mode . yas-minor-mode))

(provide 'my-yasnippet)
