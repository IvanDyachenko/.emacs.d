;;; 90_org.el --- Support for Org Mode -*- lexical-binding: t; -*-

;; Copyright (C) 2021  Ivan Dyachenko

;; Author: Ivan Dyachenko <vandyachen@gmail.com>
;; Keywords:

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:

;; 

;;; Code:
(require 'straight)

(straight-use-package 'org)
(straight-use-package 'org-modern)
(straight-use-package
 `(org-modern-indent
   :type git
   :host github
   :repo "jdtsmith/org-modern-indent"))

(require 'org)
(require 'org-modern)
(require 'org-modern-indent)

;; Org mode hooks
(add-hook 'org-mode-hook (lambda () (setq display-line-numbers-mode 'nil)))
(add-hook 'org-mode-hook (lambda () (auto-fill-mode)))
(add-hook 'org-mode-hook (lambda () (org-modern-indent-mode)))

;; Enable `global-org-modern-mode' if we are on a graphical display.
(if (display-graphic-p)
    (global-org-modern-mode))

;; Global Org mode keybinds.
(let ((map global-map))
  (define-key map (kbd "C-c a") 'org-agenda)
  (define-key map (kbd "C-c c") 'org-capture)
  (define-key map (kbd "C-c l") 'org-store-link)
  (define-key map (kbd "C-c g t") 'org-goto-gtd-dir)
  (define-key map (kbd "C-c g j") 'org-goto-journal)
  (define-key map (kbd "C-c g g") 'org-capture-goto-file))

;; Improve org mode looks
(setq
 ;; Startup folded
 org-startup-folded t
 ;; Startup with inline images
 org-startup-with-inline-images t
 ;; Image width
 org-image-actual-width '(600)
 ;; Startup indented
 org-startup-indented t
 ;; Use UTF-8 characters for Org-mode
 org-pretty-entities t
 ;; Hide emphasis markers like =code= or ~code~ etc..
 org-hide-emphasis-markers t
 ;; Hide leading stars
 org-hide-leading-stars t
 ;; Use custom ellipsis for headings
 org-ellipsis "…"
 ;; Don't auto-align tags
 org-auto-align-tags nil
 ;; Don't auto-indent tags
 org-tags-column 0
 org-catch-invisible-edits 'show-and-error
 ;; Use special ctrl-a/e keybinds that are content-aware.
 org-special-ctrl-a/e t
 ;; Respect content when inserting new headings.
 org-insert-heading-respect-content t
 ;; For navigation in the `org-goto' buffer
 org-goto-auto-isearch nil)

;; Enable `org-indent-mode'.
(setq org-indent-mode t)

;; `org-modern' configuration
(setq
 ;; Enable modern styling for code blocks and other blocks.
 org-modern-block t
 ;; Enable modern styling for tags.
 org-modern-tag t
 ;; Enable modern styling for todo labels.
 org-modern-todo t
 ;; Enable modern styling for tables.
 org-modern-table t
 ;; Enable modern styling for keywords.
 org-modern-keyword t
 ;; Enable modern styling for priority keywords.
 org-modern-priority t
 ;; Enable modern styling for timestamps.
 org-modern-timestamp t
 ;; Enable modern styling for statistics.
 org-modern-statistics t
 ;; Enable modern styling for horizontal rulers.
 org-modern-horizontal-rule t)

;; Use fixed pitch font for certain things
(defun set-buffer-variable-pitch ()
  "Set variable pitch, but set fixed-pitch for tables etc.."
  (interactive)
  (variable-pitch-mode t))

(add-hook 'org-mode-hook 'set-buffer-variable-pitch)

;; `org-agenda' styling
(setq
 org-agenda-tags-column 0
 org-agenda-block-separator ?─
 org-agenda-time-grid
 '((daily today require-timed)
   (800 1000 1200 1400 1600 1800 2000)
   " ┄┄┄┄┄ " "┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄")
 org-agenda-current-time-string
 "⭠ now ─────────────────────────────────────────────────")

;; Set org files directory

(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))

(setq org-agenda-skip-unavailable-files t)
(setq org-agenda-files '("~/Yandex.Disk.localized/org/"))

;; How do I turn on auto-fill-mode by default?
;; https://www.gnu.org/software/emacs/manual/html_node/efaq/Turning-on-auto_002dfill-by-default.html
;;(add-hook 'org-mode-hook '(lambda () (setq fill-column 100)))
;;(add-hook 'org-mode-hook 'turn-on-auto-fill)
;;(add-hook 'org-mode-hook
;;          '(lambda()
;;             (require 'ob-ammonite)
;;             (setq ob-ammonite-prompt-str "scala>")
;;             (org-babel-do-load-languages 'org-babel-load-languages '((shell      . t)
;;                                                                      (ditaa      . t)
;;                                                                      (plantuml   . t)
;;;;                                                                    (scala      . t)
;;                                                                      (ammonite   . t)
;;                                                                      (emacs-lisp . t)))))
;;; 90_org.el ends here
