;;; 10_company.el --- cursed Company             -*- lexical-binding: t; -*-

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
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:

;; Modular in-buffer completion framework for Emacs

;;; Code:

(require 'company)

(setq company-echo-delay                0)
(setq company-idle-delay              0.3)
(setq company-tooltip-idle-delay      0.5)
(setq company-tooltip-align-annotations t)
(setq company-require-match        'never)
(setq company-show-numbers              t)
(setq company-minimum-prefix-length     1)
(setq company-selection-wrap-around     t)

(add-to-list 'display-buffer-alist
             '("^\\*company-documentation\\*" . (display-buffer-below-selected)))

;; Use `company-mode' in all buffers.
(add-hook 'after-init-hook 'global-company-mode)

;;; 10_company.el ends here
