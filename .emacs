;; 2008/9/16
;; ;; http://d.hatena.ne.jp/yuko1658/20071213/1197517201
(add-to-list 'load-path "~/elisp/")
(add-to-list 'load-path "/usr/local/share/emacs/site-lisp")

;; 2010/12/30
;; http://tech.kayac.com/archive/divide-dot-emacs.html
;; for separate dotfile
(require 'init-loader)
(init-loader-load "~/elisp/inits")

;; http://d.hatena.ne.jp/higepon/20060107/1136628498
;; GLOBAL$BMQ(B
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

;; 2010/10/24
;; for waf
(setq auto-mode-alist (cons '("wscript" . python-mode) auto-mode-alist))

;; 2010/10/25
;; cscope
;; http://namikister.blog101.fc2.com/blog-entry-9.html
;; (require 'xcscope)


;;2007/11/5
;;Emacs $B$G(B C $B8@8l%W%m%0%i%_%s%0$r;O$a$k?M$X$N%$%s%H%m%@%/%7%g%s(B
;;flyspell-prog-mode($B<+F0(Bispell$B5!G=(B)
;;(add-hook 'c-mode-common-hook
;;          '(lambda ()
;;             ;; flyspell-prog-mode $B$r%*%s$K$9$k(B
;;             (flyspell-prog-mode)
;;))

(desktop-save-mode t)

;; 2011/04/06
;; macosx $BMQ@_Dj(B
;; http://journal.mycom.co.jp/column/osx/079/index.html
(setq exec-path (cons "/bin" exec-path))
(setq exec-path (cons "/usr/bin" exec-path))
(setq exec-path (cons "/usr/local/bin" exec-path))
(setenv "PATH" (concat "/usr/local/bin:" (getenv "PATH")))

;; 2011/04/07
;; macosx $BMQ@_Dj(B
;; $B%U%)%s%H$r8+$d$9$/$9$k(B
;; http://sakito.jp/emacs/emacs23.html

(when (>= emacs-major-version 23)
 (set-face-attribute 'default nil
                     :family "monaco"
                     :height 140)
 (set-fontset-font
  (frame-parameter nil 'font)
  'japanese-jisx0208
  '("Hiragino Maru Gothic Pro" . "iso10646-1"))
 (set-fontset-font
  (frame-parameter nil 'font)
  'japanese-jisx0212
  '("Hiragino Maru Gothic Pro" . "iso10646-1"))
 (set-fontset-font
  (frame-parameter nil 'font)
  'mule-unicode-0100-24ff
  '("monaco" . "iso10646-1"))
 (setq face-font-rescale-alist
      '(("^-apple-hiragino.*" . 1.2)
        (".*osaka-bold.*" . 1.2)
        (".*osaka-medium.*" . 1.2)
        (".*courier-bold-.*-mac-roman" . 1.0)
        (".*monaco cy-bold-.*-mac-cyrillic" . 0.9)
        (".*monaco-bold-.*-mac-roman" . 0.9)
        ("-cdac$" . 1.3))))

;; macosx $BMQ@_Dj(B
;; http://d.hatena.ne.jp/Watson/20100207/1265476938
(define-key global-map [?,A%(B] [?\\])  ;; ,A%$A$N4z$o$j$K%P%C%/%9%i%C%7%e$rHkA&$9$k(B

;; http://d.hatena.ne.jp/bander/20080321/p4
(global-set-key [mouse-1] 'browse-url-at-mouse)

;; http://d.hatena.ne.jp/ymotongpoo/20101106/1289007403
;; Emacs$AFp$(GY/Uk$A$K(Brst.el$A$r$BFI$A$_$B9~$A$_(B
(require 'rst)
;; $(I)/$(GZ/$AWS$N(B*.rst, *.rest$A$N%U%!%$%k$r(Brst-mode$A$G$(Gbd$A$/(B
(setq auto-mode-alist
      (append '(("\\.rst$" . rst-mode)
		("\\.rest$" . rst-mode)) auto-mode-alist))
;; $A13>0$,$(I9k$A$$$(G^[$A:O$O$3$&$7$J$$$H$(GKD$A3v$7$,$(GKD$A$E$i$$(B
(setq frame-background-mode 'dark)
;; $AH+2?%9%Z$B!<$A%9$G%$%s%G%s%H$7$^$7$g$&(B
(add-hook 'rst-mode-hook '(lambda() (setq indent-tabs-mode nil)))

;; http://d.hatena.ne.jp/LaclefYoshi/20100922/1285125722
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(rst-level-1-face ((t (:foreground "LightSkyBlue"))) t)
 '(rst-level-2-face ((t (:foreground "LightGoldenrod"))) t)
 '(rst-level-3-face ((t (:foreground "Cyan1"))) t)
 '(rst-level-4-face ((t (:foreground "chocolate1"))) t)
 '(rst-level-5-face ((t (:foreground "PaleGreen"))) t)
 '(rst-level-6-face ((t (:foreground "Aquamarine"))) t))
 ;; (rst-level-7-face ((t (:foreground "LightSteelBlue"))) t)  ;; $A%a%b(B
 ;; (rst-level-8-face ((t (:foreground "LightSalmon"))) t)
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(rst-level-face-base-light 50))
