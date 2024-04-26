;;; 90_rust.el --- Support for the Rust language     -*- lexical-binding: t; -*-

;; Copyright (C) 2022  Ivan Dyachenko

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

;; Rust development environment for Emacs.
(straight-use-package 'rustic)

(require 'rustic)
(require 'lsp-rust)

(setq rustic-lsp-client 'lsp-mode)
(setq rustic-enable-detached-file-support t)

(add-hook 'rustic-mode-hook #'lsp-rust-analyzer-inlay-hints-mode)

(provide '90_rust)
;;; 90_rust.el ends here
