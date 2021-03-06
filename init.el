
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)

(package-initialize)

(when (not package-archive-contents)
    (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)
(setq package-check-signature nil)

(add-to-list 'load-path "~/.emacs.d/custom")

(require 'setup-custom-functions)
(require 'setup-general)
(if (version< emacs-version "24.4")
    (require 'setup-ivy-counsel)
  (require 'setup-helm)
  (require 'setup-helm-gtags)
  (require 'setup-helm-ag))
;; (require 'setup-ggtags)
(require 'setup-cedet)
(require 'setup-editing)
(require 'setup-company)
;; (require 'setup-flycheck)
(require 'setup-c)
(require 'setup-js)
(require 'setup-web)
(require 'setup-smex)
(require 'setup-magit)
;(require 'setup-ace-window)
(require 'setup-org)
(require 'setup-theme)
(require 'setup-hungry-delete)
(require 'setup-smartparens)
(require 'setup-recentf)
(require 'setup-yasnippet)
(require 'setup-protobuf)

;; function-args
;; (require 'function-args)
;; (fa-config-default)
;; (define-key c-mode-map  [(tab)] 'company-complete)
;; (define-key c++-mode-map  [(tab)] 'company-complete)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (auto-yasnippet flycheck smartparens hungry-delete monokai-theme smex ace-window magit sr-speedbar zygospore helm-gtags helm yasnippet ws-butler volatile-highlights use-package undo-tree iedit dtrt-indent counsel-projectile company clean-aindent-mode anzu))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
