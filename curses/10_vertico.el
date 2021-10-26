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
(global-set-key (kbd "M-g f") 'consult-flycheck)
(global-set-key (kbd "M-g g") 'consult-goto-line)

(define-key lsp-mode-map     [remap xref-find-apropos]   #'consult-lsp-symbols)
(define-key company-mode-map [remap completion-at-point] #'consult-company)

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
