;;; 20_ui.el --- User interface configuration -*- lexical-binding: t; -*-

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
(require 'which-key)

(require 'ace-window)
(require 'ace-jump-mode)

(require 'neotree)
(require 'reverse-im)
(require 'all-the-icons)
(require 'clean-aindent-mode)

;; Transparent titlebar.
(when (memq window-system '(mac ns))
  (setq ns-use-proxy-icon nil)
  (setq ns-use-thin-smoothing t)
  (add-to-list 'default-frame-alist '(ns-appearance . dark))
  (add-to-list 'default-frame-alist '(ns-transparent-titlebar . t)))

(global-set-key        (kbd "M-o")     'ace-window)
(global-set-key        (kbd "C-c SPC") 'ace-jump-mode)
(global-set-key        (kbd "C-x C-n") 'neotree-toggle)
(define-key global-map (kbd "RET")     'newline-and-indent)

(which-key-mode)
(which-key-setup-side-window-bottom)

(setq which-key-idle-delay   0.5)
(setq aw-dispatch-always       t)
(setq neo-smart-open           t)
(setq neo-window-width        40)
(setq neo-window-position 'right)

(defun new-frame-setup (frame)
  "A workaround for missing `all-the-icons' in `neotree' when starting Emacs in client mode.
References:
  - https://github.com/jaypei/emacs-neotree/issues/194
  - https://emacs.stackexchange.com/questions/24609/determine-graphical-display-on-startup-for-emacs-server-client"
  (if (display-graphic-p frame)
      (setq neo-theme 'icons)))

(mapc 'new-frame-setup (frame-list))                    ;; Run for already-existing frames (for single instance Emacs).
(add-hook 'after-make-frame-functions 'new-frame-setup) ;; Run when a new frame is created (for Emacs in client/server mode).

(reverse-im-activate "russian-computer")

(load-theme 'sanityinc-tomorrow-blue t)
;;; 20_ui.el ends here
