;;; jf-info-check.el -- check JF info file

;;; Copyright (C) 2001 JF Project <JF@linux.or.jp>

;;; Maintainer: JF Project <JF@linux.or.jp>
;;; Version: $Id: jf-info-check.el,v 1.8 2004/01/28 11:34:40 mdk Exp $

;;; This program is free software; you can redistribute it and/or modify
;;; it under the terms of the GNU General Public License as published by
;;; the Free Software Foundation; either version 2 of the License, or
;;; (at your option) any later version.

;;; This program is distributed in the hope that it will be useful,
;;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;;; GNU General Public License for more details.

;;; You should have received a copy of the GNU General Public License
;;; along with this program; if not, write to the Free Software
;;; Foundation, Inc., 59 Temple Place - Suite 330, Boston, 
;;; MA 02111-1307, USA.


;;; Commentary:
;;;
;;;  [設定]
;;;
;;;   次の行を ~/.emacs.el に追加してください.
;;;
;;;   (require 'jf-info-check)
;;;
;;;  [つかいかた]
;;;       
;;;   1. カレントバッファに info ファイルを読み込む.
;;;
;;;   2. M-x jf-info-check
;;;

;;; Code:

(defvar jf-info-check-must-keyword-list
  '("TITL" "KIND" "ATRB" "NAME" "DSRC" "JDAT" "ITEM"
    "AUTH" "COPY" "STAT" "CONT"))

