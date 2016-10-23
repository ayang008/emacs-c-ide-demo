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

;; set appearance of a tab that is represented by 4 spaces
(setq-default tab-width 4)

;; Compilation
(global-set-key (kbd "<f5>") (lambda ()
                               (interactive)
                               (save-some-buffers t)
                               (let ((path default-directory))
                                 (while (and (not (member "Makefile" (directory-files path))) (not (eq path "/")))
                                   (setq path (parent-directory-name path)))
                                 (unless (eq path "/") (progn
                                                         (setq-local compilation-read-command nil)
                                                         (cd path)
                                                         (if (y-or-n-p "Make clean before make?")
                                                             (setq compile-command "/usr/dev_tools/trunk/bin/make clobber; /usr/dev_tools/trunk/bin/make -j4;")
                                                           (setq compile-command "/usr/dev_tools/trunk/bin/make -j4"))
                                                         (call-interactively 'compile))))))

;; Test
(setq test-command "/usr/dev_tools/trunk/bin/make test")
(global-set-key (kbd "<f6>") (lambda ()
                               (interactive)
                               (save-some-buffers t)
                               (let ((path default-directory))
                                 (while (and (not (member "Makefile" (directory-files path))) (not (eq path "/")))
                                   (setq path (parent-directory-name path)))
                                 (unless (eq path "/") (progn
                                                         (setq-local compilation-read-command nil)
                                                         (cd path)
                                                         (shell-command test-command))))))

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
(setq make-backup-files nil)
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;; fix putty DEL after setting The Backspace key to Control-H
;; and Initial state of cursor keys to Application
(normal-erase-is-backspace-mode 1)

;; global keys
(global-set-key (kbd "C-c o") 'occur)
(global-set-key (kbd "C-x C-b") 'buffer-menu)
(global-set-key (kbd "C-d") 'delete-backward-char)
(global-set-key (kbd "C-h C-f") 'find-function)

(setq initial-frame-alist '((fullscreen . maximized)))
(delete-selection-mode 1)
(show-paren-mode 1)
;; (global-hl-line-mode 1)

(defun remove-dos-eol ()
  "Replace DOS eolns CR LF with Unix eolns CR"
  (interactive)
  (goto-char (point-min))
  (while (search-forward "\r" nil t) (replace-match "")))

(provide 'setup-general)
