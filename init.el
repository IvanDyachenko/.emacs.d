;;; init.el --- cursed initialization           -*- lexical-binding: t; -*-

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

(defvar cursed--curses-directory
  (expand-file-name "curses" cursed--root-directory)
   "The path to the `curses` directory of the Emacs cursed configuration.")

;; Purely functional package manager.
;; https://github.com/raxod502/straight.el
(defvar bootstrap-version)

(let ((bootstrap-version 5)
      (bootstrap-file (expand-file-name "straight/repos/straight.el/bootstrap.el" cursed--root-directory)))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
                                    'silent
                                    'inhibit-cookies)
        (goto-char (point-max))
        (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

;; `init-loader` is a loader of configuration files.
(straight-use-package 'init-loader)

;; Load configuration files in `curses` directory.
(init-loader-load cursed--curses-directory)

;;; init.el ends here
