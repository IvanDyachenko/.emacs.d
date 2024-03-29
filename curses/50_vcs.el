;;; 50_vcs.el --- Support for Version Control Systems  -*- lexical-binding: t; -*-

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
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; 

;;; Code:
(require 'straight)

;; Treat undo history as a tree.
(straight-use-package 'undo-tree)
(require 'undo-tree)

(straight-use-package 'magit)
(require 'magit)

;; Show source files' TODOs (and FIXMEs, etc) in Magit status buffer.
;;(straight-use-package 'magit-todos)
;;(require 'magit-todos)

;; Emacs package for highlighting uncommitted changes.
(straight-use-package 'diff-hl)
(require 'diff-hl)

(require '00_files)

(global-set-key (kbd "C-x g") 'magit-status)

;; Replace the standard Emacs' undo system with the `undo-tree-mode' system in all buffers.
(global-undo-tree-mode)

(setq undo-tree-auto-save-history t) ;; Automatically save and restore undo-tree history along with buffer.
(setq undo-tree-history-directory-alist `(("." . ,cursed--backup-directory)))

(setq undo-tree-visualizer-diff                t) ;; Show diffs when browsing through the undo tree.
(setq undo-tree-visualizer-timestamps          t) ;; Show relative times in the undo tree visualizer.
(setq undo-tree-visualizer-relative-timestamps t)

(global-diff-hl-mode)
(add-hook 'magit-pre-refresh-hook  #'diff-hl-magit-pre-refresh)
(add-hook 'magit-post-refresh-hook #'diff-hl-magit-post-refresh)

;; Activate `magit-todos-mode', which automatically inserts the to-do list in Magit status buffers.
;;(magit-todos-mode)
;;; 50_vcs.el ends here
