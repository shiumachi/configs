;; 2008/9/16
;; ;; http://d.hatena.ne.jp/yuko1658/20071213/1197517201
(add-to-list 'load-path "~/elisp/")

;; global variable
;; カーソルの点滅を止める
(blink-cursor-mode nil)

;; カーソルの位置が何文字目かを表示する
(column-number-mode t)

;; モードラインに時間を表示する
(display-time-mode t)

;; バックアップファイルを作らない
(setq backup-inhibited t)

;; 対応する括弧を光らせる。
(show-paren-mode t)

;; 色を付ける
;; '(global-font-lock-mode t)

;; スタートアップスクリーンを表示しない
(setq inhibit-startup-screen t)

;; 終了時にオートセーブファイルを消す
(setq delete-auto-save-files t)

;; 補完時に大文字小文字を区別しない
(setq completion-ignore-case t)

;; 強力な補完機能を使う
(partial-completion-mode 1)

;; 補完可能なものを随時表示
;; 少しうるさい
(icomplete-mode 1)

;; カーソルの位置が何行目かを表示する
(line-number-mode t)

;; スクロールを一行ずつにする
(setq scroll-step 1)

;; スクロールバーを右側に表示する
(set-scroll-bar-mode 'right)

;; 行の先頭でC-kを一回押すだけで行全体を消去する
(setq kill-whole-line t)

;; バッファの最後でnewlineで新規行を追加するのを禁止する
(setq next-line-add-newlines nil)

;; 最終行に必ず一行挿入する
(setq require-final-newline t)

;; 一行が 80 字以上になった時には自動改行する
(setq fill-column 80)
(setq-default auto-fill-mode t)

;; emacs -nw で起動した時にメニューバーを消す
(if window-system (menu-bar-mode 1) (menu-bar-mode -1))

;; 圧縮されたファイルも編集できるようにする
(auto-compression-mode t)

;; タイトルバーにファイル名を表示する
(setq frame-title-format (format "emacs@%s : %%f" (system-name)))

;; 現在の関数名をモードラインに表示
(which-function-mode 1)

;; 略語定義ファイルの読み込み
;; ~/elisp/.abbrev_defsが存在していなかったら読み込まない
;; change directory from site-lisp to elisp
(let ((file "~/elisp/.abbrev_defs"))
  (setq abbrev-file-name file)
  (if (file-exists-p file)
;;       (quietly-read-abbrev-file file)))
      (read-abbrev-file file)))

