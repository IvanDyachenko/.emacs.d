;;; 30_latex.el --- Support for the LaTeX language -*- lexical-binding: t; -*-

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

;; 

;;; Code:

(require 'auctex-latexmk)

(setq TeX-PDF-mode t)

(add-hook 'LaTeX-mode-hook
(lambda ()
  (push
   '("latexmk" "latexmk -pdf %s" TeX-run-TeX nil t
     :help "Run latexmk on file")
   TeX-command-list)))

(add-hook 'TeX-mode-hook
          '(lambda () (setq TeX-command-default "latexmk")))

;;(setq TeX-view-program-list
;;      '(("PDF Viewer" "/Applications/Skim.app/Contents/SharedSupport/displayline -b -g %n %o %b")))
;;(setq TeX-view-program-selection
;;      '((output-pdf "PDF Viewer")))

(custom-set-variables
 '(TeX-source-correlate-mode t)
 '(TeX-source-correlate-start-server t)
 '(TeX-source-correlate-method 'synctex))

;;; 30_latex.el ends here
