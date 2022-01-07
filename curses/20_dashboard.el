;;; 20_dashboard.el --- Support for Dashboard -*- lexical-binding: t; -*-

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

;; An extensible Emacs dashboard.
(straight-use-package 'dashboard)
(require 'dashboard)

(setq dashboard-banner-logo-title "Welcome to Emacs Dashboard")

(setq dashboard-set-file-icons    t)
(setq dashboard-set-heading-icons t)
(setq dashboard-show-shortcuts  nil)
(setq dashboard-items '((agenda    .  5)
                        (recents   . 10)
                        (projects  . 10)
                        (bookmarks .  5)
                        (registers .  5)))

(setq initial-buffer-choice
      (lambda () (get-buffer "*dashboard*")))

(dashboard-setup-startup-hook)

(provide '20_dashboard)
;;; 20_dashboard.el ends here
