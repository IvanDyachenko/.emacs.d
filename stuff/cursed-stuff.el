;;; cursed-stuff.el --- cursed stuff                       -*- lexical-binding: t; -*-

;; Copyright (C) 2017  Ivan Dyachenko

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
(use-package helm
  :defer t
  :bind (("M-x" . helm-M-x)
	 ("C-x C-f" . helm-find-files)
         ("C-x b" . helm-buffers-list))
  :config
  (helm-mode))

(use-package yasnippet
  :config
  ;; Adding yasnippet support to company
  (yas-global-mode 1))

(use-package company
  :hook (prog-mode . company-mode)
  :config
  (global-company-mode))

(use-package projectile
  :ensure t
  :pin melpa-stable
  :config
  (define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
  (projectile-mode +1))

;; Syntax checking for GNU Emacs.
;; Enable nice rendering of diagnostics like compile errors.
(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))

(use-package wakatime-mode
  :init (global-wakatime-mode))

(use-package vlf
  :config
  (require 'vlf-setup)) 

(require 'cursed-ui)
(require 'cursed-vcs)
(require 'cursed-lsp)
(require 'cursed-org-mode)
(require 'cursed-yaml-mode)
(require 'cursed-json-mode)
(require 'cursed-scala-mode)
(require 'cursed-docker-mode)
(require 'cursed-markdown-mode)
(require 'cursed-emacs-lisp-mode)

(provide 'cursed-stuff)
;;; cursed-stuff.el ends here
