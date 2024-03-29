;;; 20_editing.el --- Effective editing              -*- lexical-binding: t; -*-

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

;; Deals with parens pairs and tries to be smart about it.
(straight-use-package 'smartparens)
(require 'smartparens)

(add-hook 'prog-mode-hook #'smartparens-mode)

;; Takes care to trim down the abandoned white space characters.
(straight-use-package 'clean-aindent-mode)
(require 'clean-aindent-mode)

;; Highlights delimiters such as parentheses, brackets or braces
;; according to their depth.
(straight-use-package 'rainbow-delimiters)
(require 'rainbow-delimiters)

(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

;; Highlights each source code identifier uniquely based on its name.
;; (straight-use-package 'color-identifiers-mode)
;; (require 'color-identifiers-mode)

;;(add-hook 'prog-mode-hook #'global-color-identifiers-mode)

(setq-default indent-tabs-mode nil) ;; To use space instead of tabs whenindenting.

(add-hook 'after-init-hook
          (lambda () (setq show-trailing-whitespace 1)))

(add-hook 'after-init-hook
          (lambda ()
            (set 'clean-aindent-is-simple-indent t)
            (define-key global-map (kbd "RET") 'newline-and-indent)))

;; Turn `auto-fill-mode' only for code comments.
(add-hook 'prog-mode-hook
          (lambda ()
            (setq-local comment-multi-line t)
            (setq-local comment-auto-fill-only-comments t)
            (auto-fill-mode 1)))

(show-smartparens-global-mode t)

(provide '20_editing)
;;; 20_editing.el ends here
