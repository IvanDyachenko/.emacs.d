;;; 30_scala.el --- Support for the Scala language -*- lexical-binding: t; -*-

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

(require 'lsp)
(require 'scala-mode)

;; Enable scala-mode for highlighting, indentation and motion commands.
(add-to-list 'auto-mode-alist
             '("\\.s\\(cala\\|bt\\)$" . scala-mode))

;; Turn auto-fill-mode only for code comments.
;; https://stackoverflow.com/a/4477930/5592388
(add-hook 'scala-mode-hook
          (lambda()
            (setq-local comment-auto-fill-only-comments t)
            (auto-fill-mode 1)))

;; https://stackoverflow.com/questions/1627645/emacs-newline-and-indent-in-scala-mode
(add-hook 'scala-mode-hook
          (lambda () (local-set-key (kbd "RET") 'reindent-then-newline-and-indent)))

;; Enable lsp-mode automatically in scala files.
(add-hook 'scala-mode-hook #'lsp)

;;(unless (fboundp 'sbt-start)
;;  (autoload 'sbt-start "sbt-mode" nil t))
;;(unless (fboundp 'sbt-command)
;;  (autoload 'sbt-command "sbt-mode" nil t))

;; Allows using SPACE when in the minibuffer.
;; WORKAROUND: https://github.com/ensime/emacs-sbt-mode/issues/31
(substitute-key-definition 'minibuffer-complete-word
                           'self-insert-command
                           minibuffer-local-completion-map)

;; sbt-supershell kills sbt-mode:
;; WORKAROUND: https://github.com/hvesalai/emacs-sbt-mode/issues/152
(setq sbt:program-options '("-Dsbt.supershell=false")
      sbt:prefer-nested-projects t)

;;; 30_scala.el ends here
