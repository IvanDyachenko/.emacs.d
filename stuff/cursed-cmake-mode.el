;;; cursed-cmake-mode.el --- cursed CMake mode       -*- lexical-binding: t; -*-

;; Copyright (C) 2018  Ivan Dyachenko

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

(use-package cmake-mode
  :defer t
  :hook (cmake-mode . (lambda()
                        (progn
                          (setq-local company-idle-delay nil)
                          (setq-local company-dabbrev-code-everywhere t)
                          (setq-local company-backends '(company-cmake
                                                         company-capf
                                                         company-files))))))

(use-package cmake-font-lock
  :commands (cmake-font-lock-activate)
  :hook (cmake-mode . (lambda() (progn
                                  (cmake-font-lock-activate)
                                  (font-lock-refresh-defaults)))))


(provide 'cursed-cmake-mode)
;;; cursed-cmake-mode.el ends here
