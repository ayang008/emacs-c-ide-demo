(global-set-key (kbd "<f7>") (lambda ()
                               (interactive)
                               (find-file (concat user-emacs-directory "my.org"))))

(provide 'setup-org-mode)
