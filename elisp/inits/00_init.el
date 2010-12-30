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
