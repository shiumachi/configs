;; 50_ruby.el
;; 2010/12/31 作成
;; ruby 用設定

;; 2008/10/25
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

