;;; init.el --- cursed configuration           -*- lexical-binding: t; -*-

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

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;(package-initialize)

(defvar cursed--root-directory
  (expand-file-name user-emacs-directory)
  "The path to the `root` directory of the Emacs cursed configuration.")

(defvar cursed--core-directory
  (expand-file-name "core" cursed--root-directory)
  "The path to the `core` directory of the Emacs cursed configuration.")

(defvar cursed--curse-directory
  (expand-file-name "curse" cursed--root-directory)
   "The path to the `curse` directory of the Emacs cursed configuration.")
  
;; Setting up a customization file.
(setq custom-file
      (expand-file-name "custom.el" cursed--root-directory))

(when (file-exists-p custom-file)
  (load custom-file))

;; Add cursed directories to list of directories to search.
;; https://www.emacswiki.org/emacs/LoadPath
(add-to-list 'load-path cursed--core-directory)
(add-to-list 'load-path cursed--curse-directory)

(require 'cursed-core)
(require 'cursed-curse)

(provide 'init)
;;; init.el ends here
