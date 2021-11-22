;;; 50_helm.el --- Support for Helm Mode -*- lexical-binding: t; -*-

;; Copyright (C) 2021  Ivan Dyachenko

;; Author: Ivan Dyachenko <vandyachen@gmail.coml>
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
;; (require 'helm)
;; (require 'helm-lsp)
;; (require 'helm-config)

;; (global-set-key (kbd "M-x")     'helm-M-x)
;; (global-set-key (kbd "C-x b")   'helm-mini)
;; (global-set-key (kbd "C-x C-f") 'helm-find-files)

;; (define-key lsp-mode-map [remap xref-find-apropos] #'helm-lsp-workspace-symbol)

;; (defvar helm-ff-cache-mode-lighter
;;   (setq helm-ff-cache-mode-lighter ""))

;; (defvar helm-ff-cache-mode-lighter-sleep
;;   (setq helm-ff-cache-mode-lighter-sleep ""))

;; (defvar helm-M-x-fuzzy-match
;;   (setq helm-M-x-fuzzy-match t)
;;   "Optional fuzzy matching.")

;; (defvar helm-buffers-fuzzy-matching
;;   (setq helm-buffers-fuzzy-matching t)
;;   "Optional fuzzy matching.")

;; (defvar helm-recentf-fuzzy-match
;;   (setq helm-recentf-fuzzy-match t)
;;   "Optional fuzzy matching.")

;; (helm-mode 1)
;;; 50_helm.el ends here
