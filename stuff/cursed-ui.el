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

(global-auto-revert-mode 1)

;; No sound
(setq visible-bell t)
(setq ring-bell-function 'ignore)

;; Don't show startup screen
(setq inhibit-startup-screen t)

;; Don't display a splash screen on startup
(setq inhibit-splash-screen t)

;; Don't show startup message
(setq inhibit-startup-message t)

;; Don't insert instructions in the *scratch* buffer
(setq initial-scratch-message nil)

(setq inhibit-startup-echo-area-message t)

;; Overrides function-key-map for preferred input-method to translate input sequences to english,
;; so we can use Emacs bindings while non-default system layout is active
(use-package reverse-im
  :config
  (reverse-im-activate "russian-computer"))

;; Turn off toolbar
(tool-bar-mode -1)

;; Turn off menubar
(menu-bar-mode -1)

;; Turn off scrollbar
(scroll-bar-mode -1)

;; No blink
(blink-cursor-mode -1)

;; Show column number
(column-number-mode 1)

;; No ugly button for checkboxes
(setq widget-image-enable nil)

;; yes/no questions become y/n questions
(defalias 'yes-or-no-p 'y-or-n-p)

;; Don't accelerate scrolling
(setq mouse-wheel-progressive-speed nil)

;; Use space instead of tabs when indenting
(setq-default indent-tabs-mode nil)

(setq frame-title-format "%b")

;; https://github.com/syl20bnr/spacemacs/issues/5633
(setq frame-resize-pixelwise t)

;; No fringe but nice glyphs for truncated and wrapped lines
(fringe-mode '(0 . 0))

;; Icons
(use-package all-the-icons)

;; Use the Debug Adapter Protocol for running tests and debugging
(use-package posframe
  ;; Posframe is a pop-up tool that must be manually installed for dap-mode
  )

;; Turn off global line numbering
(use-package linum-off)

;; Show line numbers in the margin
(use-package nlinum
  :after linum-off
  :config
  (setq nlinum-format "%4d ")
  (setq nlinum-highlight-current-line t)
  (global-nlinum-mode))

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

;;(use-package treemacs
;;  :defer t
;;  :config
;;  (progn
;;    (setq treemacs-width                         40
;;          treemacs-resize-icons                  0
;;          treemacs-position                      'right
;;          treemacs-directory-name-transformer    #'identity
;;          ;treemacs-follow-after-init             t
;;          treemacs-no-png-images                 t
;;          treemacs-show-cursor                   t
;;          treemacs-space-between-root-nodes      t
;;          treemacs-user-mode-line-format         nil)
;;
;;    ;; The default width and height of the icons is 22 pixels. If you are
;;    ;; using a Hi-DPI display, uncomment this to double the icon size.
;;    ;;(treemacs-resize-icons 44)
;;
;;    (treemacs-follow-mode t)
;;    (treemacs-filewatch-mode t))
;;  :bind
;;  (:map global-map
;;        ("M-0"       . treemacs-select-window)
;;        ("C-x t 1"   . treemacs-delete-other-windows)
;;        ("C-x t t"   . treemacs)
;;        ("C-x t B"   . treemacs-bookmark)
;;        ("C-x t C-t" . treemacs-find-file)
;;        ("C-x t M-t" . treemacs-find-tag)))

(use-package neotree
  :after all-the-icons
  :commands (neotree-toggle)
  :bind (("C-x C-n" . neotree-toggle))
  :config
  (setq neo-window-position 'right)
  (setq neo-window-width 40)
  (setq neo-smart-open t)
  (setq neo-theme (if (display-graphic-p) 'icons 'arrow)))

(use-package powerline
  :init (powerline-center-theme))

;; Internal border
(set-frame-parameter nil 'internal-border-width 3)

;; Transparent titlebar:
;;   https://github.com/MaxSt/dotfiles/blob/master/emacs.d/config.org#disable-menubar
;;   https://github.com/d12frosted/homebrew-emacs-plus/blob/master/Formula/emacs-plus.rb#L98
;;   https://github.com/d12frosted/homebrew-emacs-plus/issues/55
;;   https://www.gnu.org/software/emacs/manual/html_node/elisp/Properties-in-Mode.html#Properties-in-Mode
(when (memq window-system '(mac ns))
  (add-to-list 'default-frame-alist '(ns-appearance . light))
  (add-to-list 'default-frame-alist '(ns-transparent-titlebar . t)))

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package clean-aindent-mode
  :hook (prog-mode))

(provide 'cursed-ui)
;;; cursed-ui.el ends here