(defvar jf-info-check-must-trans-list  
  '("BDAT" "TRNS"))

(defvar jf-info-check-must-kdoc-keyword-list
  '("TITL" "NAME" "JDAT" "BVER" "AUTH" "TRNS" "CONT"))

(defvar jf-info-check-kind-alist  
  '(("LDP-TRANS") ("OTHER-TRANS") ("ORIGINAL") ("LILO-doc")))

(defvar jf-info-check-trans-alist  
  '(("LDP-TRANS") ("OTHER-TRANS")))

(defvar jf-info-check-atrb-alist  
  '(("HOWTO") ("MINI") ("BOOK") ("FAQ") ("MISC")))

(defvar jf-info-check-dsrc-alist  
  '(("SGML") ("XML") ("TXT") ("HTML") ("TEX") ("DVI") ("ROFF")))

(defvar jf-info-check-item-alist  
  '(("install") ("faq") ("guide") ("hardware") ("diskmanage")
    ("filesystem") ("dtp") ("network") ("database") ("xfree")
    ("tool") ("kernel") ("programming") ("etc") ("archived")))

(defvar jf-info-check-copy-alist  
  '(("GPL2") ("GPL2-like") ("GFDL") ("LDP") ("NO-COM") 
    ("COM-PERM") ("OTHER") ("NOTHING")))

(defvar jf-info-check-stat-alist  
  '(("Sent") ("Unreachable") ("OK") ("Prohibited") ("Suspend")))

(defvar jf-info-check-key-alist 
  '(("Install") ("INDEX") ("FAQ") ("CDROM") ("Ethernet")
    ("Ftape") ("IDE") ("keyboard") ("Mouse") ("PCI")
    ("PCMCIA") ("SCSI") ("Serial") ("Sound") ("UPS")
    ("Video") ("XFree86") ("Network") ("Mail") ("News")
    ("UUCP") ("BBS") ("Compile") ("Print") ("Kernel")
    ("Boot") ("DOSEMU") ("Game") ("Music") ("Diskspace")
    ("Backup") ("general") ("guide") ("misc")))

(defvar jf-info-check-func-alist
  '(("TITL" . jf-info-check-no-check)
    ("KIND" . jf-info-check-kind-alist)
    ("ATRB" . jf-info-check-atrb-alist)
    ("NAME" . jf-info-check-name-check) 
    ("DSRC" . jf-info-check-dsrc-alist)
    ("JDAT" . jf-info-check-date-check)
    ("ODAT" . jf-info-check-no-check)
    ("BDAT" . jf-info-check-date-check)
    ("ITEM" . jf-info-check-item-alist)
    ("AUTH" . jf-info-check-auth-check)
    ("AUT2" . jf-info-check-auth-check)
    ("AUT3" . jf-info-check-auth-check)
    ("TRNS" . jf-info-check-auth-check)
    ("TRN2" . jf-info-check-auth-check)
    ("TRN3" . jf-info-check-auth-check)
    ("COPY" . jf-info-check-copy-alist)
    ("CPNT" . jf-info-check-no-check)
    ("STAT" . jf-info-check-stat-alist)
    ("CONT" . jf-info-check-no-check)
    ("KEY1" . jf-info-check-key-alist)
    ("KEY2" . jf-info-check-key-alist)
    ("KEY3" . jf-info-check-key-alist)
    ("KEY4" . jf-info-check-key-alist)
    ("KEY5" . jf-info-check-key-alist)
    ("HREF" . jf-info-check-no-check) 
    ("HNAM" . jf-info-check-no-check) 
    ("NOTE" . jf-info-check-no-check)
    ("BVER" . jf-info-check-bver-check)))

(defun jf-info-check()
  "Check JF info file."
  (interactive)
  (let (myinfo-list must-list keyword value line date-error error-message)
    (and (get-buffer  "*jf-info-check*")
	 (kill-buffer "*jf-info-check*"))
    (goto-char (point-min))
    (while (not (eobp))
      (setq line (+ 1 (count-lines (point-min) (point))))
      (cond
       ((looking-at "^$") t)		;blankline
       ((looking-at "^#") t)		;comment
       ((looking-at "^.* +$")
	(jf-info-check-add-error-message
	 (format "%2d 行目: 行末に空白があります.\n" line))
	(and (boundp 'emacs-major-version)
	     (>= emacs-major-version 21)
	     (setq show-trailing-whitespace t)))
       ((not (looking-at "\\([A-Z][A-Z][A-Z][A-Z1-5]\\): \\(.+\\)"))
	(jf-info-check-add-error-message
	 (format "%2d 行目: 間違ってます.\n" line)))
       (t
	(setq keyword
	      (buffer-substring (match-beginning 1) (match-end 1)))
	(setq value
	      (buffer-substring (match-beginning 2) (match-end 2)))
	(and (string-match " *#.*$" value) ;comment
	     (setq value (replace-match "" nil nil value)))
	(cond
	 ((not (assoc keyword jf-info-check-func-alist))
	  (jf-info-check-add-error-message
	   (format 
	    "%2d 行目: キーワード%s:は使えません. %s: の中から選んでください.\n" 
	    line keyword
	    (mapconcat 
	     '(lambda (x) (car x)) jf-info-check-func-alist ":, "))))
	 (t
	  (setq myinfo-list 
		(cons (list keyword value line) myinfo-list)))))) ;cond
      (forward-line 1))			;while

    (setq myinfo-list (reverse myinfo-list))
    (jf-info-check-check-myinfo-list myinfo-list)

    (cond 
     ((assoc "BVER" myinfo-list)
      (setq must-list jf-info-check-must-kdoc-keyword-list))
     ((assoc (nth 1 (assoc "KIND" myinfo-list))
	     jf-info-check-trans-alist)
      (and (not date-error)
	   (assoc "BDAT" myinfo-list)
	   (assoc "JDAT" myinfo-list)
	   (jf-info-check-bdat-check
	    (nth 1 (assoc "BDAT" myinfo-list))
	    (nth 1 (assoc "JDAT" myinfo-list))))
      (setq must-list (append jf-info-check-must-trans-list
			      jf-info-check-must-keyword-list)))
     (t
      (setq must-list jf-info-check-must-keyword-list)))

    (jf-info-check-must-check myinfo-list must-list)
    
    (if error-message
	(jf-info-check-put-message error-message)
      (jf-info-check-put-message 
       "記述の間違いは見つかりませんでした.\n"))))

(defun jf-info-check-check-myinfo-list (myinfo-list)
  "Check myinfo-list."
  (cond 
   ((null myinfo-list) t)
   (t
    (let* ((keyword (nth 0 (car myinfo-list)))
	  (value (nth 1 (car myinfo-list)))
	  (line (nth 2 (car myinfo-list)))
	  (func-or-alist (cdr (assoc keyword jf-info-check-func-alist))))
      (cond
       ((and (boundp func-or-alist)
	     (listp (eval func-or-alist)))
	(jf-info-check-alist-check
	 line value (eval func-or-alist) keyword))
       (t
	(funcall func-or-alist line value))))
    (jf-info-check-check-myinfo-list (cdr myinfo-list)))))

(defun jf-info-check-add-error-message (string)
  "Add string to error-message."
  (setq error-message
	(concat error-message string)))

(defun jf-info-check-put-message (string)
  "Put message to other window."
  (let ((mbuffer (get-buffer-create "*jf-info-check*"))
	(cbuffer (selected-window)))
    (save-excursion
      (get-buffer mbuffer)
      (pop-to-buffer mbuffer)
      (insert string)
      (select-window cbuffer))))

(defun jf-info-check-alist-check (line value alist keyword)
  "Check value in alist or not."
  (or (assoc value alist)
      (let (message)
	(cond
	 ((string-match "KEY[1-5]" keyword)
	  (setq message
		"%2d 行目: %sは推奨されていません. 推奨されるキーワードは%sです.\n"))
	 (t
	  (setq message
		"%2d 行目: %sは使えません. %s の中から選んでください.\n")))
	(jf-info-check-add-error-message
	 (format message line value 
		 (mapconcat '(lambda (x) (car x)) alist ", "))))))

(defun jf-info-check-no-check (line value)
  "Check nothing."
  t)

(defun jf-info-check-name-check (line value)
  "Check NAME value."
  (and (string-match " " value)
       (jf-info-check-add-error-message
	(format 
	 "%2d 行目: %sに空白が含まれているので、ファイル名として扱えません.\n"
	 line value))))

(defun jf-info-check-date-check (line value)
  "Check DATE value."
  (or (string-match "^[12][90][90][0-9]/[01][0-9]/[0-3][0-9]$" value)
      (progn
	(jf-info-check-add-error-message
	 (format 
	  "%2d 行目: %sが間違ってます. YYYY/MM/DD の形式で日付を記入してください.\n" 
	  line value))
	(setq date-error t))))

(defun jf-info-check-auth-check (line value)
  "Check AUTH value."
  (or (string-match "^.+ <.+@.+>$" value)
      (jf-info-check-add-error-message
       (format
	"%2d 行目: %sが間違ってます. 名前 <email-address> の形式で記入してください.\n"
	line value))))

(defun jf-info-check-bver-check (line value)
  "Check BVER value."
  (or (string-match "^2\\.[246]\\.[1-9]?[0-9]$" value)
      (jf-info-check-add-error-message
       (format
	"%2d 行目: %sが間違ってます. 日本語版が元にしているカーネルアーカイヴのバージョンを記入してください.\n"
	line value))))

(defun jf-info-check-bdat-check (bdat jdat)
  "Check BDAT value."
  (or (< (jf-info-check-convert-date-format bdat)
	 (jf-info-check-convert-date-format jdat))
      (jf-info-check-add-error-message
       "BDAT: の日付より JDAT: の日付のほうが古いです.\nBDAT: には原文の日付, JDAT: には翻訳文の日付を記入してください.\n")))
       
(defun jf-info-check-convert-date-format (date)
  "Convert date format string YYYY/MM/DD to number YYYYMMDD."
  (string-match 
   "\\([12][90][90][0-9]\\)/\\([01][0-9]\\)/\\([0-3][0-9]\\)" date)
  (setq date (replace-match "\\1\\2\\3" nil nil date))
  (string-to-number date))

(defun jf-info-check-must-check (myinfo-list must-list)
  "Check must keyword in myinfo-alist."
  (let (keyword)
    (cond
     ((null must-list) t)
     (t
      (setq keyword (car must-list))
      (or (assoc keyword myinfo-list)
	  (jf-info-check-add-error-message
	   (format "キーワード%s:が必要です.\n" keyword)))
      (jf-info-check-must-check myinfo-list (cdr must-list))))))

(provide 'jf-info-check)
