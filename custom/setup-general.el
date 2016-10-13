(menu-bar-mode -1)

(setq gc-cons-threshold 100000000)
(setq inhibit-startup-message t)

(defalias 'yes-or-no-p 'y-or-n-p)

;; show unncessary whitespace that can mess up your diff
(add-hook 'prog-mode-hook
          (lambda () (interactive)
            (setq show-trailing-whitespace 1)))

;; use space to indent by default
(setq-default indent-tabs-mode nil)

;; set appearance of a tab that is represented by 8 spaces
(setq-default tab-width 8)

;; Compilation
(setq compile-command "/*usr/dev_tools/trunk/bin/make -k")
(global-set-key (kbd "<f5>") (lambda ()
                               (interactive)
                               (setq-local compilation-read-command nil)
                               (call-interactively 'compile)))

;; Jump to emacs.d/custom dired
(global-set-key (kbd "<f2>") (lambda ()
                               (interactive)
                               (find-file "~/.emacs.d/custom")))

;; setup GDB
(setq
 ;; use gdb-many-windows by default
 gdb-many-windows t

 ;; Non-nil means display source file containing the main routine at startup
 gdb-show-main t

 ;; gdb command
 gud-gdb-command-name "/usr/dev_tools/trunk-el6/bin/gdb -i=mi"
)

;; Package: projejctile
(use-package projectile
  :init
  (projectile-global-mode)
  (setq projectile-enable-caching t))

;; Package zygospore
(use-package zygospore
  :bind (("C-x 1" . zygospore-toggle-delete-other-windows)
         ("RET" .   newline-and-indent)))

  ; automatically indent when press RET

;; activate whitespace-mode to view all whitespace characters
(global-set-key (kbd "C-c w") 'whitespace-mode)
(windmove-default-keybindings)

;; move buckup and auto-save to tmp
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;; fix putty DEL after setting The Backspace key to Control-H
;; and Initial state of cursor keys to Application
(normal-erase-is-backspace-mode 1)

;; global keys
(global-set-key (kbd "C-c o") 'occur)
(global-set-key (kbd "C-x C-b") 'buffer-menu)
(global-set-key (kbd "C-d") 'delete-backward-char)

(provide 'setup-general)
