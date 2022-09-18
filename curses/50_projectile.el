;;; 50_projectile.el --- Support for Projectile Mode -*- lexical-binding: t; -*-

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

;; 

;;; Code:
(require 'straight)

(straight-use-package 'projectile)
(require 'projectile)

(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

(straight-use-package
 `(consult-projectile :type git
                      :host gitlab
                      :repo  "OlMon/consult-projectile"
                      :branch "master"))
(require 'consult)
(require 'consult-projectile)

(autoload 'projectile-project-root "projectile")
(setq consult-project-root-function #'projectile-project-root)
(define-key projectile-mode-map [remap projectile-find-file] #'consult-projectile)

;; Once you have selected your project, the top-level directory of the
;; project is immediately opened for you in a dired buffer.
(setq projectile-switch-project-action #'projectile-dired)

(projectile-mode +1)
;;; 50_projectile.el ends here
