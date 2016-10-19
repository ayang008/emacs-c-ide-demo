(defun parent-directory-name (path)
  "Return parent direcory name"
  (file-name-directory (directory-file-name path)))

(provide 'setup-custom-functions)
