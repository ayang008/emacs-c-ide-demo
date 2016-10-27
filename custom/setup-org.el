(require 'org)

;; mkdir ~/.emacs.d/org
(let ((dir (concat user-emacs-directory "org")))
  (unless (file-exists-p dir)
    (make-directory dir))
  (setq org-agenda-files (list dir)))

(global-set-key (kbd "<f7>") (lambda ()
                               (interactive)
                               (find-file (file-name-as-directory (concat user-emacs-directory "org")))))

(setq org-src-fontify-natively t)
(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c a") 'org-agenda)
(setq org-log-done t)

(add-hook 'org-mode-hook
          (lambda () (setq truncate-lines nil)))

(provide 'setup-org)
