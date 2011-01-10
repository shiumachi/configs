;; 00_init.el
;; 2010/12/30 作成
;; 他のファイルに属さない、emacsの基本設定をここに記載する。

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

;; 圧縮されたファイルも編集できるようにする
(auto-compression-mode t)

;; タイトルバーにファイル名を表示する
(setq frame-title-format (format "emacs@%s : %%f" (system-name)))

;; 現在の関数名をモードラインに表示
(which-function-mode 1)

;; 画像ファイルを表示する
(auto-image-file-mode t)

;; セッションを保存する
;; 初めは手動でM-x desktop-saveしなければいけない
(desktop-load-default)
(desktop-read)

;; 次のGCまでに使用可能なバイト数
(setq gc-cons-threshold 4096000)

;; 最近使ったファイルを保存(M-x recentf-open-filesで開く)
(recentf-mode t)
;;http://homepage.mac.com/zenitani/elisp-j.html#recentf
;; /sudo:hogehoge などが履歴に残っていると、起動時に毎回パ
;; スワードを聞いてくるのでその履歴だけを削除する。tramp対策。
(setq recentf-auto-cleanup 'never)

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

;;====================================
;; Buffer 設定
;;===================================
;; iswitchb は、バッファ名の一部の文字を入力することで、
;; 選択バッファの絞り込みを行う機能を実現します。
;; バッファ名を先頭から入力する必要はなく、とても使いやすくなります。
;; iswitchbモードON
(iswitchb-mode t) 
;; C-f, C-b, C-n, C-p で候補を切り替えることができるように。
(add-hook 'iswitchb-define-mode-map-hook
      (lambda ()
        (define-key iswitchb-mode-map "\C-n" 'iswitchb-next-match)
        (define-key iswitchb-mode-map "\C-p" 'iswitchb-prev-match)
        (define-key iswitchb-mode-map "\C-f" 'iswitchb-next-match)
        (define-key iswitchb-mode-map "\C-b" 'iswitchb-prev-match)))

;; http://www.bookshelf.jp/soft/meadow_24.html#SEC263
(require 'saveplace)
(setq-default save-place t)
