(setenv "CVS_RSH" "ssh")
(setenv "WikiDataDir" "test-data")
(setq visible-bell t)
(setq mouse-drag-copy-region t)
(setq history-length 1000)
(setq tramp-auto-save-directory (getenv "TEMP"))

(winner-mode 1)
(windmove-default-keybindings)
(savehist-mode 1)
(fset 'yes-or-no-p 'y-or-n-p)

(setq backup-directory-alist '(("." . "~/.emacs.d/backup/"))
      backup-by-copying			 t	; Don't de-link hard links
      version-control				 t	; Use version numbers on backups
      delete-old-versions		 t	; Automatically delete excess backups:
      kept-new-versions			 6 ; how many of the newest versions to keep
      kept-old-versions			 2) ; and how many of the old
(setq auto-save-default nil)


(setq bookmark-default-file "~/.emacs.d/saves/bookmarks.bmk" bookmark-save-flag 1)
;; (setq x-select-enable-clipboard t)
(setq select-enable-clipboard t)
(if (eq system-type 'gnu-linux) (setq interprogram-paste-function 'x-cut-buffer-or-selection-value))
(if (eq system-type 'windows-nt) (setq interprogram-paste-function 'x-selection-value))

(setq enable-recursive-minibuffers t)

(provide 'my-settings)
