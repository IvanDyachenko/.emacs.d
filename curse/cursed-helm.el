;;; cursed-helm.el --- cursed Helm                   -*- lexical-binding: t; -*-

;; Copyright (C) 2020  Ivan Dyachenko

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

(require 'straight)

(straight-use-package 'helm)

(require 'helm)
(require 'helm-config)

(global-set-key (kbd "M-x")     'helm-M-x)
(global-set-key (kbd "C-x b")   'helm-mini)
(global-set-key (kbd "C-x C-f") 'helm-find-files)

(defvar helm-M-x-fuzzy-match
  (setq helm-M-x-fuzzy-match t)
  "Optional fuzzy matching.")

(defvar helm-buffers-fuzzy-matching
  (setq helm-buffers-fuzzy-matching t)
  "Optional fuzzy matching.")

(defvar helm-recentf-fuzzy-match
  (setq helm-recentf-fuzzy-match t)
  "Optional fuzzy matching.")

(helm-mode 1)

(provide 'cursed-helm)
;;; cursed-helm.el ends here
