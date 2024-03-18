(setq ispell-program-name "hunspell")
(setq ispell-program-name "c:/Program Files (x86)/hunspell/bin/hunspell.exe")
(setenv "DICTIONARY" "en_US")
;; (setq ispell-program-name "c:/Program Files (x86)/Aspell/bin/aspell.exe")
;; (require 'ispell)
;; (use-package ispell
;;   :hook
;;   (dolist (hook '(org-mode-hook))
;; 		  (add-hook hook (lambda() (flyspell-mode 1))))
;;   )

(defun flyspell-spanish ()
  (interactive)
  (ispell-change-dictionary "castellano")
  (flyspell-buffer))
(defun flyspell-english ()
  (interactive)
  (ispell-change-dictionary "default")
  (flyspell-buffer))

(provide 'my-spell)
