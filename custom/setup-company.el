;; company
(use-package company
  :init
  (global-company-mode 1)
  (setq company-backends '((company-dabbrev-code company-gtags))))

;; company-c-headers
(use-package company-c-headers
  :init
  (add-to-list 'company-backends 'company-c-headers))

(provide 'setup-company)
