;;; cursed-docker-mode.el --- cursed Docker               -*- lexical-binding: t; -*-

;; Copyright (C) 2019  Ivan Dyachenko

;; Author: Ivan Dyachenko <vandyachen@gmail.com>
;; Keywords: abbrev

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

(use-package docker
  :defer t
  :bind ("C-c d" . docker))

(use-package dockerfile-mode
  :mode ("^Dockerfile$" . dockerfile-mode))

(use-package docker-compose-mode
  :mode ("^docker-compose.y" . docker-compose-mode))

(provide 'cursed-docker-mode)
;;; cursed-docker.el ends here
