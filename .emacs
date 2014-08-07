;; 2008/9/16
;; ;; http://d.hatena.ne.jp/yuko1658/20071213/1197517201
(add-to-list 'load-path "~/elisp/")
(add-to-list 'load-path "/usr/local/share/emacs/site-lisp")

;; auto-install.el
;; http://d.hatena.ne.jp/higepon/20120219/1329636071
(require 'auto-install)
(setq auto-install-directory "~/configs/elisp/auto-install/")
(add-to-list 'load-path "~/configs/elisp/auto-install/")

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
 '(rst-level-1-face ((t (:background "controlDarkShadowColor" :foreground "LightSkyBlue"))) t)
 '(rst-level-2-face ((t (:background "controlDarkShadowColor" :foreground "LightGoldenrod"))) t)
 '(rst-level-3-face ((t (:background "controlDarkShadowColor" :foreground "Cyan1"))) t)
 '(rst-level-4-face ((t (:background "controlDarkShadowColor" :foreground "chocolate1"))) t)
 '(rst-level-5-face ((t (:background "controlDarkShadowColor" :foreground "PaleGreen"))) t)
 '(rst-level-6-face ((t (:background "controlDarkShadowColor" :foreground "Aquamarine"))) t))
;; (rst-level-7-face ((t (:foreground "LightSteelBlue"))) t)  ;; $A%a%b(B
 ;; (rst-level-8-face ((t (:foreground "LightSalmon"))) t)


;; $A6@WTJK$(ILT(B
;; $A1XR*$J%U%!%$%k$OH+$F(Brst-mode$A$G$(Gbd$A$/(B
(setq auto-mode-alist
      (append '(
		("memo.txt$" . rst-mode)
		) auto-mode-alist))

;; troter $AJ=(B

;;(defun eval-after-load 'key-chord
;;  ;; keybind
;;)
;;;; (@* "one key")
;;(defun eval-after-load 'one-key
;;  (global-set-key [(control x) (v)] 'one-key-menu-VC))
;;
;;;; (@* "others")
;;(defun eval-after-load 'flymake
;;  (global-set-key [(control c) (d)] 'flymake-display-err-menu-for-current-line))
;;
;;(defun eval-after-load 'anything-rurima
;;  (global-set-key [(control c) (r)] 'anything-rurima)
;;  (global-set-key [(control c) (control r)] 'anything-rurima-at-point))
;;
;;(defun eval-after-load 'popwin
;;  (global-set-key [(control x) (control p)] popwin:keymap))
;;
;;;(global-set-key "\C-z" 'undo)                       ;;UNDO
;;(global-set-key [f1] 'one-key-menu-help)
;;
;;;; window switch
;;(global-set-key [(meta \[)] (lambda () (interactive) (other-window -1)))
;;(global-set-key [(meta \])] (lambda () (interactive) (other-window 1)))
;;
;;(global-set-key [(control x) (control r)] 'reopen-file)
;;(global-set-key [(control x) (J)] 'open-junk-file)
;;
;;;; open
;;(when (functionp 'cygstart)
;;  (global-set-key [(control c) (control f)] 'cygstart))
;;


;; Go $AQT$(Gk#$ASC(B
(require 'go-mode-load)
(add-hook 'go-mode-hook
          '(lambda()
            (setq c-basic-offset 4)
            (setq indent-tabs-mode t)
            (local-set-key (kbd "M-.") 'godef-jump)
            (local-set-key (kbd "C-c C-r") 'go-remove-unused-imports)
            (local-set-key (kbd "C-c i") 'go-goto-imports)
            (local-set-key (kbd "C-c d") 'godoc)
	    ))

(add-hook 'before-save-hook 'gofmt-before-save)

;; lisp $ASC(B
(setq inferior-lisp-program "clisp")


;;; http://d.hatena.ne.jp/cou929_la/20110525/1306321857
;;; flymake for python
;;(add-hook 'find-file-hook 'flymake-find-file-hook)
;;(when (load "flymake" t)
;;  (defun flymake-pyflakes-init ()
;;    (let* ((temp-file (flymake-init-create-temp-buffer-copy
;;                       'flymake-create-temp-with-folder-structure))
;;           (local-file (file-relative-name
;;                        temp-file
;;                        (file-name-directory buffer-file-name))))
;;      (list "~/bin/pychecker"  (list local-file))))
;;  (add-to-list 'flymake-allowed-file-name-masks
;;               '("\\.py\\'" flymake-pyflakes-init)))
;;(load-library "flymake-cursor")

(add-to-list 'load-path "~/elisp/ess-13.09/lisp")
(require 'ess-site)

;(set-default-font "-adobe-courier-bold-r-normal--*-140-*-*-m-*-iso8859-1")
;(global-font-lock-mode t)                                        ; S/R   TeX
;(set-face-foreground 'font-lock-comment-face       "Firebrick")  ; #com  %com
;(set-face-foreground 'font-lock-string-face         "SeaGreen")  ; "str" "str"
;(set-face-foreground 'font-lock-keyword-face      "MediumBlue")  ; if    \end
;(set-face-foreground 'font-lock-constant-face      "VioletRed")  ; fun<- {ctr}
;(set-face-foreground 'font-lock-type-face      "DarkGoldenrod")  ; T,F    ?
;(set-face-foreground 'font-lock-variable-name-face      "Blue")  ; xv
;
;(set-face-foreground 'font-lock-function-name-face "VioletRed")  ; <-    {eq1}

;;(setq auto-mode-alist
;;     (cons (cons "\\.[rR]$" 'r-mode) auto-mode-alist))
;;(autoload 'R-mode "ess-site" "Emacs Speaks Statistics mode" t)
;;(setq auto-mode-alist (cons '("\\.R$" . r-mode) auto-mode-alist))


(setq auto-mode-alist
      (append '((".R$" . r-mode)) auto-mode-alist)
      )

;; Clozure CL$A$r%G%U%)%k%H$N(BCommon Lisp$B=h$A@mO5$K$(G]C$A6((B
(setq inferior-lisp-program "ccl")
;; ~/.emacs.d/slime$A$r(Bload-path$A$KW7<S(B
(add-to-list 'load-path (expand-file-name "~/configs/elisp/slime"))
;; SLIME$A$N%m$B!<$A%I(B
(require 'slime)
(slime-setup '(slime-repl slime-fancy slime-banner))

;; auto-complete.el
(require 'auto-complete-config)
(ac-config-default)

;; auto-complete for slime
(require 'ac-slime)
(add-hook 'slime-mode-hook 'set-up-slime-ac)
(add-hook 'slime-repl-mode-hook 'set-up-slime-ac)
(eval-after-load "auto-complete"
  '(add-to-list 'ac-modes 'slime-repl-mode))

;; http://qiita.com/ironsand/items/749b032d33d389972b4b
(defun revert-buffer-no-confirm (&optional force-reverting)
  "Interactive call to revert-buffer. Ignoring the auto-save
 file and not requesting for confirmation. When the current buffer
 is modified, the command refuses to revert it, unless you specify
 the optional argument: force-reverting to true."
  (interactive "P")
  ;;(message "force-reverting value is %s" force-reverting)
  (if (or force-reverting (not (buffer-modified-p)))
      (revert-buffer :ignore-auto :noconfirm)
    (error "The buffer has been modified")))

;; reload buffer
(global-set-key "\M-r" 'revert-buffer-no-confirm)

;; yaml-mode
;; https://github.com/yoshiki/yaml-mode
(require 'yaml-mode)
  (add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
  (add-to-list 'auto-mode-alist '("\\.yaml$" . yaml-mode))(add-hook 'yaml-mode-hook
      '(lambda ()
        (define-key yaml-mode-map "\C-m" 'newline-and-indent)))

;; http://moya-notes.blogspot.jp/2013/02/emacs24-config-on-mac.html#bg
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; [$A;y1>(B] $A13>0I+!$M8$(Gg4(B
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; $A13>0I+$(G]C$A6((B
(custom-set-faces
 '(default ((t (:background "#000022" :foreground "#EEEEEE"))))
 '(cursor (
           (((class color) (background dark )) (:background "#00AA00"))
           (((class color) (background light)) (:background "#999999"))
           (t ())
           )))
;; $A%U%l$B!<$A%`M8$(Gg4]C$A6((B
(add-to-list 'default-frame-alist '(alpha . (0.75 0.75)))
