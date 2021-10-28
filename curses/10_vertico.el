;;; 10_vertico.el --- Support for VERTical Interactive COmpletion mode  -*- lexical-binding: t; -*-

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
(require 'vertico)
(require 'consult)
(require 'consult-lsp)
(require 'consult-company)
(require 'consult-flycheck)
(require 'orderless)
(require 'marginalia)

(global-set-key (kbd "M-y")   'consult-yank-from-kill-ring)
(global-set-key (kbd "C-x b") 'consult-buffer)

;; M-g bindings (goto-map)
(global-set-key (kbd "M-g f") 'consult-flycheck)
(global-set-key (kbd "M-g g") 'consult-goto-line)
;; Custom bindings for fast register access.
(global-set-key (kbd "M-g r") 'consult-register)
(global-set-key (kbd "M-g l") 'consult-register-load)
(global-set-key (kbd "M-g s") 'consult-register-store)

; M-s bindings (search-map)
(global-set-key (kbd "M-s f") 'consult-find)
(global-set-key (kbd "M-s F") 'consult-locate)
(global-set-key (kbd "M-s g") 'consult-grep)
(global-set-key (kbd "M-s G") 'consult-git-grep)
(global-set-key (kbd "M-s l") 'consult-line)
(global-set-key (kbd "M-s L") 'consult-line-multi)
(global-set-key (kbd "M-s m") 'consult-multi-occur)
(global-set-key (kbd "M-s k") 'consult-keep-lines)
(global-set-key (kbd "M-s u") 'consult-focus-lines)

; Use Consult to select xref locations with preview.
(setq xref-show-xrefs-function       #'consult-xref)
(setq xref-show-definitions-function #'consult-xref)

(define-key lsp-mode-map     [remap xref-find-apropos]   #'consult-lsp-symbols)
(define-key company-mode-map [remap completion-at-point] #'consult-company)

;; A safe recommendation is to leave automatic immediate previews
;; enabled in general and disable the automatic preview only for
;; commands, where the preview may be expensive due to file loading.
(consult-customize
 consult-ripgrep consult-git-grep consult-grep
 consult-bookmark consult-recent-file consult-xref
 consult--source-file consult--source-project-file consult--source-bookmark
 :preview-key (kbd "M-#"))

;; This improves the register preview for `consult-register', `consult-register-load',
;; `consult-register-store' and the Emacs built-ins.
(setq register-preview-delay 0)
(setq register-preview-function #'consult-register-format)

;; This adds thin lines, sorting and hides the mode line of the window.
(advice-add #'register-preview :override #'consult-register-window)

;; This replaces `completing-read-multiple' with an enhanced version.
(advice-add #'completing-read-multiple :override #'consult-completing-read-multiple)

(autoload 'projectile-project-root "projectile")
(setq consult-project-root-function #'projectile-project-root)

(setq completion-styles             '(orderless))
(setq completion-category-defaults  nil)
(setq completion-category-overrides '((file (styles partial-completion))))

;; Use `consult-completion-in-region' if Vertico is enabled.
(add-hook 'vertico-mode-hook
          (lambda ()
            (setq completion-in-region-function
                  (if vertico-mode #'consult-completion-in-region #'completion--in-region))))

;; Enable marginalia.
(marginalia-mode t)

;; Enable Vertico.
(vertico-mode t)

(provide '10_vertico)
;;; 10_vertico.el ends here