;; 略語定義が変更されていたら黙って保存
(setq save-abbrevs 'silently)

;; デフォルトでAbbrevモードにする
(setq default-abbrev-mode t)

;; 最終更新日の自動挿入
;;   ファイルの先頭から 8 行以内に Time-stamp: <> または
;;   Time-stamp: " " と書いてあれば、セーブ時に自動的に日付が挿入される
(require 'time-stamp)

;; 日本語で日付を入れたくないのでlocaleをCにする
(defun time-stamp-with-locale-c ()
  (let ((system-time-locale "C"))
    (time-stamp)
    nil))

(if (not (memq 'time-stamp-with-locale-c write-file-hooks))
    (add-hook 'write-file-hooks 'time-stamp-with-locale-c))

(setq time-stamp-format "%3a %3b %02d %02H:%02M:%02S %Z %:y")

;; 画像ファイルを表示する
(auto-image-file-mode t)

;; セッションを保存する
;; 初めは手動でM-x desktop-saveしなければいけない
(desktop-load-default)
(desktop-read)

;; 次のGCまでに使用可能なバイト数
(setq gc-cons-threshold 4096000)

;; 最近使ったファイルを保存(M-x recentf-open-filesで開く)
(recentf-mode)

 ;; 2007/11/18
 ;; cvs用キーバインド
 (global-set-key "\M-s" 'cvs-status)

 ;; 2007/12/23
 ;; カラーテーマ用
 ;; http://blog.mizoshiri.com/archives/50
 ;; http://www.emacswiki.org/cgi-bin/wiki/ColorTheme
 (require 'color-theme)
 (color-theme-initialize)
 (color-theme-clarity)

;; 2008/10/25
;; for ruby
;; http://www.goodpic.com/mt/archives2/2005/09/mac_osxemacsrub.html
(autoload 'ruby-mode "ruby-mode"
  "Mode for editing ruby source files" t)
(setq auto-mode-alist
      (append '(("\\.rb$" . ruby-mode)) auto-mode-alist))
(setq interpreter-mode-alist (append '(("ruby" . ruby-mode))
                                     interpreter-mode-alist))
(autoload 'run-ruby "inf-ruby"
  "Run an inferior Ruby process")
(autoload 'inf-ruby-keys "inf-ruby"
  "Set local key defs for inf-ruby in ruby-mode")
(add-hook 'ruby-mode-hook
          '(lambda ()
            (inf-ruby-keys)))
(setq default-frame-alist
      (append
       '((foreground-color . "gray")  ;
         (background-color . "black") ;
         (cursor-color     . "blue")  ;
        )
 default-frame-alist))

;; 2008/12/20
;; http://d.hatena.ne.jp/mzp/20081207/autoerase
;;(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; 2008/12/21
;; http://www.cozmixng.org/~kou/emacs/dot_emacs
;;; キーバインド
;;(define-key global-map "\C-h" 'delete-backward-char) ; 削除
(define-key global-map "\M-?" 'help-for-help)        ; ヘルプ
;; 2008/12/29 comment out
;(define-key global-map "\C-z" 'undo)                 ; undo

;====================================
;;shift+矢印キーでの範囲選択
;====================================
(pc-selection-mode)

;; http://gimite.net/behind/dot.emacs.txt
;; copy with Ctrl + c
(defun win-unselect ()
  (transient-mark-mode -1)
  (setq win-sel-v nil))
;(defun win-copy (BEG END)
;  (interactive (list (region-beginning) (region-end)))
;  (copy-region-as-kill BEG END)
;  (win-unselect))
;(global-set-key "\C-c" 'win-copy)

;; http://at-aka.blogspot.com/2006/04/emacs-ispell.html
;; 辞書補完機能
;; C-h prefix
(define-key help-map "/" 'ispell-complete-word)

;; http://d.hatena.ne.jp/higepon/20060107/1136628498
;; GLOBAL用
(autoload 'gtags-mode "gtags" "" t)
(setq gtags-mode-hook
      '(lambda ()
         (local-set-key "\M-t" 'gtags-find-tag)
         (local-set-key "\M-r" 'gtags-find-rtag)
         (local-set-key "\M-s" 'gtags-find-symbol)
         (local-set-key "\C-t" 'gtags-pop-stack)
         ))
(add-hook 'c-mode-common-hook
          '(lambda()
             (gtags-mode 1)
             ))

;; 2008/02/03
;; JF
(require 'jf-info-check)

;; 2010/03/14
(require 'auto-complete)
(global-auto-complete-mode t)
(setq ac-sources '(ac-source-abbrev ac-source-words-in-buffer))

;;(add-to-list 'ac-dictionary-directories "~/elisp/ac-dict")
;;(require 'auto-complete-config)
;;(ac-config-default)

(setq auto-mode-alist (cons '("\\.py$" . python-mode) auto-mode-alist))
(setq interpreter-mode-alist (cons '("python" . python-mode) interpreter-mode-alist))
(autoload 'python-mode "python-mode" "Python editing mode." t)

;; 2010/03/25
;; http://sites.google.com/site/steveyegge2/effective-emacs
(global-set-key "\C-x\C-m" 'execute-extended-command)
(global-set-key "\C-w" 'backward-kill-word)
(global-set-key "\C-x\C-k" 'kill-region)

;; 2010/03/28
;; http://ubulog.blogspot.com/2007/06/emacs.html
;====================================
; 最近使ったファイル」を（メニューに）表示する
;====================================
; M-x recentf-open-files で履歴一覧バッファが表示される。
(require 'recentf)
;;http://homepage.mac.com/zenitani/elisp-j.html#recentf
;; /sudo:hogehoge などが履歴に残っていると、起動時に毎回パ
;; スワードを聞いてくるのでその履歴だけを削除する。
;;(setq recentf-exclude '("^/[^/:]+:")) ;;tramp対策。
(setq recentf-auto-cleanup 'never) ;;tramp対策。
(recentf-mode 1)
(global-set-key "\C-xf" 'recentf-open-files) ;;履歴一覧を開く。

;;;====================================
;;;; Buffer 設定
;;;===================================
;;; iswitchb は、バッファ名の一部の文字を入力することで、
;;; 選択バッファの絞り込みを行う機能を実現します。
;;; バッファ名を先頭から入力する必要はなく、とても使いやすくなります。
(iswitchb-mode 1) ;;iswitchbモードON
;;; C-f, C-b, C-n, C-p で候補を切り替えることができるように。
(add-hook 'iswitchb-define-mode-map-hook
      (lambda ()
        (define-key iswitchb-mode-map "\C-n" 'iswitchb-next-match)
        (define-key iswitchb-mode-map "\C-p" 'iswitchb-prev-match)
        (define-key iswitchb-mode-map "\C-f" 'iswitchb-next-match)
        (define-key iswitchb-mode-map "\C-b" 'iswitchb-prev-match)))

;; 2010/04/06
;; メール機能の代わりに行移動
(global-set-key "\C-xm" 'goto-line)

;; 2010/04/29
;; magit
;; http://d.hatena.ne.jp/gom68/20090524/1243170341
(add-to-list 'load-path "~/elisp/magit/share/emacs/site-lisp/")
(require 'magit)
(global-set-key "\C-cg" 'magit-status)

;; 2010/06/13
;; multi-term
;; http://sakito.jp/emacs/emacsshell.html
(require 'multi-term)
(setq multi-term-program shell-file-name)
(add-to-list 'term-unbind-key-list '"M-x")
(add-hook 'term-mode-hook
         '(lambda ()
                         (define-key term-raw-map (kbd "C-h") 'term-send-backspace)
                         (define-key term-raw-map (kbd "C-y") 'term-paste)
          ))
(global-set-key (kbd "C-c t") '(lambda ()
                                (interactive)
                                (if (get-buffer "*terminal<1>*")
                                    (switch-to-buffer "*terminal<1>*")
                                (multi-term))))


;; 2010/06/30
;; for Processing
(setq auto-mode-alist (cons '("\\.pde$" . java-mode) auto-mode-alist))

;; 2010/10/20
;; org-mode
;; http://d.hatena.ne.jp/tamura70/20100203/org
;; キーバインドの設定
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(define-key global-map "\C-cr" 'org-remember)
;; 拡張子がorgのファイルを開いた時，自動的にorg-modeにする
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
;; 見出しの余分な*を消す
(setq org-hide-leading-stars t)
;; org-default-notes-fileのディレクトリ
(setq org-directory "~/doc/org/")
;; org-default-notes-fileのファイル名
(setq org-default-notes-file "notes.org")
;; TODO状態
(setq org-todo-keywords
      '((sequence "TODO(t)" "WAIT(w)" "|" "DONE(d)" "SOMEDAY(s)")))
;; DONEの時刻を記録
(setq org-log-done 'time)

;; 2010/10/30
;; org-mode でデフォルト折り返し
;; http://osdir.com/ml/emacs-orgmode-gnu/2009-04/msg00618.html
(add-hook 'org-mode-hook
	  (lambda()(setq truncate-lines nil)))

;; 2010/10/24
;; for waf
(setq auto-mode-alist (cons '("wscript" . python-mode) auto-mode-alist))

;; 2010/10/25
;; cscope
;; http://namikister.blog101.fc2.com/blog-entry-9.html
(require 'xcscope)

;; 2010/12/30
;; http://www.bookshelf.jp/soft/meadow_30.html#SEC419
(defun my-window-size-save ()
  (let* ((rlist (frame-parameters (selected-frame)))
         (ilist initial-frame-alist)
         (nCHeight (frame-height))
         (nCWidth (frame-width))
         (tMargin (if (integerp (cdr (assoc 'top rlist)))
                      (cdr (assoc 'top rlist)) 0))
         (lMargin (if (integerp (cdr (assoc 'left rlist)))
                      (cdr (assoc 'left rlist)) 0))
         buf
         (file "~/.framesize.el"))
    (if (get-file-buffer (expand-file-name file))
        (setq buf (get-file-buffer (expand-file-name file)))
      (setq buf (find-file-noselect file)))
    (set-buffer buf)
    (erase-buffer)
    (insert (concat
             ;; 初期値をいじるよりも modify-frame-parameters
             ;; で変えるだけの方がいい?
             "(delete 'width initial-frame-alist)\n"
             "(delete 'height initial-frame-alist)\n"
             "(delete 'top initial-frame-alist)\n"
             "(delete 'left initial-frame-alist)\n"
             "(setq initial-frame-alist (append (list\n"
             "'(width . " (int-to-string nCWidth) ")\n"
             "'(height . " (int-to-string nCHeight) ")\n"
             "'(top . " (int-to-string tMargin) ")\n"
             "'(left . " (int-to-string lMargin) "))\n"
             "initial-frame-alist))\n"
             ;;"(setq default-frame-alist initial-frame-alist)"
             ))
    (save-buffer)
    ))

(defun my-window-size-load ()
  (let* ((file "~/.framesize.el"))
    (if (file-exists-p file)
        (load file))))

(my-window-size-load)

;; Call the function above at C-x C-c.
(defadvice save-buffers-kill-emacs
  (before save-frame-size activate)
  (my-window-size-save))

;;2007/11/5
;;Emacs で C 言語プログラミングを始める人へのイントロダクション
;;flyspell-prog-mode(自動ispell機能)
;;(add-hook 'c-mode-common-hook
;;          '(lambda ()
;;             ;; flyspell-prog-mode をオンにする
;;             (flyspell-prog-mode)
;;))
