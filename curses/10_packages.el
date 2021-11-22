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

;; Project interaction
(straight-use-package 'dashboard)
(straight-use-package 'projectile)
(straight-use-package 'wakatime-mode)

;; Completion frameworks
(straight-use-package 'orderless) ;; This package provides an orderless completion style that divides the
                                  ;; pattern into space-separated components, and matches candidates that
                                  ;; match all of the components in any order.
(straight-use-package 'consult) ;; Consult provides practical commands based on the Emacs completion function completing-read.
(straight-use-package 'vertico) ;; Vertico provides a performant and minimalistic vertical completion UI
                                ;; based on the default completion system.
(straight-use-package 'marginalia) ;; This package provides marginalia-mode which adds marginalia to the minibuffer completions.

;; Helm
;;(straight-use-package 'helm)     ;; Emacs incremental completion and selection narrowing framework.
;;(straight-use-package 'helm-lsp) ;; Helm lsp integration.

;; Company
(straight-use-package 'company) ;; Modular in-buffer completion framework for Emacs.
(straight-use-package 'consult-company)

;; Language Server Protocol (LSP)
(straight-use-package 'lsp-ui)       ;; Enable nice rendering of documentation on hover.
(straight-use-package 'lsp-mode)     ;; Emacs client/library for the Language Server Protocol.
(straight-use-package 'lsp-metals)   ;; Add metals backend for `lsp-mode`.
(straight-use-package 'lsp-treemacs) ;; Tree View Protocol for viewing the project structure and triggering compilation.
(straight-use-package 'consult-lsp)

;; Debug Adapter Protocol
(straight-use-package 'posframe) ;; Posframe is a pop-up tool that must be manually installed for dap-mode.
(straight-use-package 'dap-mode) ;; Emacs client/library for Debug Adapter Protocol.

;; Flycheck
(straight-use-package 'flycheck)  ;; Syntax checking for GNU Emacs.
(straight-use-package 'consult-flycheck)

;; Yasnippet
(straight-use-package 'yasnippet) ;; A template system for Emacs.

;; Version Control System
(straight-use-package 'undo-tree)   ;; Treat undo history as a tree.
(straight-use-package 'magit)       ;;
(straight-use-package 'magit-todos) ;; Show source files' TODOs (and FIXMEs, etc) in Magit status buffer.
(straight-use-package 'diff-hl)     ;; Emacs package for highlighting uncommitted changes.

;; Org mode
(straight-use-package 'org)

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
(straight-use-package 'which-key)     ;; Emacs package that displays available keybindings in popup.
(straight-use-package 'ace-window)    ;; Quickly switch windows in Emacs.
(straight-use-package 'ace-jump-mode) ;; A quick cursor jump mode for Emacs.
(straight-use-package                 ;; A emacs tree plugin like NerdTree for Vim.
 `(neotree :type git :host github
           :repo "jaypei/emacs-neotree"
           :branch "dev"))
(straight-use-package 'reverse-im) ;; Overrides function-key-map for preferred input-method to translate input sequences
                                   ;; to english, so we can use Emacs bindings while non-default system layout is active.



(straight-use-package 'all-the-icons)      ;; Icons.
(straight-use-package                      ;; Display typographical ligatures in Emacs.
 `(ligature :type git :host github
            :repo "mickeynp/ligature.el"
            :branch "master"))


;; Themes
(straight-use-package 'color-theme-sanityinc-tomorrow)

;;; 10_packages.el ends here
