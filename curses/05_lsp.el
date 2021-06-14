;;; 05_lsp.el --- cursed lsp                     -*- lexical-binding: t; -*-

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

(require 'lsp-ui)
(require 'dap-mode)

;; Remap xref-find-{definitions,references}:
(define-key lsp-ui-mode-map [remap xref-find-references]  #'lsp-ui-peek-find-references)
(define-key lsp-ui-mode-map [remap xref-find-definitions] #'lsp-ui-peek-find-definitions)

(setq lsp-ui-doc-enable         nil) ;; Disable `lsp-ui-doc'.
(setq lsp-ui-doc-position 'at-point)

(setq lsp-ui-peek-enable         t) ;; Enable `lsp-ui-peek'.
(setq lsp-ui-peek-show-directory t) ;; Show the directory of files.
;; A window-local jump list dedicated to cross references:
;;(lsp-ui-peek-jump-forward)
;;(lsp-ui-peek-jump-backward)

(setq lsp-ui-sideline-enable            t) ;; Enable `lsp-ui-sideline'.
(setq lsp-ui-sideline-show-hover        t) ;; Show hover messages in sideline.
(setq lsp-ui-sideline-show-code-actions t) ;; Show code actions in sideline.

(setq lsp-completion-enable       t) ;; Enable `completion-at-point' integration.
(setq lsp-completion-provider :capf) ;; Use `company-capf' as the completion backend provider.

;; Specifies which package to use for diagnostics.
(setq lsp-diagnostics-provider :flycheck)

;; Uncomment following section if you would like to tune lsp-mode performance
;; according to https://emacs-lsp.github.io/lsp-mode/page/performance/
(setq lsp-idle-delay 0.500) ;; This variable determines how often lsp-mode will refresh
                            ;; the highlights, lenses, links, etc while you type.
(setq lsp-log-io       nil) ;; If set to true can cause a performance hit.

(add-hook 'lsp-mode-hook #'dap-mode)
(add-hook 'lsp-mode-hook #'lsp-ui-mode)
(add-hook 'lsp-mode-hook #'lsp-lens-mode)

;;; 05_lsp.el ends here
