;;; 30_direnv.el --- Support for the direnv integration -*- lexical-binding: t; -*-

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
(require 'direnv)

(when (executable-find "direnv")
  (setq direnv-always-show-summary nil)
  (add-hook 'after-init-hook #'direnv-mode)
  (add-hook 'prog-mode-hook  #'direnv-update-environment))

(provide '30_direnv)
;;; 30_direnv.el ends here
