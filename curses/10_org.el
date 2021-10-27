;;; 10_org.el --- Support for Org Mode -*- lexical-binding: t; -*-

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

;;(require 'org)

;;(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))

;;(global-set-key (kbd "C-c a") 'org-agenda)
;;(global-set-key (kbd "C-c c") 'org-capture)
;;(global-set-key (kbd "C-c l") 'org-store-link)

;;(setq org-agenda-files '("~/Yandex.Disk.localized/org/"))
;;(setq org-agenda-skip-unavailable-files                t)

;; How do I turn on auto-fill-mode by default?
;; https://www.gnu.org/software/emacs/manual/html_node/efaq/Turning-on-auto_002dfill-by-default.html
;;(add-hook 'org-mode-hook '(lambda () (setq fill-column 100)))
;;(add-hook 'org-mode-hook 'turn-on-auto-fill)
;;(add-hook 'org-mode-hook
;;          '(lambda()
;;             (require 'ob-ammonite)
;;             (setq ob-ammonite-prompt-str "scala>")
;;             (org-babel-do-load-languages 'org-babel-load-languages '((shell      . t)
;;                                                                      (ditaa      . t)
;;                                                                      (plantuml   . t)
;;;;                                                                    (scala      . t)
;;                                                                      (ammonite   . t)
;;                                                                      (emacs-lisp . t)))))

;;; 10_org.el ends here
