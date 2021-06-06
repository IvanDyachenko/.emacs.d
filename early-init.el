;;; early-init.el --- early cursed initialization file      -*- lexical-binding: t; -*-

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

;; Set the garbage collection threshold higher.
(setq gc-cons-threshold 100000000) ;; 100mb

;; Increase the amount of data which Emacs reads from the process.
;; Again the emacs default is too low 4k considering that the some of the
;; language server responses are in 800k - 3M range.
(setq read-process-output-max (* 1024 1024)) ;; 1mb

;; Maximize Emacs frame on start-up.
;; https://emacs.stackexchange.com/a/3008
;; (add-to-list 'default-frame-alist '(fullscreen . maximized))

(tool-bar-mode                    -1) ;; Turn off toolbar.
(menu-bar-mode                    -1) ;; Turn off menubar.
(scroll-bar-mode                  -1) ;; Turn off scrollbar.
(blink-cursor-mode                -1) ;; Turn off blink.
(column-number-mode                1) ;; Show column number.
;;(global-hl-line-mode             1) ;; Highlight current line.
(global-display-line-numbers-mode  t) ;; Show line number.

(setq frame-title-format             "%b") ;; ...
(setq frame-resize-pixelwise            t) ;; Fully maximize frames.
(setq visible-bell                      t) ;; Turn off sound.
(setq ring-bell-function          'ignore) ;;
(setq initial-scratch-message         nil) ;; Don't insert instructions in the *scratch* buffer
(setq mouse-wheel-progressive-speed   nil) ;; Don't accelerate scrolling.
(setq widget-image-enable             nil) ;; Disable ugly button for checkboxes.

;; Reverse video by default:
;; - https://stackoverflow.com/a/19757155/5592388
;;(add-to-list 'default-frame-alist '(reverse . t))
;;(setq initial-frame-alist default-frame-alist)

;; Yes/no questions become y/n questions.
(defalias 'yes-or-no-p 'y-or-n-p)

(setq-default indent-tabs-mode nil) ;; Use space instead of tabs when indenting.

;; https://www.emacswiki.org/emacs/SavePlace
(save-place-mode 1)

;;; early-init.el ends here
