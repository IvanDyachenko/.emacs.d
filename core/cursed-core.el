;;; cursed-core.el --- cursed core                   -*- lexical-binding: t; -*-

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

(require 'cursed-file)
(require 'cursed-package)

(require 'straight)

(straight-use-package 'esup)
(straight-use-package 'exec-path-from-shell)

;;(autoload 'esup "esup" "Emacs Start Up Profiler." nil)

(require 'exec-path-from-shell)
(exec-path-from-shell-initialize)

(provide 'cursed-core)
;;; cursed-core.el ends here
