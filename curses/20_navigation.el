;;; 20_navigation.el --- Productive navigation       -*- lexical-binding: t; -*-

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

;; 

;;; Code:
(require 'straight)

;; Winner Mode is a global minor mode that allows you to “undo” and
;; “redo” changes in window configuration.
(winner-mode 1)

;; Make Emacs display the current column number.
(setq column-number-mode 1)

(require 'dired)

(setq dired-dwim-target t) ;; Split your window and open another dired buffer on the other window.
(setq dired-listing-switches "-AFhlv")

(add-hook 'dired-mode-hook #'hl-line-mode)
(add-hook 'dired-mode-hook #'dired-hide-details-mode)

;; Quickly switches windows in Emacs.
(straight-use-package 'ace-window)
(require 'ace-window)

(setq aw-dispatch-always t)

(global-set-key (kbd "M-o") 'ace-window)

;; A quick cursor jump mode for Emacs.
(straight-use-package 'ace-jump-mode)
(require 'ace-jump-mode)

(global-set-key (kbd "C-c SPC") 'ace-jump-mode)

;; An implementation of Powerline for Emacs.
;;(straight-use-package 'telephone-line)
;;(require 'telephone-line)

;;(telephone-line-mode 1)

;; Tree-style navigation in the current dired buffer.
(straight-use-package 'dired-subtree)
(require 'dired-subtree)

(setq dired-subtree-use-backgrounds nil)

(let ((map dired-mode-map))
  (define-key map (kbd "<tab>")     #'dired-subtree-toggle)
  (define-key map (kbd "<backtab>") #'dired-subtree-cycle))

(when (equal system-type 'darwin)
  (setq dired-use-ls-dired nil))

;; An Emacs tree plugin like NerdTree for Vim.
;; (straight-use-package
;;  `(neotree :type git
;;           :host github
;;           :repo "jaypei/emacs-neotree"
;;           :branch "dev"))
;; (require 'neotree)

;; (global-set-key (kbd "C-x C-n") 'neotree-toggle)

;; (setq neo-show-hidden-files    t)
;; (setq neo-smart-open           t)
;; (setq neo-window-width        40)
;; (setq neo-window-position 'right)
;;
;; (defun cursed--frame-setup (frame)
;;   "A workaround for missing `all-the-icons' in `neotree' when starting Emacs in client mode.
;; References:
;;   - https://github.com/jaypei/emacs-neotree/issues/194
;;   - https://emacs.stackexchange.com/questions/24609/determine-graphical-display-on-startup-for-emacs-server-client"
;;   (if (display-graphic-p frame)
;;       (setq neo-theme 'icons)))
;; (mapc 'cursed--frame-setup (frame-list)) ;; Run for already-existing frames (for single instance Emacs).
;; (add-hook 'after-make-frame-functions 'cursed--frame-setup) ;; Run when a new frame is created (for Emacs in client/server mode).

(provide '20_navigation)
;;; 20_navigation.el ends here
