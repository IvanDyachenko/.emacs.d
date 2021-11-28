;;; 10_packages.el --- List of packages to be installed at Emacs startup -*- lexical-binding: t; -*-

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
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:

;; List of packages to be installed at Emacs startup.

;;; Code:
(require 'straight)

(straight-use-package 'smartparens) ;; Deals with parens pairs and tries to be smart about it.
(straight-use-package 'clean-aindent-mode) ;; Emacs extension for simple indent and unindent.
(straight-use-package 'rainbow-delimiters) ;; Highlights delimiters such as parentheses, brackets or braces according to their depth.
(straight-use-package 'color-identifiers-mode) ;; Highlights each source code identifier uniquely based on its name.
(straight-use-package 'direnv) ;; Direnv integration for Emacs.
(straight-use-package 'which-key) ;; Emacs package that displays available keybindings in popup.
(straight-use-package 'reverse-im) ;; Overrides function-key-map for preferred input-method to translate input sequences
                                   ;; to english, so we can use Emacs bindings while non-default system layout is active.
(straight-use-package 'ace-window) ;; Quickly switches windows in Emacs.
(straight-use-package 'ace-jump-mode) ;; A quick cursor jump mode for Emacs.
(straight-use-package `(ligature :type git :host github :repo "mickeynp/ligature.el" :branch "master")) ;; Display typographical ligatures in Emacs.
(straight-use-package 'dashboard)
(straight-use-package 'projectile)
(straight-use-package 'wakatime-mode)
(straight-use-package 'all-the-icons)
(straight-use-package `(neotree :type git :host github :repo "jaypei/emacs-neotree" :branch "dev")) ;; A emacs tree plugin like NerdTree for Vim.

;; Completion Framework
(straight-use-package 'orderless) ;; This package provides an orderless completion style that divides the
                                  ;; pattern into space-separated components, and matches candidates that
                                  ;; match all of the components in any order.
(straight-use-package 'consult) ;; Consult provides practical commands based on the Emacs completion function completing-read.
(straight-use-package 'vertico) ;; Vertico provides a performant and minimalistic vertical completion UI
                                ;; based on the default completion system.
(straight-use-package 'marginalia) ;; This package provides marginalia-mode which adds marginalia to the minibuffer completions.
(straight-use-package 'flycheck)
(straight-use-package 'consult-flycheck)
(straight-use-package 'company) ;; Modular in-buffer completion framework for Emacs.
(straight-use-package 'consult-company)

;; Language Server Protocol (LSP)
(straight-use-package 'lsp-ui) ;; Enable nice rendering of documentation on hover.
(straight-use-package 'lsp-mode) ;; Emacs client/library for the Language Server Protocol.
(straight-use-package 'lsp-metals) ;; Add metals backend for `lsp-mode`.
(straight-use-package 'lsp-treemacs) ;; Tree View Protocol for viewing the project structure and triggering compilation.
(straight-use-package 'consult-lsp)
(straight-use-package 'posframe) ;; Posframe is a pop-up tool that must be manually installed for dap-mode.
(straight-use-package 'dap-mode) ;; Emacs client/library for Debug Adapter Protocol.

(straight-use-package 'undo-tree)   ;; Treat undo history as a tree.

(straight-use-package 'magit)
(straight-use-package 'magit-todos) ;; Show source files' TODOs (and FIXMEs, etc) in Magit status buffer.
(straight-use-package 'diff-hl) ;; Emacs package for highlighting uncommitted changes.

(straight-use-package 'yasnippet) ;; A template system for Emacs.

;; Org mode
(straight-use-package 'org)

;; Nix
(straight-use-package 'nix-mode)

;; Emacs Lisp
(straight-use-package 'highlight-quoted) ;; Highlight Lisp quotes and quoted symbols.
(straight-use-package 'highlight-defined) ;; Highlight known Emacs Lisp symbols.
(straight-use-package 'highlight-parentheses)

;; YAML
(straight-use-package 'yaml-mode)

;; Scala
(straight-use-package 'sbt-mode)
(straight-use-package 'scala-mode)

;; LaTeX
(straight-use-package 'auctex-latexmk)

;; Themes
(straight-use-package 'acme-theme)
(straight-use-package 'color-theme-sanityinc-tomorrow)

;;; 10_packages.el ends here
