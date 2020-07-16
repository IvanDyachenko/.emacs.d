;;; cursed-lsp.el --- cursed lsp                     -*- lexical-binding: t; -*-

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

(straight-use-package 'lsp-ui)
(straight-use-package 'lsp-mode)
(straight-use-package 'lsp-metals)
(straight-use-package 'lsp-treemacs)

(straight-use-package 'posframe)    ;; Posframe is a pop-up tool that must be manually installed for dap-mode.
(straight-use-package 'dap-mode)    ;; Use the Debug Adapter Protocol for running tests and debugging.
(straight-use-package 'company-lsp) ;; ...

(require 'lsp-ui)       ;; Enable nice rendering of documentation on hover.
(require 'lsp-mode)     ;; Emacs client/library for the Language Server Protocol.
(require 'lsp-metals)   ;; Add metals backend for `lsp-mode`.
(require 'lsp-treemacs) ;; Tree View Protocol for viewing the project structure and triggering compilation.

(require 'dap-mode)     ;; Emacs client/library for Debug Adapter Protocol.
(require 'company-lsp)  ;; Company completion backend for `lsp-mode`.

;; Remap xref-find-{definitions,references}:
(define-key lsp-ui-mode-map [remap xref-find-references]  #'lsp-ui-peek-find-references)
(define-key lsp-ui-mode-map [remap xref-find-definitions] #'lsp-ui-peek-find-definitions)

(setq lsp-ui-peek-enable         t) ;; Enable ‘lsp-ui-peek’.
(setq lsp-ui-peek-show-directory t) ;; Show the directory of files.

;; A window-local jump list dedicated to cross references:
;;(lsp-ui-peek-jump-forward)
;;(lsp-ui-peek-jump-backward)

;; Specifies which package to use for diagnostics.
(setq lsp-diagnostic-package :flycheck)

(add-hook 'lsp-mode-hook #'dap-mode)
(add-hook 'lsp-mode-hook #'dap-ui-mode)
(add-hook 'lsp-mode-hook #'lsp-lens-mode)

(provide 'cursed-lsp)
;;; cursed-lsp.el ends here
