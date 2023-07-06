(package-install 'dart-server)
(package-install 'hover)

(with-eval-after-load 'projectile
  (add-to-list 'projectile-project-root-files-bottom-up "pubspec.yaml")
  (add-to-list 'projectile-project-root-files-bottom-up "BUILD"))

;; (setq dart-server-sdk-path "C:/flutter_windows_2.5.3-stable/flutter/bin/cache/dart-sdk/")
(setq exec-path (append exec-path '("C:/Program Files (x86)/GnuWin32/bin")))
;; (setq dart-server-enable-analysis-server t)
;; (add-hook 'dart-server-hook 'flycheck-mode)

(setq lsp-dart-only-analyze-projects-with-open-files t)
(setq package-selected-packages 
	  '(dart-mode lsp-mode lsp-dart lsp-treemacs flycheck company
				  ;; Optional packages
				  lsp-ui company hover))

(when (cl-find-if-not #'package-installed-p package-selected-packages)
  (package-refresh-contents)
  (mapc #'package-install package-selected-packages))

(setq gc-cons-threshold (* 100 1024 1024)
      read-process-output-max (* 1024 1024))

(add-hook 'dart-mode-hook 'lsp)


(provide 'my-dart)
