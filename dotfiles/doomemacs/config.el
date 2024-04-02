;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(setq doom-theme 'doom-one)

(setq display-line-numbers-type 'relative)

(setq org-directory "~/org/")

;; don't prompt before exiting
(setq confirm-kill-emacs nil)
;; don't prompt the first time we start vterm
(setq vterm-always-compile-module t)
;; use fish instead of bash
(setq vterm-shell "/home/linuxbrew/.linuxbrew/bin/fish")
;; default path has the wrong permissions
;; (setq server-socket-dir (concat "~/.emacs.d/" (getenv "ZELLIJ_SESSION_NAME") "/"))
;; shortcut to start deer
(evil-global-set-key 'normal "-" 'deer)
;; When done with this frame, type SPC q f`?
(setq server-client-instructions nil)
;; No prompt
(map! :leader
      :desc "Delete frame" "q f" #'delete-frame)

(after! keycast
  (define-minor-mode keycast-mode
    "Show current command and its key binding in the mode line."
    :global t
    (if keycast-mode
        (add-hook 'pre-command-hook 'keycast--update t)
      (remove-hook 'pre-command-hook 'keycast--update))))
(add-to-list 'global-mode-string '("" keycast-mode-line))
(require 'keycast)

(use-package! poetry
  :defer t
  :config
  (setq poetry-tracking-strategy 'projectile)
  )
