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

;; Enable nice rendering of documentation on hover.
(use-package lsp-ui)

;; lsp-mode supports snippets, but in order for them to work you need to use yasnippet.
;; If you don't want to use snippets set lsp-enable-snippet to nil in your lsp-mode settings
;; to avoid odd behavior with snippets and indentation.
(use-package yasnippet)

;; Company completion backend for lsp-mode.
(use-package company-lsp
  :after (:all yasnippet))

(use-package lsp-mode
  :after (:all lsp-ui company-lsp)
  :hook (lsp-mode . lsp-lens-mode)
  :config
  ;; If you prefer flycheck and lsp-ui-flycheck is available.
  (setq lsp-prefer-flymake nil))

;; Emacs client/library for Debug Adapter Protocol is a wire protocol for communication between client and Debug Server.
;; It’s similar to the LSP but provides integration with debug server.
(use-package dap-mode
  :hook ((lsp-mode . dap-mode)
         (lsp-mode . dap-ui-mode)))

;; Use the Tree View Protocol for viewing the project structure and triggering compilation
 (use-package lsp-treemacs
   :bind (:map prog-mode-map
               ("C-x t t" . lsp-metals-treeview)
               ("C-x t s" . lsp-treemacs-symbols)
               ("C-x t e" . lsp-treemacs-errors-list))
   ;; When true will automatically display the treeview when Metals has initialised the project
   ;; and sent the initial top level treeview information.
   :config
   (lsp-metals-treeview-enable t)
   (setq lsp-metals-treeview-show-when-views-received t))

(provide 'cursed-lsp)
;;; cursed-lsp.el ends here
