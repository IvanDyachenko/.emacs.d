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
(require 'neotree)
(require 'ace-window)
(require 'ace-jump-mode)

(setq aw-dispatch-always t)

(global-set-key (kbd "M-o")     'ace-window)
(global-set-key (kbd "C-c SPC") 'ace-jump-mode)
(global-set-key (kbd "C-x C-n") 'neotree-toggle)

(setq neo-smart-open           t)
(setq neo-window-width        50)
(setq neo-window-position 'right)

(defun cursed--frame-setup (frame)
  "A workaround for missing `all-the-icons' in `neotree' when starting Emacs in client mode.
References:
  - https://github.com/jaypei/emacs-neotree/issues/194
  - https://emacs.stackexchange.com/questions/24609/determine-graphical-display-on-startup-for-emacs-server-client"
  (if (display-graphic-p frame)
      (setq neo-theme 'icons)))
(mapc 'cursed--frame-setup (frame-list)) ;; Run for already-existing frames (for single instance Emacs).
(add-hook 'after-make-frame-functions 'cursed--frame-setup) ;; Run when a new frame is created (for Emacs in client/server mode).

(provide '20_navigation)
;;; 20_navigation.el ends here
