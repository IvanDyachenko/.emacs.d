;;; cursed-scala.el --- cursed scala mode       -*- lexical-binding: t; -*-

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

(require 'straight)

(require 'lsp-mode)
(require 'lsp-metals)

(straight-use-package 'sbt-mode)
(straight-use-package 'scala-mode)

(require 'scala-mode)

;; Enable lsp-mode automatically in scala files.
(add-hook 'scala-mode-hook #'lsp)
(add-to-list 'auto-mode-alist '("\\.s\\(cala\\|bt\\)$" . scala-mode))

(unless (fboundp 'sbt-start)
  (autoload 'sbt-start "sbt-mode" nil t))
(unless (fboundp 'sbt-command)
  (autoload 'sbt-command "sbt-mode" nil t))

;; Allows using SPACE when in the minibuffer.
;; WORKAROUND: https://github.com/ensime/emacs-sbt-mode/issues/31
(substitute-key-definition 'minibuffer-complete-word
                           'self-insert-command
                           minibuffer-local-completion-map)

;; sbt-supershell kills sbt-mode:
;; WORKAROUND: https://github.com/hvesalai/emacs-sbt-mode/issues/152
(setq sbt:program-options '("-Dsbt.supershell=false")
      sbt:prefer-nested-projects t)

(provide 'cursed-scala)
;;; cursed-scala.el ends here
