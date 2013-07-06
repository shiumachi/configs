;; 01_keybinds.el
;; 2010/12/31 作成
;; キーバインドはここに記載する。

;; 2007/11/18
;; cvs用キーバインド
(global-set-key "\M-s" 'cvs-status)

;; 2010/04/06
;; メール機能の代わりに行移動
(global-set-key "\C-xm" 'goto-line)

;; ヘルプを表示する
(global-set-key "\M-?" 'help-for-help)

;;履歴一覧を開く。
(global-set-key "\C-xf" 'recentf-open-files) 

;; 2010/03/25
;; http://sites.google.com/site/steveyegge2/effective-emacs
(global-set-key "\C-x\C-m" 'execute-extended-command)
(global-set-key "\C-w" 'backward-kill-word)
(global-set-key "\C-x\C-k" 'kill-region)

;; http://scriptlife.hacca.jp/tips/emacs.html
;; 改行時オートインデント
(global-set-key "\C-m" 'newline-and-indent)

(global-set-key "\C-h" 'delete-backward-char)
