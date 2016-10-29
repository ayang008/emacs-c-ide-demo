(require 'org)

;; mkdir ~/.emacs.d/org
(let ((dir (concat user-emacs-directory "org")))
  (unless (file-exists-p dir)
    (make-directory dir))
  (setq org-agenda-files (list dir)))

(global-set-key (kbd "<f7>") (lambda ()
                               (interactive)
                               (find-file (file-name-as-directory (concat user-emacs-directory "org")))))

(setq org-todo-keywords
      '((type "TODO" "Amber(m)" "Aaron(a)" "Linc(l)" "|" "DONE")))

(setq org-startup-indented t)

(setq org-src-fontify-natively t)
(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c a") 'org-agenda)
;(setq org-log-done t)

(add-hook 'org-mode-hook
          (lambda () (setq truncate-lines nil)))

(defun org-summary-todo (n-done n-not-done)
  "Switch entry to DONE when all subentries are done, to TODO otherwise."
  (let (org-log-done org-log-states)   ; turn off logging
    (org-todo (if (= n-not-done 0) "DONE" "TODO"))))
(add-hook 'org-after-todo-statistics-hook 'org-summary-todo)

(provide 'setup-org)
