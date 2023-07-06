(package-install 'dap-mode)
(setq dap-auto-configure-features '(sessions locals controls tooltip))
(dap-mode 1)
(dap-ui-mode 1)
(dap-tooltip-mode 1)
(tooltip-mode 1)
(dap-ui-controls-mode 1)

(provide 'my-dap)
