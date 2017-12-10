;;; init.el --- Emacs cursed configuration           -*- lexical-binding: t; -*-

;; Copyright (C) 2017  Ivan Dyachenko

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

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;(package-initialize)

(setq load-prefer-newer t)

(defvar cursed-dir (expand-file-name user-emacs-directory)
  "The path to the root directory of the Emacs cursed configuration")

(defvar cursed-core-dir (expand-file-name "core" cursed-dir)
  "The path to the core directory of the Emacs cursed configuration")

(defvar cursed-stuff-dir (expand-file-name "stuff" cursed-dir)
  "The path to the stuff directory of the Emacs cursed configuration")

(setq custom-file (expand-file-name "custom.el" cursed-dir))
(load custom-file)

;; Add cursed directories to Emacs 'load-path
(add-to-list 'load-path cursed-core-dir)
(add-to-list 'load-path cursed-stuff-dir)

;; The core loading
(require 'cursed-core)

;; The cursed stuff loading
(require 'cursed-stuff)

(provide 'init)
;;; init.el ends here
