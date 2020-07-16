;;; cursed-curse.el --- cursed curse                       -*- lexical-binding: t; -*-

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
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;;

;;; Code:

(defvar cursed--curse-directory)

(defvar cursed--ui-directory
  (expand-file-name "ui" cursed--curse-directory)
  "The path to the `ui` directory of the Emacs cursed configuration.")

(defvar cursed--mode-directory
  (expand-file-name "mode" cursed--curse-directory)
  "The path to the `mode` directory of the Emacs cursed configuration.")

;; Add cursed directories to list of directories to search.
;; https://www.emacswiki.org/emacs/LoadPath
(add-to-list 'load-path cursed--ui-directory)
(add-to-list 'load-path cursed--mode-directory)

(require 'cursed-ui)
(require 'cursed-helm)
(require 'cursed-wakatime)
(require 'cursed-projectile)
(require 'cursed-company)
(require 'cursed-flycheck)
(require 'cursed-yasnippet)
(require 'cursed-lsp)
(require 'cursed-mode)

(provide 'cursed-curse)
;;; cursed-curse.el ends here
