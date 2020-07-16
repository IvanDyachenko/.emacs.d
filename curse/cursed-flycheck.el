;;; cursed-flycheck.el --- cursed Flycheck           -*- lexical-binding: t; -*-

;; Copyright (C) 2020  Ivan Dyachenko

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

;; Syntax checking for GNU Emacs

;;; Code:

(require 'straight)

(straight-use-package 'flycheck)

(require 'flycheck)

;; When set to `inherit', use the `load-path' of the current Emacs session during syntax checking.
(setq flycheck-emacs-lisp-load-path 'inherit)

(global-flycheck-mode)

(provide 'cursed-flycheck)
;;; cursed-flycheck.el ends here
