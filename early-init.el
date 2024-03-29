;;; early-init.el --- Early cursed initialization file      -*- lexical-binding: t; -*-

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

;; Set the garbage collection threshold higher.
;; References:
;;   - https://www.reddit.com/r/emacs/comments/qw52na/emacs_271_earlyinit_file/
(defvar cursed--file-name-handler-alist file-name-handler-alist)

(setq gc-cons-threshold (* 1024 1024 1024)
      gc-cons-percentage 0.6
      file-name-handler-alist nil)

(add-hook 'emacs-startup-hook
          (lambda ()
            (setq gc-cons-threshold (* 16 1024 1024)
                  gc-cons-percentage 0.1
                  file-name-handler-alist cursed--file-name-handler-alist)))

;; Increase the amount of data which Emacs reads from the process.
;; Again the emacs default is too low 4k considering that the some of the
;; language server responses are in 800k - 3M range.
(setq read-process-output-max (* 1024 1024)) ;; 1mb

;; Avoid outdated byte-compiled elisp files.
;; Non-nil means load prefers the newest version of a file.
(setq load-prefer-newer t)

;; Prevent `package.el' loading packages prior to their init-file loading.
;; References:
;;   - https://github.com/raxod502/straight.el#getting-started
(setq package-enable-at-startup nil)

;; Native compilation settings.
(when (featurep 'native-compile)
  (setq package-native-compile t)		          ;; Enable native compilation of packages.
  (setq native-comp-deferred-compilation t)               ;; Asynchroneous compilation.
  (setq native-comp-async-report-warnings-errors 'silent) ;; Report warning and errors silently.
  (add-to-list 'native-comp-eln-load-path (expand-file-name "eln-cache/" user-emacs-directory)))

;; Remove unnecessary graphical elements.
(tooltip-mode    -1) ;; Turn off pop-up.
(tool-bar-mode   -1) ;; Turn off toolbar.
(menu-bar-mode   -1) ;; Turn off menubar.
(scroll-bar-mode -1) ;; Turn off native OS scrollbar.

(setq visible-bell             t) ;; Turn off sound.
(setq ring-bell-function 'ignore)

(setq widget-image-enable           nil) ;; Disable ugly button for checkboxes.
(setq initial-scratch-message       nil) ;; Don't insert instructions in the *scratch* buffer.
(setq mouse-wheel-progressive-speed nil) ;; Don't accelerate scrolling.
;;; early-init.el ends here
