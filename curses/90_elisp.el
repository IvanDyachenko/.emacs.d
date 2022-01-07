;;; 90_elisp.el --- Support for the Emacs Lisp language  -*- lexical-binding: t; -*-

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
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; 

;;; Code:
(require 'straight)

;; Highlight Lisp quotes and quoted symbols.
(straight-use-package 'highlight-quoted)

;; Highlight known Emacs Lisp symbols.
(straight-use-package 'highlight-defined)

(straight-use-package 'highlight-parentheses)


(add-hook 'emacs-lisp-mode-hook 'highlight-quoted-mode)
(add-hook 'emacs-lisp-mode-hook 'highlight-defined-mode)
(add-hook 'emacs-lisp-mode-hook 'highlight-parentheses-mode)
;;; 90_elisp.el ends here
