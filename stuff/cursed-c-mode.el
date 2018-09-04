;;; cursed-c-mode.el --- cursed c mode               -*- lexical-binding: t; -*-

;; Copyright (C) 2018  Ivan Dyachenko

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

(use-package cc-mode
  :mode ("\\.h\\'" . c++-mode))

(use-package company-irony
  :config (add-to-list 'company-backends 'company-irony))

(use-package irony
  :after (company-irony)
  :hook ((c-mode . irony-mode)
         (c++-mode . irony-mode)
         (objc-mode . irony-mode)
         (irony-mode . irony-cdb-autosetup-compile-options)))

;; google-c-style
(use-package google-c-style
  :hook ((c-mode-common . google-set-c-style)
         (c-mode-common . google-make-newline-indent)))

;; clang-format
(use-package clang-format
  :after (cc-mode)
  :bind (:map c-mode-base-map
              ("C-c C-f" . clang-format-buffer))
  :hook (before-save . (lambda()
                         (when (or (eq major-mode 'c-mode)
                                   (eq major-mode 'c++-mode)
                                   (eq major-mode 'glsl-mode))
                           (clang-format-buffer)))))

(provide 'cursed-c-mode)
;;; cursed-c-mode.el ends here
