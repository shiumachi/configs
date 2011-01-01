;; 50_org.el
;; 2011/01/01 作成
;; org-mode 用設定

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

