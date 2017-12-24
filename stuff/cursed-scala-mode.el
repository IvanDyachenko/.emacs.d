;;; cursed-scala-mode.el --- cursed scala mode       -*- lexical-binding: t; -*-

;; Copyright (C) 2017  Ivan Dyachenko

;; Author: Ivan Dyachenko <ivandyach@ivandyach-osx2>
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

(use-package ensime
  :pin melpa-stable
  :init (setq ensime-startup-notification nil))

(use-package sbt-mode
  :commands (sbt-start sbt-command)
  :hook (sbt-mode . (lambda ()
                      (progn
                        (setq-local comint-use-prompt-regexp nil)
                        (setq-local inhibit-field-text-motion nil))))
  :config
  (substitute-key-definition
   'minibuffer-complete-word
   'self-insert-command
   minibuffer-local-completion-map))

;;
(setq-local comint-use-prompt-regexp nil)
(setq-local inhibit-field-text-motion nil)

(use-package scala-mode
  :interpreter ("scala" . scala-mode))

(provide 'cursed-scala-mode)
;;; cursed-scala-mode.el ends here
