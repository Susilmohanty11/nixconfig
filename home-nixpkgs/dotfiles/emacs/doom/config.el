;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-
;; Global settings (defaults)

(setq
  dired-dwim-target t
  doom-themes-enable-bold t
  doom-themes-enable-italic t
  evil-escape-key-sequence "hh"
  evil-snipe-scope 'buffer
  mocha-snippets-use-fat-arrows t
  org-agenda-files (quote ("~/org/my"))
  org-default-notes-file "notes.org"
  org-directory "~/org/my"
  org-journal-date-format "%Y-%m-%d %A"
  org-journal-dir "~/Dropbox/jrn"
  projectile-project-search-path '("~/r/")
  )

(add-hook 'js2-mode-hook #'prettier-js-mode)
(add-hook 'typescript-mode-hook #'prettier-js-mode)
(add-hook 'python-mode-hook 'blacken-mode)

(load-theme 'doom-dracula t)

;; Enable flashing mode-line on errors
(doom-themes-visual-bell-config)
(doom-themes-treemacs-config)

;; Corrects (and improves) org-mode's native fontification.
(doom-themes-org-config)

(require 'evil-easymotion)
(evilem-make-motion
 evilem-motion-forward-WORD-begin #'evil-forward-WORD-begin)
(evilem-make-motion
 evilem-motion-backward-WORD-begin #'evil-backward-WORD-begin)


;; Prevent +write-mode from causing variable pitch fonts in all buffers.
(defun fix-solaire-mode ()
  (mixed-pitch-mode -1)
  (solaire-mode -1)
  (solaire-mode +1)
  (mixed-pitch-mode +1))
(add-hook 'org-mode-hook #'fix-solaire-mode)

(add-hook 'after-save-hook 'magit-after-save-refresh-status)
(require 'org-protocol)

