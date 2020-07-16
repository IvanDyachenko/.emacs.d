;;; cursed-ui.el --- cursed UI                       -*- lexical-binding: t; -*-

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
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; 


;;; Code:

(tool-bar-mode                    -1) ;; Turn off toolbar.
(menu-bar-mode                    -1) ;; Turn off menubar.
(scroll-bar-mode                  -1) ;; Turn off scrollbar.
(blink-cursor-mode                -1) ;; Turn off blink.
(column-number-mode                1) ;; Show column number.
;;(global-hl-line-mode             1) ;; Highlight current line.
(global-display-line-numbers-mode  t) ;; Show line number.

(setq
 frame-title-format             "%b"  ;; ...
 frame-resize-pixelwise            t  ;; Fully maximize frames.
 visible-bell                      t  ;; Turn off sound.
 ring-bell-function          'ignore  ;;
 inhibit-splash-screen             t  ;; Don't display a splash screen on startup.
 inhibit-startup-screen            t  ;; Don't show startup screen.
 inhibit-startup-message           t  ;; Don't show startup message.
 inhibit-startup-echo-area-message t  ;; ...
 initial-scratch-message         nil  ;; Don't insert instructions in the *scratch* buffer.
 mouse-wheel-progressive-speed   nil) ;; Don't accelerate scrolling.
;;widget-image-enable            nil) ;; Disable ugly button for checkboxes.

;; Transparent titlebar.
(when (memq window-system '(mac ns))
  (add-to-list 'default-frame-alist '(ns-appearance . light))
  (add-to-list 'default-frame-alist '(ns-transparent-titlebar . t)))

;; Yes/no questions become y/n questions.
(defalias 'yes-or-no-p 'y-or-n-p)

;; Use space instead of tabs when indenting.
(setq-default indent-tabs-mode nil)

(require 'straight)

(straight-use-package 'which-key)          ;; Emacs package that displays available keybindings in popup.
(straight-use-package 'ace-window)         ;; Quickly switch windows in Emacs.
(straight-use-package 'ace-jump-mode)      ;; A quick cursor jump mode for Emacs.
(straight-use-package 'neotree)            ;; A emacs tree plugin like NerdTree for Vim.
(straight-use-package 'powerline)          ;; Emacs powerline.
(straight-use-package 'reverse-im)         ;; Overrides function-key-map for preferred input-method to translate input sequences
                                           ;; to english, so we can use Emacs bindings while non-default system layout is active.
(straight-use-package 'smartparens)        ;; Minor mode for Emacs that deals with parens pairs and tries to be smart about it.
(straight-use-package 'all-the-icons)      ;; Icons.
(straight-use-package 'rainbow-delimiters) ;; Emacs rainbow delimiters mode.
(straight-use-package 'clean-aindent-mode) ;; Emacs extension for simple indent and unindent.

(require 'which-key)
(require 'ace-window)
(require 'ace-jump-mode)
(require 'neotree)
(require 'powerline)
(require 'reverse-im)
(require 'smartparens)
(require 'all-the-icons)
(require 'rainbow-delimiters)

(global-set-key        (kbd "M-o")     'ace-window)
(global-set-key        (kbd "C-c SPC") 'ace-jump-mode)
(global-set-key        (kbd "C-x C-n") 'neotree-toggle)
(define-key global-map (kbd "RET")     'newline-and-indent)

(add-hook 'prog-mode-hook #'smartparens-mode)
(add-hook 'prog-mode-hook #'clean-aindent-mode)
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

(which-key-setup-minibuffer) ;; Show on right if there's enough space, on bottom otherwise.
(setq which-key-idle-delay 0.5)

(setq neo-smart-open t)
(setq neo-window-width 40)
(setq neo-window-position 'right)
(setq neo-theme (if (display-graphic-p) 'icons 'arrow))

(setq aw-dispatch-always t)

(reverse-im-activate "russian-computer")

(powerline-center-theme)

(provide 'cursed-ui)
;;; cursed-ui.el ends here
