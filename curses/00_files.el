;;; 00_files.el --- Auto-save and backup configuration -*- lexical-binding: t; -*-

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
;; Enable Global Auto-Revert mode for all file buffers.
;; https://www.gnu.org/software/emacs/manual/html_node/emacs/Reverting.html
(global-auto-revert-mode 1)

(defvar cursed--backup-directory
  (concat user-emacs-directory ".backups")
  "The path to the backups directory of cursed files.")

(if (not (file-exists-p cursed--backup-directory))
    (make-directory cursed--backup-directory t))

(defun cursed--make-backup-file-name (fpath)
  "Constructs backup file name from the given FPATH."
  (let ((backup-directory (concat cursed--backup-directory
                                  (format-time-string "%y/%m/%d/")))
        (filename (file-name-nondirectory fpath)))
    (if (not (file-exists-p backup-directory))
        (make-directory backup-directory t ))
    (concat backup-directory filename)))

;; If you set the variable make-backup-file-name-function to a suitable Lisp function,
;; you can override the usual way Emacs constructs backup file names.
;; https://www.gnu.org/software/emacs/manual/html_node/emacs/Backup-Names.html
(setq make-backup-file-name-function #'cursed--make-backup-file-name)

;; Default and per-save backups go here:
(setq backup-directory-alist `(("." . ,cursed--backup-directory)))

;; Auto-save files go here:
(setq auto-save-file-name-transforms `((".*" ,cursed--backup-directory t)))

;; https://stackoverflow.com/questions/151945/how-do-i-control-how-emacs-makes-backup-files
(setq version-control      t) ;; Use version numbers for backups.
(setq backup-by-copying    t) ;; Copy all files, don't rename them.
(setq delete-old-versions  t) ;; Don't ask to delete excess backup versions.
(setq kept-old-versions    5) ;; Number of oldest versions to keep.
(setq kept-new-versions   10) ;; Number of newest versions to keep.
(setq make-backup-files    t) ;; Backup of a file the first time it is saved.
(setq vc-make-backup-files t) ;; Backup versioned files.
(setq auto-save-default    t) ;; Auto-save every buffer that visits a file.

;; Sensitive data
;; (setq auto-mode-alist
;;       (append (list '("\\.\\(vcf\\|gpg\\)$" . sensitive-minor-mode))
;;               auto-mode-alist))

(provide '00_files)
;;; 00_files.el ends here
