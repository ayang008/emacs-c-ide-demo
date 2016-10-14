(require 'org)
(setq org-src-fontify-natively t)

;; mkdir ~/.emacs.d/org
(let ((dir (concat user-emacs-directory "org")))
  (unless (file-exists-p dir)
    (make-directory dir))
  (setq org-agenda-files (list dir)))

(global-set-key (kbd "<f7>") (lambda ()
                               (interactive)
                               (find-file (file-name-as-directory (concat user-emacs-directory "org")))))

(global-set-key (kbd "C-c a") 'org-agenda)

(provide 'setup-org-mode)
