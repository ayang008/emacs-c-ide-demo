(use-package flycheck
  :init
  (add-hook 'js2-mode-hook 'flycheck-mode)
  (add-hook 'c-mode-common-hook 'flycheck-mode)
  (add-hook 'python-mode-hook 'flycheck-mode)
  (add-hook 'emacs-lisp-mode 'flycheck-mode)
  (add-hook 'c++-mode-hook (lambda ()
                             (setq flycheck-gcc-language-standard "c++1y")
                             (setq flycheck-c/c++-gcc-executable "/usr/dev_tools/trunk/bin/gcc"))))

(provide 'setup-flycheck)
