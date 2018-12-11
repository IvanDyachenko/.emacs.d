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

(use-package cc-mode)

(use-package company-irony
  :config (add-to-list 'company-backends 'company-irony))

(use-package irony
  :after (company-irony)
  :hook ((c-mode . irony-mode)
         (c++-mode . irony-mode)
         (objc-mode . irony-mode)
         (irony-mode . irony-cdb-autosetup-compile-options)))

(use-package google-c-style
  :hook ((c-mode . google-set-c-style)
         (c-mode . google-make-newline-indent)
         (c++-mode . google-set-c-style)
         (c++-mode . google-make-newline-indent)))

(use-package clang-format
  :bind ("C-M-<tab>" . clang-format-buffer)
  :config (setq clang-format-style-option "google"))

(use-package flycheck-irony
  :requires flycheck irony
  :hook ((flycheck-mode . flycheck-irony-setup)))

(provide 'cursed-c-mode)
;;; cursed-c-mode.el ends here
