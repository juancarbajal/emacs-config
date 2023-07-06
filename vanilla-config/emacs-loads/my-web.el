;; (require 'multi-web-mode)
;; (use-package multi-web-mode
;;   :init (

;; 		 )
;;   )
(setq mweb-default-major-mode 'html-mode)
(setq mweb-tags 
	  '((js-mode  "<script[^>]*>" "</script>")
		(css-mode "<style[^>]*>" "</style>")))
(setq mweb-filename-extensions '("htm" "html" "phtml"))
(multi-web-global-mode 1)
(provide 'my-web)
