;;; start package
(setq gc-cons-threshold (* 50 1000 1000))
(setq gc-cons-percentage 0.6)
(defvar base-path (concat (getenv "HOME") "/emacs-loads/"))
;; Eval emacs-loads/compile.el

;; (if (locate-library "my-settings")
;;     (autoload 'my-settings "my-settings" "Start base settings")
;;   )

(defvar my-loads '("my-settings"
                   "my-packages"
                   "my-scripts"
                   "my-style"
                   "my-projectile"
                   "my-autocomplete"
                   "my-ivy"
                   ;; "my-helm"
                   "my-programming"
                   "my-web"
                   "my-js2"
                   "my-python"
                   "my-go"
                   ;; "my-php"
                   ;; "my-rust"
                   "my-devops"
                   ;; "my-spell"
                   "my-org"
		           "my-keys"
                   ))

(dolist (p my-loads)
  (load (concat base-path p) ))

(setq gc-cons-threshold (* 2 1000 1000))
