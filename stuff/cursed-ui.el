;;; cursed-ui.el --- cursed ui                       -*- lexical-binding: t; -*-

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

;; Don't show startup screen
(setq inhibit-startup-screen t)

;; Don't show startup message
(setq inhibit-startup-message t)

;; Don't display a splash screen on startup
(setq inhibit-splash-screen t)

;; Don't insert instructions in the *scratch* buffer
(setq initial-scratch-message "")

;; Turn off toolbar
(tool-bar-mode -1)

;; Turn off menubar
(menu-bar-mode -1)

;; Turn off scrollbar
(scroll-bar-mode -1)

;; Turn off ring bell
(setq ring-bell-function 'ignore)

;;
(set-face-attribute 'default nil :height 120)

;; Load challenger deep theme
(use-package challenger-deep-theme) 

;; Load sanityinc tomorrow theme
;; (use-package color-theme-sanityinc-tomorrow
;;   :config
;;   (color-theme-sanityinc-tomorrow-night))

;; Load darktooth theme
;; (use-package darktooth-theme)

;; Load gruvbox theme
;; (use-package gruvbox-theme
;;   :config
;;   (load-theme 'gruvbox-dark-hard t))

;; Load base16 theme
;; (use-package base16-theme
;;   :config
;;   (load-theme 'base16-default-dark t))

;; Load dracula theme
;; (use-package dracula-theme
;;   :config
;;   (load-theme 'dracula t))

;; Load grayscale theme
;; (use-package grayscale-theme)

;; Use space instead of tabs when indenting
(setq-default indent-tabs-mode nil)

;; Turn off global line numbering
(use-package linum-off)

;; Show line numbers in the margin
(use-package nlinum
  :after linum-off
  :config
  (setq nlinum-relative-redisplay-delay 0)
  (setq nlinum-format "%4d ")
  (setq nlinum-highlight-current-line t)
  (global-nlinum-mode))

(use-package rainbow-delimiters
  :defer t
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package rainbow-mode
  :defer t
  :hook (prog-mode . rainbow-mode))

(use-package ace-window
  :defer t
  :bind ("M-o" . ace-window)
  :config
  (setq aw-dispatch-always t))

(use-package ace-jump-mode
  :defer t
  :commands ace-jump-mode	      
  :init				      
  (bind-key "C-c SPC" 'ace-jump-mode))

;; (edit) aggresive-indent
(use-package aggressive-indent
  :diminish aggressive-indent-mode
  :hook (emacs-lisp-mode . aggressive-indent-mode))

;; clean-aindent-mode
(use-package clean-aindent-mode
  :hook (prog-mode))

;; Overrides function-key-map for preferred input-method to translate input sequences to english, so we can use Emacs bindings while non-default system layout is active
(use-package reverse-im
  :config
  (reverse-im-activate "russian-computer"))

(provide 'cursed-ui)
;;; cursed-ui.el ends here
