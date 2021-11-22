;;; 50_flycheck.el --- Support for Flycheck Mode -*- lexical-binding: t; -*-

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

;; Syntax checking for GNU Emacs

;;; Code:
(require 'flycheck)
(require 'consult-flycheck)

;; `M-g' bindings (goto-map).
(global-set-key (kbd "M-g f") 'consult-flycheck)

;; When set to `inherit', use the `load-path' of the current Emacs session during syntax checking.
(setq flycheck-emacs-lisp-load-path 'inherit)

(add-to-list 'display-buffer-alist
             `(,(rx bos "*Flycheck errors*" eos)
               (display-buffer-reuse-window display-buffer-in-side-window)
               (side            . bottom)
               (reusable-frames . visible)
               (window-height   . 0.20)))

(global-flycheck-mode)
;;; 50_flycheck.el ends here
