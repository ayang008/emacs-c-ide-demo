(use-package yasnippet
  :init
  (add-hook 'prog-mode-hook 'yas-minor-mode))

(yas-reload-all)

(use-package auto-yasnippet)

(provide 'setup-yasnippet)
