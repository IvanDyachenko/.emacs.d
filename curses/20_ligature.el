;;; 20_ligature.el --- Ligature support              -*- lexical-binding: t; -*-

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

;; Display typographical ligatures in Emacs.
(straight-use-package
 `(ligature :type git
            :host github
            :repo "mickeynp/ligature.el"
            :branch "master"))
(require 'ligature)

;; Free monospaced font with programming ligatures.
(when (member "Fira Code" (font-family-list))
  (set-frame-font "Fira Code 12" nil t))

;; Display typographical ligatures in Emacs.
;; Enables all ligatures for `prog-mode' and any major mode that derives from that mode.
(ligature-set-ligatures
 'prog-mode
 '("$>" "!!" "??" "???" ".." "..." "||" ";;" ";;;" "//" "///" "&&" "%%" "@@" "'''" "\"\"\""
   "==" "!=" ">=" "<=" "===" "!==" "=:=" "=!=" "/=" "/=="
   "**" "***" "/*" "*/" "/**" "**/" "*>" "<*>" "<*"
   "++" "+++" "+=" "=+" "+:" ":+" "++:" ":++" "+>" "<+>" "<+"
   "##" "###" "#=" "#!" "#?" "#:" ":#" "#::" "::#" "#:::" ":::#" "#(" "#[" "]#"
   "::" ":::" ":=" "::=" ":>" "<:" ":<" ">:"
   "=>" "==>" "<=>" "<==" ">=>" "<=<" "=>>" "<<=" "<==>" ">>=" "=<<"
   "->" "<-" "-->" "<->" "<--" "->>" "<<-" ">->" "<-<" ">-" "-<" ">--" "---" "--<" "<!--"
   "~>" "<~>" "<~" "~~>" "<~~" "-~" "~~" "~-"
   ">>" ">>>" "<<" "<<<"
   "<|" "<>" "|>" "</>" "/>" "</"
   ".-" ".=" "~=" "^=" "~@"))

;; Enables ligature checks globally in all buffers.
;; You can also do it per mode with `ligature-mode'.
(global-ligature-mode t)

(provide '20_ligature)
;;; 20_ligature.el ends here
