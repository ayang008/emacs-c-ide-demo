(use-package web-mode
  :init
  (setq auto-mode-alist
        (append
         '(("\\.html\\'" . web-mode))
         auto-mode-alist))
  )

(defun my-web-mode-indent-setup ()
  (setq web-mode-markup-indent-offset 2) ; web-mode, html tag in html file
  (setq web-mode-css-indent-offset 2)    ; web-mode, css in html file
  (setq web-mode-code-indent-offset 2)   ; web-mode, js code in html file
  )
(add-hook 'web-mode-hook 'my-web-mode-indent-setup)

(provide 'setup-web)
