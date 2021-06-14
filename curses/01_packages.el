;;; 01_packages.el --- cursed packages               -*- lexical-binding: t; -*-

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

(require 'straight)

(straight-use-package 'direnv) ;; Direnv integration for Emacs.

;; Project interaction
(straight-use-package 'dashboard)
(straight-use-package 'projectile)
(straight-use-package 'wakatime-mode)

;; Org mode
(straight-use-package 'org)
(straight-use-package 'ob-ammonite) ;; org-babel for scala evaluation in Ammonite.

;; Language Server Protocol
(straight-use-package 'lsp-ui)       ;; Enable nice rendering of documentation on hover.
(straight-use-package 'lsp-mode)     ;; Emacs client/library for the Language Server Protocol.
(straight-use-package 'lsp-metals)   ;; Add metals backend for `lsp-mode`.
(straight-use-package 'lsp-treemacs) ;; Tree View Protocol for viewing the project structure and triggering compilation.

;; Debug Adapter Protocol
(straight-use-package 'posframe) ;; Posframe is a pop-up tool that must be manually installed for dap-mode.
(straight-use-package 'dap-mode) ;; Emacs client/library for Debug Adapter Protocol.

;; Flycheck
(straight-use-package 'flycheck)  ;; Syntax checking for GNU Emacs.

;; Yasnippet
(straight-use-package 'yasnippet) ;; A template system for Emacs.

;; Helm
(straight-use-package 'helm)     ;; Emacs incremental completion and selection narrowing framework.
(straight-use-package 'helm-lsp) ;; Helm lsp integration.

;; Company
(straight-use-package 'company) ;; Modular in-buffer completion framework for Emacs.

;; Version Control System
(straight-use-package 'magit)
(straight-use-package 'diff-hl) ;; Emacs package for highlighting uncommitted changes.

;; Nix
(straight-use-package 'nix-mode)

;; Emacs Lisp
(straight-use-package 'highlight-quoted)      ;; Highlight Lisp quotes and quoted symbols.
(straight-use-package 'highlight-defined)     ;; Highlight known Emacs Lisp symbols.
(straight-use-package 'highlight-parentheses)

;; YAML
(straight-use-package 'yaml-mode)

;; Scala
(straight-use-package 'sbt-mode)
(straight-use-package 'scala-mode)

;; LaTeX
(straight-use-package 'auctex-latexmk)

;; UI
(straight-use-package 'which-key)          ;; Emacs package that displays available keybindings in popup.
(straight-use-package 'ace-window)         ;; Quickly switch windows in Emacs.
(straight-use-package 'ace-jump-mode)      ;; A quick cursor jump mode for Emacs.
(straight-use-package                      ;; A emacs tree plugin like NerdTree for Vim.
 `(neotree :type git :host github
           :repo "jaypei/emacs-neotree"
           :branch "dev"))
(straight-use-package 'reverse-im)         ;; Overrides function-key-map for preferred input-method to translate input sequences
                                           ;; to english, so we can use Emacs bindings while non-default system layout is active.
(straight-use-package 'all-the-icons)      ;; Icons.
(straight-use-package 'smartparens)        ;; Minor mode for Emacs that deals with parens pairs and tries to be smart about it.
(straight-use-package 'rainbow-delimiters) ;; Emacs rainbow delimiters mode.
(straight-use-package 'clean-aindent-mode) ;; Emacs extension for simple indent and unindent.
(straight-use-package                      ;; Display typographical ligatures in Emacs.
 `(ligature :type git :host github
            :repo "mickeynp/ligature.el"
            :branch "master"))

;;; 01_packages.el ends here
