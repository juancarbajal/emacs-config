(use-package terraform-mode
  :ensure t
  :mode ("\\.tf$" . terraform-mode)
  :init
  (add-hook 'terraform-mode 'company-terraform-init))
