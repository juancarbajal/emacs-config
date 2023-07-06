(defun dos2unix (buffer)
  "Automate M-% C-q C-m RET C-q C-j RET"
  (interactive "*b")
  (save-excursion
	(goto-char (point-min))
	(while (search-forward (string ?\C-m) nil t)
	  (replace-match (string ?\C-j) nil t))))

(defun convert-utf8 ()
  (interactive)
  (let ((coding-system-for-read 'utf8-unix)
		(coding-system-for-write 'utf8-unix)
		(coding-system-require-warning t)
		(current-prefix-arg nil))
	(message "has: Reopened file with coding set to windows-1252")
	(find-alternate-file buffer-file-name)
	)
  )

(defun indent-buffer ()
  (interactive)
  (save-excursion
	(indent-region (point-min) (point-max) nil)))

(provide 'my-scripts)
