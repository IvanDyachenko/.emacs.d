;;; 40_completion-framework.el --- Piecing together a completion framework  -*- lexical-binding: t; -*-

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

;; Provides an `orderless' completion style that divides the pattern into
;; space-separated components, and matches candidates that match all of the
;; components in any order.
(straight-use-package 'orderless)
(require 'orderless)

;; Provides practical commands based on the Emacs completion function `completing-read'.
(straight-use-package 'consult)
(require 'consult)

;; Provides a performant and minimalistic vertical completion UI based on the
;; default completion system.
(straight-use-package 'vertico)
(require 'vertico)

;; This package provides `marginalia-mode' which adds marginalia to the minibuffer
;; completions.
(straight-use-package 'marginalia)
(require 'marginalia)

;; Enhances the default completion in region function with a completion overlay.
;;(require 'corfu)

;; Do not allow the cursor in the minibuffer prompt.
(setq minibuffer-prompt-properties
      '(read-only t cursor-intangible t face minibuffer-prompt))
(add-hook 'minibuffer-setup-hook #'cursor-intangible-mode)

;; Hide commands in `M-x' which do not work in the current mode.
(when (>= emacs-major-version 28)
  (setq read-extended-command-predicate #'command-completion-default-include-p))

(setq completion-styles '(orderless))

(global-set-key (kbd "M-y") 'consult-yank-from-kill-ring)

(global-set-key (kbd "C-x b") 'consult-buffer)

;; `M-g' bindings (goto-map).
(global-set-key (kbd "M-g g") 'consult-goto-line)
;; Custom bindings for fast register access.
(global-set-key (kbd "M-g r") 'consult-register)
(global-set-key (kbd "M-g l") 'consult-register-load)
(global-set-key (kbd "M-g s") 'consult-register-store)

;; `M-s' bindings (search-map).
(global-set-key (kbd "M-s f") 'consult-find)
(global-set-key (kbd "M-s F") 'consult-locate)
(global-set-key (kbd "M-s g") 'consult-grep)
(global-set-key (kbd "M-s G") 'consult-git-grep)
(global-set-key (kbd "M-s l") 'consult-line)
(global-set-key (kbd "M-s L") 'consult-line-multi)
(global-set-key (kbd "M-s m") 'consult-multi-occur)
(global-set-key (kbd "M-s k") 'consult-keep-lines)
(global-set-key (kbd "M-s u") 'consult-focus-lines)

;; This improves the register preview for `consult-register', `consult-register-load',
;; `consult-register-store' and the Emacs built-ins.
(setq register-preview-delay 0)
(setq register-preview-function #'consult-register-format)

;; This adds thin lines, sorting and hides the mode line of the window.
(advice-add #'register-preview :override #'consult-register-window)

;; This replaces `completing-read-multiple' with an enhanced version.
(advice-add #'completing-read-multiple :override #'consult-completing-read-multiple)

;; Use Consult to select xref locations with preview.
;;(setq xref-show-xrefs-function       #'consult-xref)
;;(setq xref-show-definitions-function #'consult-xref)

;; A safe recommendation is to leave automatic immediate previews
;; enabled in general and disable the automatic preview only for
;; commands, where the preview may be expensive due to file loading.
(consult-customize
 consult-theme
 :preview-key '(:debounce 0.2 any)
 consult-grep consult-ripgrep consult-git-grep
 consult-xref consult-bookmark consult-recent-file
 consult--source-bookmark consult--source-file consult--source-project-file
 :preview-key (kbd "M-#"))

;; Enable recursive minibuffers.
(setq enable-recursive-minibuffers t)

;; Completing-read-multiple (CRM).
;; Add prompt indicator to `completing-read-multiple'.
;; Alternatively try `consult-completing-read-multiple'.
(defun crm-indicator (args)
  (cons (concat "[CRM] " (car args)) (cdr args)))
;;(advice-add #'completing-read-multiple :filter-args #'crm-indicator)
(advice-add #'completing-read-multiple :override #'consult-completing-read-multiple)

;; Use `consult-completion-in-region' if Vertico is enabled.
;; Otherwise use the default `completion--in-region' function.
(add-hook 'vertico-mode-hook
          (lambda ()
            (setq completion-in-region-function
                  (if vertico-mode #'consult-completion-in-region #'completion--in-region))))

;; Enable Vertico globally.
(vertico-mode t)

;; Enable Marginalia globally.
(marginalia-mode t)

;; Enable indentation and completion using the `TAB' key.
;; Completion is often bound to `M-TAB'.
(setq tab-always-indent 'complete)

(defun cursed--completion-framework-lsp-setup ()
  "Ensure Completion Framework and LSP work better together."
  (setq-local completion-styles '(orderless)
              completion-category-defaults nil))

;; Enable Corfu globally.
;;(corfu-global-mode)

(provide '40_completion-framework)
;;; 40_completion-framework.el ends here
