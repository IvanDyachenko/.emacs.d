;;; cursed-stuff.el --- cursed stuff                       -*- lexical-binding: t; -*-

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

(tool-bar-mode -1)

(menu-bar-mode -1)

(setq ring-bell-function 'ignore)

(use-package ace-window
  :defer t
  :bind ("M-p" . ace-window))

(use-package ace-jump-mode
  :defer t
  :commands ace-jump-mode	      
  :init				      
  (bind-key "C-c SPC" 'ace-jump-mode))

(use-package helm
  :defer t
  :bind (("M-x" . helm-M-x)
	 ("C-x C-f" . helm-find-files))
  :config
  (helm-mode 1))

(provide 'cursed-stuff)
;;; cursed-stuff.el ends here
