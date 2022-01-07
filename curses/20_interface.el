;;; 20_interface.el --- User interface               -*- lexical-binding: t; -*-

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

;; Emacs package that displays available keybindings in popup.
(straight-use-package 'which-key)
(require 'which-key)

;; A utility package to collect various Icon Fonts and propertize them within Emacs.
(straight-use-package 'all-the-icons)
(require 'all-the-icons)

;; Overrides function-key-map for preferred input-method to translate input
;; sequences to english, so we can use Emacs bindings while non-default
;; system layout is active.
(straight-use-package 'reverse-im)
(require 'reverse-im)

;; Yes/No questions become y/n questions.
(defalias 'yes-or-no-p 'y-or-n-p)

;; Frame set-up.
(when (display-graphic-p)
  (setq frame-title-format "%b")
  (setq frame-resize-pixelwise t)
  (setq frame-inhibit-implied-resize t)
  (setq icon-title-format frame-title-format))

;; Maximize Emacs frame on start-up.
;; References:
;;   - https://emacs.stackexchange.com/a/3008
(add-to-list 'initial-frame-alist '(fullscreen . maximized))
(add-to-list 'default-frame-alist '(fullscreen . fullheight))

;; Reverse video by default:
;; - https://stackoverflow.com/a/19757155/5592388
;;(add-to-list 'default-frame-alist '(reverse . t))
;;(setq initial-frame-alist default-frame-alist)

;; Transparent titlebar.
(when (memq window-system '(mac ns))
  (setq ns-use-proxy-icon nil)
  (setq ns-use-thin-smoothing t)
  (add-to-list 'default-frame-alist '(ns-appearance . dark))
  (add-to-list 'default-frame-alist '(ns-transparent-titlebar . t)))

(setq which-key-idle-delay 0.5)
(which-key-mode)
(which-key-setup-side-window-bottom)

(reverse-im-activate "russian-computer")

;; Themes.
(straight-use-package 'modus-themes)
(load-theme 'modus-operandi t)

;;(straight-use-package 'color-theme-sanityinc-tomorrow)
;;(load-theme 'sanityinc-tomorrow-blue t)

;;(straight-use-package 'acme-theme)
;;(straight-use-package 'acme-theme)

(provide '20_interface)
;;; 20_interface.el ends here